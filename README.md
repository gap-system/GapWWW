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

After a change has been committed this repository, currently one needs to
manually get the change onto the website. This can be done as follows:

1. ssh into `gap-web.host.cs.st-andrews.ac.uk` (requires an account in St Andrews)

2. for a test deployment (recommended), first `cd test.gap-system.org`
  (then the update will be published on <https://test.gap-system.org>),
  otherwise `cd www.gap-system.org`

3. run `git up` (an alias we configured there for `git pull --ff-only`)

4. run `jekyll build`

That's it.


## Warning about package manuals

Note that the `Manuals` directory is not in this git repository, as it is too
large (about XXX GB of data). This is why they are only on the
server, in the directory `~/www.gap-system.org/Manuals` (so be very careful
never to delete that!). To get them to appear in the right place on the
website (they don't automatically, as they are not in the 
`~/www.gap-system.org/_site`
directory), we configured nginx to put them there, via
`/host/gap-web/nginx.d/www.gap-system.org/_global.conf`

The `Manuals` directory can be regenerated from a GAP installation and the
corresponding `.json` file in `_data/package-infos/`. For example:

```
  etc/extract_manuals.py /usr/local/gap-4.11.1  _data/package-infos/4-11-1.json
```

## Tweaking the server config

In general, config files for the nginx web server are in `/host/gap-web/nginx.d/`
E.g. in `/host/gap-web/nginx.d/www.gap-system.org`.

You need to read up about nginx config syntax if you want to fully master
these, but for basic things it usually suffices to look at the existing config
files and one can often guess what they do.

After you make a config change it won't have any effect immediately. You need
to tell nginx to reload its config. But first, validate it for syntax errors:

    nginx -c /host/gap-web/nginx.conf -t

If that worked, reload the config:

    nginx -c /host/gap-web/nginx.conf -s reload
