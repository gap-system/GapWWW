# Technical info about the GAP web server setup

This document is the starting point for anyone who has to troubleshoot the GAP
web hosting, or rebuild it from scratch after it has been lost. It gives the
overview; the details of each individual site are in a separate document, listed
below.

## The big picture

Three separate websites are hosted, each as its own Apache virtual host with its
own Unix account, all on the same machine `www-admin13.rz.rptu.de`. That machine
is run by the central IT department of RPTU Kaiserslautern-Landau, not by us. In
German they are the *Rechenzentrum*, usually abbreviated RZ, which is where the
`rz` in the hostname comes from; below they are simply "the IT department". The
administrative contact there is Max Horn <mhorn@rptu.de>.

| Site | Unix account | SSH alias | Driven by | Updated by |
| --- | --- | --- | --- | --- |
| <https://www.gap-system.org> | `www-gap-systems` | `gap-www` | this repository | GitHub webhook, on every push to `master` |
| <https://docs.gap-system.org> | `www-gap-docs` | `gap-docs` | this repository | systemd timer, hourly |
| <https://files.gap-system.org> | `www-gap-files` | `gap-files` | [gap-files](https://github.com/gap-system/gap-files) | systemd timers, every 15 min and hourly |

The SSH aliases are a local convention; they assume entries such as the
following in your `~/.ssh/config`:

    Host gap-www
        Hostname www-admin13.rz.rptu.de
        User     www-gap-systems

Per-site documentation:

- [`README.gap-www.md`](README.gap-www.md) — the website itself
- [`README.gap-docs.md`](README.gap-docs.md) — the manuals
- the archive server is documented in the `README.md` of the
  [gap-files](https://github.com/gap-system/gap-files) repository, which is
  where its scripts and units live

## What the three accounts have in common

Knowing these conventions explains most of what you will find on any of the
three accounts.

**Directory layout.** Each account has the same two symlinks in its home
directory:

    ~/data -> /srv/www/<account>/data          # created by us
    ~/http -> /srv/www/<account>/data/http     # created for us, root owned

`~/http` is the document root of that site. Everything else we keep — git
clones, work directories, state files — lives next to it in `~/data`, outside
the document root, so that it is not served.

**Storage** is an NFS mount from `nas.rhrk.uni-kl.de`, shared by all accounts on
the machine, about 1.7 TB in total. It is not fast: reading a few gigabytes back
is noticeably expensive, which is why the update jobs are written to avoid
re-reading data they have already checked.

**Apache** is installed and configured centrally by the IT department, one
instance per virtual host. The vhost configuration is *not* readable or writable
by our accounts. However, we are not boxed in by that: `.htaccess` files are
honoured, and PHP is enabled (8.4 as of this writing), which is enough for
redirect rules and for the webhook endpoint. Certificates and DNS are handled by
them too.

**systemd user units** are how all automatic updating is driven. This works
without an active login session only because lingering is enabled for each
account, which requires root:

    loginctl enable-linger <account>

If that is ever lost, the units silently stop running when nobody is logged in —
which looks exactly like "the website stopped updating for no reason". Units are
installed as *copies* in `~/.config/systemd/user/`, not symlinks into the git
clone, so after changing a unit in the repository it must be copied again.

Unit names are prefixed with the site they belong to, so that `systemctl --user
list-timers` on any account is self-explanatory.

## If you have to rebuild all of this

Roughly in order:

1. Ask the IT department for the virtual hosts and the accounts, with PHP
   enabled and `AllowOverride` sufficient for `.htaccess`, and get
   `loginctl enable-linger` set for each account. Everything after this can be
   done without root.
2. Recreate the `~/data` symlink on each account (`~/http` is created for us).
3. Set up each site following its own document, in this order: the website
   first (it is the only one with a secret to configure), then the manuals, then
   the archive server.
4. For the archive server, note that the package archives cannot be recovered
   from anywhere else: <https://files.gap-system.org> is itself the archive of
   record for old package releases. If it is ever lost, the only copies are
   whatever backups the IT department holds and whatever developers happen to
   have locally. Everything else — the website, the manuals, the GAP releases —
   can be rebuilt from GitHub.

## Troubleshooting anywhere

The same handful of commands apply on all three accounts:

    systemctl --user list-timers                 # what is scheduled, and when it last ran
    systemctl --user list-units --failed         # anything broken
    journalctl --user -u '<unit>' -n 100         # what it said
    journalctl --user -f -u '<unit>'             # follow a running job

There is no email notification anywhere in this setup: a job that starts failing
will keep failing quietly until somebody looks. If updates have stopped, check in
this order: is lingering still enabled (`loginctl show-user <account>`), is the
timer or path unit still enabled, and does the journal show the job failing.

A recurring cause of trouble on the website account is broken file ownership in
the git clone or document root, usually after someone has poked at it as the
wrong user. See [`README.gap-www.md`](README.gap-www.md) for how to repair it.
