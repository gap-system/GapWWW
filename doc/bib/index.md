---
title: Bibliography
layout: default_with_title
parent: Documentation
has_children: false
---

  We provide a bibliography of work involving and giving acknowledgement to 
  GAP either by explicit citation in its list of references 
  or by a statement in the work. This bibliograhy is mainly based
  on searches in the science citation databases, including 
  [MathSciNet](https://www.ams.org/mathscinet/), answers to an 
  enquiry in the <a href="{{ site.baseurl }}/forum/">GAP Forum</a>, and
  previous user reports. It will be regularly further extended and we ask 
  you to support it by sending references. 

  Note that the papers quoted in the bibliography are not sorted with
  respect to using GAP&nbsp;4 or GAP&nbsp;3.

  The bibliography is available as
  - <a href="{{ site.baseurl }}/doc/bib/gap-publishednicer.bib">BibTeX</a> file,
  - <a href="{{ site.baseurl }}/doc/bib/gap-published.html">Nicer readable HTML version</a>,

  The tables below give the number of publications per year 
  and numbers of publications by 
  [MSC2020](https://www.ams.org/msc/) categories.

In addition to the bibliography maintained by The GAP Group, there is also a
[Google Scholar profile](https://bit.ly/gap_citations) for the GAP
system and some of its packages, where citations are added automatically as soon 
as they are detected by Google. Another independent source of citations for GAP 
and packages is [swMATH project](https://www.swmath.org/software/320)
which looks for the references in the [zbMATH](https://www.zbmath.org/)
database.

  Additions or corrections to the bibliography maintained by The GAP Group
  are requested at <a href="mailto:support@gap-system.org">support@gap-system.org</a> and are
  very much appreciated.

  For quoting the use of GAP in your publications we provide
  standard forms for
  <a href="{{ site.baseurl }}/cite/">citing&nbsp;GAP&nbsp;4</a>.


### Statistics

  Click on the number of citations to see
  the list of papers for the given year.
  
  <table>
  <tr>
    <td>
      <b>Year</b>
    </td>
    <td>
      <b>Number of citations</b>
    </td>  
  </tr>
  {% for stat in site.data.bib_stats_year %}
  <tr>
    <td>
      {{ stat[0] }}
    </td>
    <td>
      <a href="Year/{{ stat[0] }}.html">{{ stat[1] }}</a>
    </td>  
  </tr>
  {% endfor %}
  </table>
  
  The next table shows the number of sources in the GAP bibliography having 
  different primary and secondary [MSC2020](https://www.ams.org/msc/) 
  codes in the appropriate categories. 
  Click on the name of the category to see the list of papers in this category.
  We acknowledge the [American Mathematical Society](https://www.ams.org/) 
  for the opportunity to use the [MathSciNet](httpss://www.ams.org/mathscinet/) 
  database for performing this analysis.
  
  <table>
  <tr>
    <td>
      <b>Primary</b>
    </td>
    <td>
      <b>Secondary</b>
    </td>
    <td>
      <b>MSC Area</b>
    </td>
  </tr>
  {% for area in site.data.bib_stats_msc %}
  <tr>
    <td>
      {{ area.primary }}
    </td>
    <td>
      {{ area.secondary }}
    </td>
    <td>
    {% if area.name == "TOTAL" %}
      {{ area.name }}
    {% else %}
      <a href="MSC/{{ area.code }}.html">{{ area.name }}</a>
    {% endif %}
    </td>
  </tr>
  {% endfor %}
  </table>