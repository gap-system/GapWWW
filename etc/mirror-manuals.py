#!/usr/bin/env python3
#
# This script mirrors the GAP manuals onto https://docs.gap-system.org.
#
# It automates what used to be the manual step `./download_manuals.sh X.Y.Z` on
# that host, described in dev/releases/README.md in the GAP repository. For
# every published GAP release it does not have yet, it downloads the release
# tarball and the accompanying package metadata, extracts the GAP and package
# manuals with extract_manuals.py, installs them as `<dest>/vX.Y.Z`, and points
# the `latest` symlink at the newest release.
#
# Releases that are already installed are skipped, so running this repeatedly
# is cheap; it is meant to be run hourly from a systemd timer.

import argparse
import gzip
import os
import re
import shutil
import subprocess
import sys
import tarfile
from typing import List, Optional, Tuple

import requests
from utils import download_with_sha256, error, notice, warning

REPO = "gap-system/gap"
API_URL = f"https://api.github.com/repos/{REPO}/releases"

TAG_RE = re.compile(r"^v(\d+)\.(\d+)\.(\d+)$")

# Releases before this one do not ship the package-infos.json file that
# extract_manuals.py needs, so their manuals cannot be built this way.
MIN_VERSION = (4, 11, 1)

HERE = os.path.dirname(os.path.abspath(__file__))
EXTRACT_MANUALS = os.path.join(HERE, "extract_manuals.py")


def stable_releases() -> List[Tuple[int, int, int]]:
    """Return the versions of all published, non-prerelease GAP releases."""
    versions = []
    page = 1
    while True:
        response = requests.get(
            API_URL, params={"per_page": 100, "page": page}, timeout=(30, 60)
        )
        response.raise_for_status()
        batch = response.json()
        if not batch:
            break
        for release in batch:
            if release["draft"] or release["prerelease"]:
                continue
            match = TAG_RE.match(release["tag_name"])
            if match:
                versions.append(
                    (int(match.group(1)), int(match.group(2)), int(match.group(3)))
                )
        page += 1
    return versions


def installed_versions(dest: str) -> List[Tuple[int, int, int]]:
    """Return the versions for which manuals are already installed in `dest`."""
    versions = []
    for name in os.listdir(dest):
        match = TAG_RE.match(name)
        if match and os.path.isdir(os.path.join(dest, name)):
            versions.append(
                (int(match.group(1)), int(match.group(2)), int(match.group(3)))
            )
    return versions


def version_str(version: Tuple[int, int, int]) -> str:
    return ".".join(str(n) for n in version)


def build_manuals(version: Tuple[int, int, int], workdir: str, dest: str) -> None:
    """Build the manuals for `version` and install them into `dest`."""
    ver = version_str(version)
    base = f"https://github.com/{REPO}/releases/download/v{ver}"

    os.makedirs(workdir, exist_ok=True)

    # Both downloads are checked against the .sha256 file published beside them;
    # the old download_manuals.sh fetched them without verifying anything.
    tarball = os.path.join(workdir, f"gap-{ver}.tar.gz")
    infos_gz = os.path.join(workdir, "package-infos.json.gz")
    download_with_sha256(f"{base}/gap-{ver}.tar.gz", tarball)
    download_with_sha256(f"{base}/package-infos.json.gz", infos_gz)

    notice(f"unpacking package-infos.json for {ver}")
    infos = os.path.join(workdir, "package-infos.json")
    with gzip.open(infos_gz, "rb") as src, open(infos, "wb") as dst:
        shutil.copyfileobj(src, dst)

    notice(f"extracting gap-{ver}.tar.gz")
    gaproot = os.path.join(workdir, f"gap-{ver}")
    shutil.rmtree(gaproot, ignore_errors=True)
    with tarfile.open(tarball) as archive:
        # Extract as `tar x` would, symlinks and all: GAP tarballs contain
        # package symlinks that the stricter filters reject. The tarball is an
        # official release archive whose checksum was just verified.
        archive.extractall(workdir, filter="fully_trusted")

    # extract_manuals.py writes into a directory called `Manuals` in the current
    # working directory, so run it inside the work directory.
    manuals = os.path.join(workdir, "Manuals")
    shutil.rmtree(manuals, ignore_errors=True)
    notice(f"extracting the manuals for {ver}")
    subprocess.run(
        [sys.executable, EXTRACT_MANUALS, gaproot, infos], cwd=workdir, check=True
    )

    # Move the finished tree into place in one step, so that a half-built set of
    # manuals is never visible on the website. This is a rename within the same
    # filesystem, since the work directory sits next to the document root.
    target = os.path.join(dest, f"v{ver}")
    if os.path.exists(target):
        shutil.rmtree(target)
    os.replace(manuals, target)
    notice(f"installed the manuals for {ver} in {target}")


