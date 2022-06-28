<?php

/*
GitHub webhook handler template based on code by Miloslav Hůla (https://github.com/milo)
and extended for the GAP website by Max Horn.

Here is how it works:

Any push to the GapWWW repository triggers this PHP script as a
webhook; this can be configured at
<https://github.com/gap-system/GapWWW/settings/hooks>.

The crucial bit is at the end of this .php file, where an empty file
`/home/gap-www/gap-website.trigger` is created. This is detected by a systemd unit
/etc/systemd/system/gap-website.path (a copy of this file is in the
`etc` directory of the GapWWW repo).

This then triggers /etc/systemd/system/gap-website.service
(a copy of this file is in the `etc` directory of the GapWWW repo).

This finally executes `etc/update.sh`, which runs jekyll.
*/


/*
We set a secret token in /etc/apache2/sites-enabled/gap.conf
via this line: SetEnv GITHUB_WEBHOOK_SECRET "MY_SECRET"
with the actual secret key taking the place of MY_SECRET.
The same value must be entered in the GitHub settings at
<https://github.com/gap-system/GapWWW/settings/hooks>.
*/
$hookSecret = getenv('GITHUB_WEBHOOK_SECRET');

set_error_handler(function($severity, $message, $file, $line) {
    throw new \ErrorException($message, 0, $severity, $file, $line);
});

set_exception_handler(function($e) {
    header('HTTP/1.1 500 Internal Server Error');
    echo "Error on line {$e->getLine()}: " . htmlSpecialChars($e->getMessage());
    die();
});

$rawPost = NULL;

if ($hookSecret !== NULL) {
    if (!isset($_SERVER['HTTP_X_HUB_SIGNATURE'])) {
        throw new \Exception("HTTP header 'X-Hub-Signature' is missing.");
    } elseif (!extension_loaded('hash')) {
        throw new \Exception("Missing 'hash' extension to check the secret code validity.");
    }
    list($algo, $hash) = explode('=', $_SERVER['HTTP_X_HUB_SIGNATURE'], 2) + array('', '');
    if (!in_array($algo, hash_algos(), TRUE)) {
        throw new \Exception("Hash algorithm '$algo' is not supported.");
    }
    $rawPost = file_get_contents('php://input');
    if (!hash_equals($hash, hash_hmac($algo, $rawPost, $hookSecret))) {
        throw new \Exception('Hook secret does not match.');
    }
};

if (!isset($_SERVER['CONTENT_TYPE'])) {
    throw new \Exception("Missing HTTP 'Content-Type' header.");
} elseif (!isset($_SERVER['HTTP_X_GITHUB_EVENT'])) {
    throw new \Exception("Missing HTTP 'X-Github-Event' header.");
}

switch ($_SERVER['CONTENT_TYPE']) {
    case 'application/json':
        $json = $rawPost ?: file_get_contents('php://input');
        break;
    case 'application/x-www-form-urlencoded':
        $json = $_POST['payload'];
        break;
    default:
        throw new \Exception("Unsupported content type: $_SERVER[CONTENT_TYPE]");
}

# Payload structure depends on triggered event
# https://developer.github.com/v3/activity/events/types/
$payload = json_decode($json);
switch (strtolower($_SERVER['HTTP_X_GITHUB_EVENT'])) {
    case 'ping':
        echo 'pong';
        break;
    case 'push':
        // create file to trigger systemd unit which regenerates the website
        exec("echo 'Running gap-website webhook' | logger");
        $status = touch("/home/gap-www/gap-website.trigger");
        exec("echo '   touched /home/gap-www/gap-website.trigger, result $status' | logger");
        echo "touched /home/gap-www/gap-website.trigger, result $status";
        break;
    default:
        header('HTTP/1.0 404 Not Found');
        echo "Event:$_SERVER[HTTP_X_GITHUB_EVENT] Payload:\n";
        print_r($payload); # For debug only. Can be found in GitHub hook log.
        die();
}
