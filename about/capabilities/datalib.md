---
title: Data Libraries
grand_parent: About
parent: Capabilities
layout: default_with_title
nav_order: 14
permalink: /capabilities/datalib
---

GAP contains several data libraries. Some of these are part of the core GAP
system, while others are accessible through GAP packages.

## Data libraries in core GAP

- {% include ref.html label="Basic Groups" %}<br>
  Constructors for abelian, cyclic, dihedral, extraspecial, symmetric,
  alternating, Mathieu, Suzuki, and Ree groups.

- {% include ref.html label="Classical Groups" %}<br>
  Constructors for linear, unitary, orthogonal, and symplectic groups.

- {% include ref.html label="Irreducible Maximal Finite Integral Matrix Groups" text="Integral Matrix Groups" %}
  by W. Plesken, B. Souvignier, G. Nebe, and V. Felsch.<br>
  Representatives of irreducible maximal finite integral matrix groups through
  dimension 31.

- {% include ref.html label="Lie Algebras" %}<br>
  Constructors for free Lie algebras, full matrix Lie algebras, and simple
  Lie algebras.

## Data libraries provided by GAP packages

{% for key in site.data.data_libs -%}
{% assign pkg = site.data.package-infos[key] -%}
{% if pkg -%}
{% assign authors = pkg.Persons | where: "IsAuthor", true -%}
- [{{ pkg.PackageName }}]({{ pkg.PackageWWWHome }}) {{ pkg.Version }} ({{ pkg.Date | date: "%d/%m/%Y" }})
  {%- if authors.size > 0 %} by
    {%- for author in authors %} {{ author.FirstNames | escape }} {{ author.LastName | escape }}{% unless forloop.last %},{% endunless %}
    {%- endfor %}.
  {%- endif %}<br>
  {{ pkg.Subtitle | escape }}

{% endif -%}
{% endfor -%}