def update_latest(dest: str) -> None:
    """Point the `latest` symlink at the newest installed release."""
    versions = installed_versions(dest)
    if not versions:
        return
    newest = f"v{version_str(max(versions))}"
    link = os.path.join(dest, "latest")

    if os.path.islink(link) and os.readlink(link) == newest:
        return

    # Replace the symlink by renaming a new one over it, so that `latest` -- and
    # with it the `doc` and `pkg` symlinks pointing through it -- is never
    # missing, not even briefly.
    tmp = os.path.join(dest, ".latest.new")
    if os.path.lexists(tmp):
        os.remove(tmp)
    os.symlink(newest, tmp)
    os.replace(tmp, link)
    notice(f"pointed latest at {newest}")


def main(argv: Optional[List[str]] = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--dest",
        default=os.path.expanduser("~/http"),
        help="directory served by the web server (default: ~/http)",
    )
    parser.add_argument(
        "--workdir",
        default=os.path.expanduser("~/data/.mirror-manuals"),
        help="scratch directory for downloads and unpacking",
    )
    parser.add_argument(
        "--since",
        default=version_str(MIN_VERSION),
        help="oldest release to consider, as X.Y.Z (default: %(default)s)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="report what would be built, without downloading",
    )
    args = parser.parse_args(argv)

    try:
        since = tuple(int(n) for n in args.since.split("."))
        if len(since) != 3:
            raise ValueError
    except ValueError:
        parser.error(f"--since must be of the form X.Y.Z, not {args.since!r}")

    if not os.path.isdir(args.dest):
        error(f"{args.dest} is not a directory")

    # Manuals are served over HTTP, so they must be world readable.
    os.umask(0o022)

    try:
        available = stable_releases()
    except requests.RequestException as e:
        error(f"could not list releases: {e}")

    have = set(installed_versions(args.dest))
    todo = sorted(v for v in available if v >= since and v not in have)

    notice(
        f"{len(available)} releases published, {len(have)} installed, "
        f"{len(todo)} to build"
    )

    if args.dry_run:
        for version in todo:
            notice(f"would build manuals for {version_str(version)}")
        return 0

    # Start from a clean slate: the work directory holds a release tarball and
    # its unpacked copy, well over a gigabyte, which there is no reason to keep
    # between runs.
    shutil.rmtree(args.workdir, ignore_errors=True)

    failures = []
    for version in todo:
        try:
            build_manuals(version, args.workdir, args.dest)
        # utils.error() reports a problem by exiting, so catch that too and
        # carry on with the remaining releases.
        except (
            requests.RequestException,
            subprocess.CalledProcessError,
            OSError,
            tarfile.TarError,
            SystemExit,
        ) as e:
            warning(f"{version_str(version)}: {e}")
            failures.append(version_str(version))

    update_latest(args.dest)
    shutil.rmtree(args.workdir, ignore_errors=True)

    if failures:
        error(f"failed to build manuals for: {' '.join(failures)}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
