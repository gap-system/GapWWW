# GapWWW

[![Build](https://github.com/gap-system/GapWWW/actions/workflows/build.yml/badge.svg)](https://github.com/gap-system/GapWWW/actions/workflows/build.yml)
[![Sync](https://github.com/gap-system/GapWWW/actions/workflows/sync.yml/badge.svg)](https://github.com/gap-system/GapWWW/actions/workflows/sync.yml)

This is the source repository for the GAP website <https://www.gap-system.org>.

The GAP website is NOT hosted on GitHub pages, and therefore there is NO
branch named `gh-pages` here. We host it elsewhere, but we use GitHub for
collaborative work on the website. We welcome contributions ranging from
fixed typos and updated details to suggestions regarding the structure of
the website and its improved look.

For small improvements (e.g. correcting details and fixing typos), the
procedure is as simple as just submitting an issue or pull request here.
Please take into account that some files, in particular package YAML
files `Packages/<pkgname>.html` are generated automatically from the
metadata in `PackageInfo.g` files. Incorrect information there should
not be changed via pull requests, but reported to package authors instead.
If in doubt, just submit an issue before making a pull request, and we
will be able to advise on further steps.


## Testing the website locally

For larger changes, it is useful to build a local version of the GAP
website first. This requires use of [Jekyll](https://jekyllrb.com). We
recommend using Ruby's `bundler`. This can be installed on Debian or
Ubuntu via `apt-get install bundler`. Then as a one-time setup, run

    bundle config set --local path 'vendor/bundle'
    bundle install

Afterwards, you can build a version of the website and open a local
webserver to test it by entering

    bundle exec jekyll serve

after which you can open <http://localhost:4000> in a web browser to see
a preview of the page. For more information on using Jekyll, please
consult the [Jekyll documentation](https://jekyllrb.com/docs/).
  

## Actually publishing changes to the website

After a change has been merged into the `master` branch of the `GapWWW`
repository, it should automatically appear a short time later on the
live website.

If this does not work, please submit an issue. Or, if you have SSH access
to the webserver, you can try to debug the issue.


## SSH access to the web servers

The GAP web server is hosted at the RPTU Kaiserslautern-Landau. Primary admin
for this web server is Max Horn <mhorn@rptu.de>. If you
feel you have need to directly access the server via SSH, contact him.

- SSH hostname: `www-admin11.uni-kl.de`
- Login:
  - `www-gap-systems` → `www.gap-system.org`
  - `www-gap-docs` → `docs.gap-system.org`
  - `www-gap-files` → `files.gap-system.org`

Please consult `etc/README.server.md` for more information.


## Updating GAP and package manuals on docs.gap-system.org

The manuals for GAP and packages are served from a separate subdomain,
namely <https://docs.gap-system.org>. The files served there
are from the directory `/srv/www/www-gap-docs/data/http` on
`www-admin11.uni-kl.de`, username `www-gap-docs`.

Note that this subdomain is relatively new: the manuals used to be under
<https://www.gap-system.org/Manuals/>. To ensure URLs with this prefix
keep working, a `RedirectMatch` rule for the Apache webserver is
configured via the `.htaccess` file in the `GapWWW` repository.

Additional redirects are configured in a separate `.htaccess` file

The GAP and package manuals themselves are not in this git repository,
as they are too large. This is why they are only on the server, in the
directory `/srv/www/www-gap-docs/data/http`. (As a consequence, please
be extra careful about modifying its content! While we can restore from
a backup, its far more work than restoring a git clone of the website).
The content of this directory currently look as follows; note that we
keep the manuals for each GAP release (however, this is currently not
advertised or used anywhere):

- `v4.11.1/` -- created by `extract_manuals.py`
   - `doc/`
   - `pkg/`
- `v4.12.0/` -- created by `extract_manuals.py`
   - `doc/`
   - `pkg/`
- `latest`: symlink to `v4.12.0`
- `doc`: symlink to `latest/doc`
- `pkg`: symlink to `latest/pkg`
- `index.html`: simple placeholder
- `.htaccess`: additional redirect rules; copy of `etc/docs.htaccess`
  in the `GapWWW` repository

The directories `v4.X.Y` can be (re)generated from a GAP installation and the
corresponding `.json` file in `_data/package-infos/`. For example:

    etc/extract_manuals.py /usr/local/gap-4.27.3  _data/package-infos/4-27-3.json

will produce a directory `Manuals` which then could be renamed to
`/srv/www/www-gap-docs/data/http/v4.27.3`. Make sure to also update the `latest`
symlink suitably.


## Updating files on files.gap-system.org

Various archives for GAP and packages are served from a separate
subdomain, namely <https://files.gap-system.org>. The files served there
are from the directory `/srv/www/www-gap-docs/files/http` on
`www-admin11.uni-kl.de`, username `www-gap-files`.
