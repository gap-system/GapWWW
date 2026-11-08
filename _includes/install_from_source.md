{%- comment %}
  Steps 2 to 5 of installing GAP from source; they are the same on all
  Unix-like systems. Step 1 (prerequisites) is on the including page.
{%- endcomment %}
{%- capture gap_prefix %}gap-{{ site.data.release.version }}{% endcapture %}
{%- capture tar_gz %}{{ gap_prefix }}.tar.gz{% endcapture %}
{%- capture zip %}{{ gap_prefix }}.zip{% endcapture %}

### Step 2: Download and unpack the sources

Download one of these archives; they differ only in their format.

<table>
<colgroup>
 <col width="15%">
 <col width="5%">
 <col>
</colgroup>
{%- for asset in site.data.assets %}
{%- if asset.name == tar_gz or asset.name == zip %}
<tr>
  <td>
    <a href="{{ asset.url }}">{{ asset.name }}</a>
  </td>
  <td>{{ asset.bytes | divided_by: 1048576 }} MB</td>
  <td>sha256: <code>{{ asset.sha256 }}</code> </td>
</tr>
{%- endif %}
{%- endfor %}
</table>

Unpack the archive in the directory where GAP should reside, and change into
the directory this creates:

    tar -xf {{ tar_gz }}
    cd {{ gap_prefix }}

### Step 3: Compile GAP

    ./configure
    make

This produces an executable called `gap` in the current directory.

### Step 4: Build the packages

A fully functional GAP installation needs not only the core system but also
some of its packages, and several of those must be compiled as well:

    cd pkg
    ../bin/BuildPackages.sh
    cd ..

This builds most of the packages that require compilation. Some may fail, for
example because a library they need is missing on your system; their names are
recorded in `pkg/log/fail.log`. GAP works without them. To get such a package
to work, consult the `README` file in its directory.

### Step 5: Start GAP

Start GAP with

    ./gap

and [test your installation]({{ site.baseurl }}/install/#Test).

To be able to start GAP by entering just `gap` from any directory, create a
symbolic link to the executable in a directory listed in your `PATH`, for
example:

    sudo ln -s "$PWD/gap" /usr/local/bin/gap
