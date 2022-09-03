# GapWWW

[![Build Status](https://travis-ci.com/gap-system/GapWWW.svg?branch=master)](https://travis-ci.com/gap-system/GapWWW)

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
In doubt, please submit an issue before making a pull request, and we 
will be able to advise on further steps.

For larger changes, it will be useful to build a local version of the GAP
website first. This requires use of [Jekyll](https://jekyllrb.com).


## Actually publishing changes to the website

After a change has been committed this repository, it should automatically
appear a short time later on the live website.

If this does not work, please submit an issue. Or, if you have SSH access
to the webserver, you can try to debug the issue; please consult
`etc/README.server.md` for more information.

That's it.


## Warning about package manuals

Note that the `Manuals` directory is not in this git repository, as it is too
large. This is why they are only on the server, in the directory
`/srv/www/docs.gap-system.org`, where they are also used to serve the
<https://docs.gap-system.org> subdomain. As a consequence, please be very
careful about modifying its content!). To get them to appear in the right
place on the website, we configured the Apache webserver to put them there,
via a suitable directive in
`/etc/apache2/sites-available/www.gap-system.org-le-ssl.conf`.

The `Manuals` directory can be regenerated from a GAP installation and the
corresponding `.json` file in `_data/package-infos/`. For example:

```
  etc/extract_manuals.py /usr/local/gap-4.11.1  _data/package-infos/4-11-1.json
```

## Tweaking the server config

The config files for the Apache web server are in `/etc/apache2/sites-available/`
while the actual website data is in `/srv/www/`. Consult `etc/README.server.md`
for further details.

After modifying the Apache configuration, don't forget to ask it to reload
the configuration, via

    apachectl graceful
