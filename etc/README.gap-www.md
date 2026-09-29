# www.gap-system.org

The GAP website itself: a Jekyll site built from this repository. See
[`README.server.md`](README.server.md) for the conventions shared with the other
two sites.

    ssh gap-www          # www-gap-systems@www-admin13.rz.rptu.de

## What is where

```
/srv/www/www-gap-systems/data/       (== ~/data; ~/http is the document root)
├── http/                    document root; the Jekyll build output
├── GapWWW/                  git clone of this repository, branch master
├── gap-website.trigger      touched by webhook.php to request an update
├── webhook.secret           the shared secret, see below; not in git
├── ForumArchive/            symlinked into http/ by etc/update.sh
└── ForumArchive2/
~/.config/systemd/user/gap-website.{path,service}
```

The clone is owned by `www-gap-systems:www-gap-systems`.

## How an update happens

1. Something is pushed to `master` of this repository.
2. GitHub calls the webhook at <https://www.gap-system.org/webhook.php>, which
   is `webhook.php` from the top of this repository, served from the document
   root.
3. `webhook.php` checks the signature and, for a push event, `touch`es
   `~/data/gap-website.trigger`. That is all it does — it deliberately runs no
   code itself.
4. `gap-website.path`, a systemd user unit watching that file, notices and
   starts `gap-website.service`.
5. That runs [`update.sh`](update.sh): it resets the clone to `origin/master`,
   re-appends the webhook secret to `.htaccess`, runs `bundle install`, builds
   the site with Jekyll into `~/http`, and restores the `ForumArchive` symlinks.

Note step 5 resets hard and rebuilds unconditionally; the webhook payload is not
inspected beyond checking that it is a push.

## The webhook secret

The secret lives only on the server, in `~/data/webhook.secret`, as a single
line of Apache configuration:

    SetEnv GITHUB_WEBHOOK_SECRET "MY_SECRET"

`update.sh` appends this file to `.htaccess` after every `git reset --hard`,
which is how the setting survives without the secret ever being committed. The
side effect is that the working tree is permanently dirty in `.htaccess`, which
is why the script resets rather than pulls.

The same value must be set at
<https://github.com/gap-system/GapWWW/settings/hooks>, where the webhook should
be configured as:

- Payload URL: <https://www.gap-system.org/webhook.php>
- Content type: `application/x-www-form-urlencoded` (TODO: switch to JSON?)
- Secret: matching `GITHUB_WEBHOOK_SECRET`
- SSL verification enabled
- Trigger: just the push event

If `GITHUB_WEBHOOK_SECRET` is not set at all, `webhook.php` skips the signature
check entirely rather than failing, so a lost secret does not break updates — it
silently makes the endpoint unauthenticated. Worth remembering when debugging.

## Troubleshooting

    systemctl --user status gap-website.service gap-website.path
    journalctl --user -f -u 'gap-website.*'

If systemd reports that the units do not exist, reinstall them:

    cp ~/data/GapWWW/etc/gap-website.* ~/.config/systemd/user/
    systemctl --user daemon-reload
    systemctl --user enable --now gap-website.service gap-website.path

Broken file ownership — typically after poking at the clone as another user —
stops git or Jekyll from writing. As root:

    chown -R www-gap-systems:www-gap-systems ~/data/GapWWW ~/data/http
    touch ~/data/gap-website.trigger
    chown www-gap-systems:www-gap-systems ~/data/gap-website.trigger
    chmod 0664 ~/data/gap-website.trigger

The trigger file needs to be writable by the Apache/PHP user, which is a
different uid from `www-gap-systems`, while being watched by the
`www-gap-systems` systemd session — hence the group-writable mode. This is the
fiddliest part of the whole setup.

## Setting this up from scratch

Requirements beyond the shared ones in [`README.server.md`](README.server.md):
Ruby 2.7 or newer including development headers, and bundler
(`apt install bundler`); PHP, needed only for the webhook.

As root: create the account and virtual host with document root `~/http`, set
`GITHUB_WEBHOOK_SECRET` in the vhost configuration, enable PHP, and
`loginctl enable-linger www-gap-systems`.

Then, as `www-gap-systems` (`sudo -u www-gap-systems -g www-gap-systems bash`):

    ln -s /srv/www/www-gap-systems/data ~/data
    git clone https://github.com/gap-system/GapWWW ~/data/GapWWW
    # otherwise adjust the path in gap-website.service

    touch ~/data/gap-website.trigger
    chmod 0664 ~/data/gap-website.trigger

    # create ~/data/webhook.secret with the SetEnv line described above

    mkdir -p ~/.config/systemd/user/
    cp ~/data/GapWWW/etc/gap-website.* ~/.config/systemd/user/
    systemctl --user daemon-reload
    systemctl --user enable --now gap-website.service gap-website.path

Finally configure the webhook on GitHub as described above, and check that a
push to `master` really does rebuild the site.
