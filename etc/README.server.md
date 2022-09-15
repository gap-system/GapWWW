# Technical info about the web server setup

This document describes how the GAP website hosting is set up, to help
people who need to troubleshoot it or migrate it to a new host.

## Required software on the server

To ensure the required software is installed on the server, run this
(assuming a Debian or Ubuntu based environment):

    apt install git bundler


## Where it is

The server can be reached via SSH:

    ssh www.gap-system.org

There is a dedicated user `www-gap-systems` who owns a clone of the GapWWW
repository at

    /srv/www/www-gap-systems/data/GapWWW

This clone is owned by use `www-gap-systems` and group `www-gap-systems`. If anything goes
wrong with these permissions, they can be fixed via

    chown -R www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/GapWWW

## Automatic updates via webhook

Whenever a change is pushed to the master branch of the GapWWW
repository, GitHub activates a webhook we provide via `webhook.php` at
<https://www.gap-system.org/webhook.php>.

The crucial bit is at the end of this .php file, where an empty file
`/srv/www/www-gap-systems/data/gap-website.trigger` is created. This is detected by a
systemd unit `~/.config/systemd/user/gap-website.path` (a copy of this file is
in the `etc` directory of the GapWWW repository).

This then triggers `~/.config/systemd/user/gap-website.service`
(a copy of this file is in the `etc` directory of the GapWWW repository).

This finally executes `etc/update.sh`, which runs jekyll.


For authentication, we set a secret token in `/srv/www/www-gap-systems/data/webhook.secret`
which looks like this:

    SetEnv GITHUB_WEBHOOK_SECRET "MY_SECRET"

with the actual secret key taking the place of `MY_SECRET`. The same value
must be entered in the GitHub settings at
<https://github.com/gap-system/GapWWW/settings/hooks>.


## Troubleshooting

The following assumes you are logged in as root (resp. used `sudo` to become root)
on the webserver.

If updates stop working, a good first place to look at is this output of this:

    systemctl --user status gap-website.service gap-website.path

This prints a log with extra info. However, it might also say "service not
found". In that case, make sure that `gap-website.service` and
`gap-website.path` are installed and enabled:

    cp /srv/www/www-gap-systems/data/GapWWW/etc/gap-website.* ~/.config/systemd/user
    systemctl --user enable gap-website.service gap-website.path

Also helpful is to study the log for the relevant systemd units

    journalctl --user -f -u "gap-website.*"

A problem that sometimes happens (e.g. if one directly pokes into the git
clone) are broken file permissions which can impede further operations, such
as git pulling updates or jekyll updating the website. To fix these, run the
following as root:

    chown -R www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/GapWWW
    chown -R www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/http

    touch /srv/www/www-gap-systems/data/gap-website.trigger
    chown www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/gap-website.trigger
    chmod 0664 /srv/www/www-gap-systems/data/gap-website.trigger


## Initial setup / what if the server VM is upgraded

### Requirements

- Ubuntu or Debian VM
- Apache 2 (`apt install apache2`)
- Ruby 2.7 or newer, including development headers, and bundler (`apt-get install bundler`)
- PHP (only for the webhook) (`apt install libapache2-mod-php ; a2enmod php7.4`)
- Jekyll (installed via `gem` and `bundler`, see below)


## Further steps as `root`

1. Set up a user `www-gap-systems` in group `www-gap-systems`

2. Set up an Apache2 site with data in `/srv/www/www-gap-systems/data/http/` (or modify the units
   here for alternate locations); ensure `www-gap-systems` owns it, i.e.

        chown -R www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/http

   In the config for that site, make sure to set `GITHUB_WEBHOOK_SECRET` as described
   elsewhere in this file, and enable PHP.
   Of course also set up SSL/TLS and a scheme to update the certificates.


## Further steps as `www-gap-systems`

As `www-gap-systems:www-gap-systems`  (`sudo -u www-gap-systems -g www-gap-systems bash`):

In the `www-gap-systems` home directory add a clone of the `GapWWW` git repository, i.e.,
in `/srv/www/www-gap-systems/data/GapWWW` (otherwise adjust `gap-website.service`). Also do

    touch /srv/www/www-gap-systems/data/gap-website.trigger
    chown www-gap-systems:www-gap-systems /srv/www/www-gap-systems/data/gap-website.trigger
    chmod 0644 /srv/www/www-gap-systems/data/gap-website.trigger

Next install and activate the systemd units:

        cp /srv/www/www-gap-systems/data/GapWWW/etc/gap-website.* ~/.config/systemd/user/
        systemctl --user enable gap-website.service gap-website.path
        systemctl --user start gap-website.service gap-website.path


## On GitHub

Go to <https://github.com/gap-system/GapWWW/settings/hooks> and
make sure the webhook there is setup right:

 - Payload URL: <https://www.gap-system.org/webhook.php>
 - Content-type: `application/x-www-form-urlencoded` (TODO: switch to JSON at some point?)
 - Secret should of course match `GITHUB_WEBHOOK_SECRET` used elsewhere
 - enable SSL validation
 - trigger: "just the push event"
