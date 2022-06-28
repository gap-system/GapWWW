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

There is a dedicated user `gap-www` who owns a clone of the GapWWW
repository at

    /home/gap-www/GapWWW

This clone is owned by use `gap-www` and group `gap-www`. If anything goes
wrong with these permissions, they can be fixed via

    chown -R gap-www:gap-www /home/gap-www/GapWWW

## Automatic updates via webhook

Whenever a change is pushed to the master branch of the GapWWW
repository, GitHub activates a webhook we provide via `webhook.php` at
<https://www.gap-system.org/webhook.php>.

The crucial bit is at the end of this .php file, where an empty file
`/home/gap-www/gap-website.trigger` is created. This is detected by a
systemd unit `/etc/systemd/system/gap-website.path` (a copy of this file is
in the `etc` directory of the GapWWW repository).

This then triggers `/etc/systemd/system/gap-website.service`
(a copy of this file is in the `etc` directory of the GapWWW repository).

This finally executes `etc/update.sh`, which runs jekyll.


For authentication, we set a secret token in `/etc/apache2/sites-enabled/www.gap-system.org*`
which looks like this:

    SetEnv GITHUB_WEBHOOK_SECRET "MY_SECRET"

with the actual secret key taking the place of `MY_SECRET`. The same value
must be entered in the GitHub settings at
<https://github.com/gap-system/GapWWW/settings/hooks>.


## Troubleshooting

The following assumes you are logged in as root (resp. used `sudo` to become root)
on the webserver.

If updates stop working, a good first place to look at is this output of this:

    systemctl status gap-website.service

This prints a log with extra info. However, it might also say "service not
found". In that case, make sure that `gap-website.service` and
`gap-website.path` are installed and enabled:

    cp /home/gap-www/GapWWW/etc/gap-website.* /etc/systemd/system/
    systemctl enable gap-website.service gap-website.path

Also helpful is to study the log for the relevant systemd units

    journalctl -f -u "gap-website.*"

A problem that sometimes happens (e.g. if one directly pokes into the git
clone) are broken file permissions which can impede further operations, such
as git pulling updates or jekyll updating the website. To fix these, run the
following as root:

    chown -R gap-www:gap-www /home/gap-www/GapWWW
    chown -R gap-www:gap-www /srv/www/www.gap-system.org

    touch /home/gap-www/gap-website.trigger
    chown gap-www:www-data /home/gap-www/gap-website.trigger
    chmod 0664 /home/gap-www/gap-website.trigger


## Initial setup / what if the server VM is upgraded

### Requirements

- Ubuntu or Debian VM
- Apache 2 (`apt install apache2`)
- Ruby 2.7 or newer, including development headers (`apt-get install ruby-dev`)
- PHP (only for the webhook) (`apt install libapache2-mod-php ; a2enmod php7.4`)
- Jekyll (installed via `gem` and `bundler`, see below)


## Further steps as `root`

1. Set up a user `gap-www` in group `gap-www`

2. Set up an Apache2 site with data in `/srv/www/www.gap-system.org/` (or modify the units
   here for alternate locations); ensure `gap-www` owns it, i.e.

        chown -R gap-www:gap-www /srv/www/www.gap-system.org

   In the config for that site, make sure to set `GITHUB_WEBHOOK_SECRET` as described
   elsewhere in this file, and enable PHP.
   Of course also set up SSL/TLS and a scheme to update the certificates.

4. Install the systemd units

        cp /home/gap-www/GapWWW/etc/gap-website.* /etc/systemd/system/
        systemctl enable gap-website.service gap-website.path


## Further steps as `gap-www`

As `gap-www:gap-www`  (`sudo -u gap-www -g gap-www bash`):

1. In the `gap-www` home directory add a clone of the `GapWWW` git repository, i.e.,
   in `/home/gap-www/GapWWW` (otherwise adjust `gap-website.service`). Also do

        touch /home/gap-www/gap-website.trigger
        chmod 0664 /home/gap-www/gap-website.trigger

2. To ensure all the relevant ruby gems are installed, do this:

        cd /home/gap-www/GapWWW
        bundle config set --local path 'vendor/bundle'
        bundle install


## On GitHub

Go to <https://github.com/gap-system/GapWWW/settings/hooks> and
make sure the webhook there is setup right:

 - Payload URL: <https://www.gap-system.org/webhook.php>
 - Content-type: `application/x-www-form-urlencoded` (TODO: switch to JSON at some point?)
 - Secret should of course match `GITHUB_WEBHOOK_SECRET` used elsewhere
 - enable SSL validation
 - trigger: "just the push event"
