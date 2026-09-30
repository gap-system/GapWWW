---
title: Help & Community
layout: default_with_title
has_children: true
nav_order: 3
permalink: /contact/
---

GAP is developed and supported by volunteers, most of whom do this in
addition to their regular job. This page explains where to ask which
question, and who will see what you write there.

Please do not write to individual developers directly. The channels below
reach more people who can answer, and a public answer helps the next person
with the same question.

### Before you ask

- **Manuals.** The [Tutorial][tutorial] and the [Reference Manual][refman]
  describe GAP; each [package][packages] has its own manual. Inside GAP,
  `?Sylow` looks up a topic.
- **[FAQ][faq]** and **[Learning GAP][learn]**.
- **Web search.** Many questions have been answered before, in the
  [Forum archive][forumarchive], on [Mathematics Stack Exchange][mathse] or
  on [MathOverflow][mo].
- **AI assistants** can help, but they often invent GAP functions or options
  that do not exist, and produce code that looks right but computes something
  else. Look up every function they use in the manual and test the code.
  If you post AI-generated code in one of the channels below, say so.

### Where to ask

| I want to …                                    | Where |
|------------------------------------------------|-------|
| ask how to do something with GAP               | [GAP Forum][forum], [Math Stack Exchange][mathse], [Slack][slack], [GitHub Discussions][discussions] |
| ask a research-level question involving GAP    | [MathOverflow][mo] |
| ask a theoretical question about groups        | [Group-Pub-Forum][gpf] |
| report a bug in GAP or a package               | [Reporting issues][issues] |
| ask something that concerns only me, or is private | [GAP Support][support] |
| discuss the development of GAP or a package    | [GAP development list][devlist], [GitHub][github], [Slack][slack], [GAP Days](#gap-days) |
| hear about new releases and serious bugs       | [GAP Forum][forum], [GAP development list][devlist], [Slack][slack] |
| meet developers and work on code together      | [GAP Days](#gap-days) |

### Channels compared

| Channel | Who can post | Who can read it | Good for | Not for |
|---------|--------------|-----------------|----------|---------|
| [GAP Forum][forum] | subscribers | anyone: public archive since 1992 | questions and discussions of general interest; announcements | problems specific to your setup |
| [GAP development list][devlist] | subscribers | subscribers, mostly developers | development of GAP and packages | usage questions |
| [GAP Support][support] | anyone | the Support Group only | private or local problems; bug reports by email | questions of general interest |
| [GAP issue tracker][gapissues] | GitHub users | anyone | bug reports and feature requests for GAP | usage questions |
| package issue trackers | depends on the package; mostly GitHub users | anyone, usually | bugs in a package | bugs in GAP itself |
| [GitHub Discussions][discussions] | GitHub users | anyone | questions, ideas, showing your work | bug reports |
| [Slack][slack] | anyone who joins | members; older messages may disappear | quick questions; chat about development | anything that should be findable later |
| [Math Stack Exchange][mathse], [MathOverflow][mo] | Stack Exchange users | anyone | self-contained questions with a definite answer | open-ended discussions |

The [Group-Pub-Forum][gpf] is a mailing list for questions on the theory of
groups and related structures, run by the University of Bath. To join, email
the address given on its page with your name and affiliation.

### How the GAP team uses these channels

- New releases are announced on the GAP Forum, the GAP development list, and
  Slack.
- Bugs that can produce wrong results without an error are announced on the
  GAP Forum.
- Bug reports are best filed in the [issue tracker][gapissues]; reports sent
  to any of the three mailing lists reach us too.
- Development is discussed in GitHub issues and pull requests, on the
  development list, and on Slack.

### GAP Days

[GAP Days][gapdays] are week-long meetings of GAP developers and users, held
about twice a year at changing places. Each meeting has a few main topics,
coding sprints, and short talks about recent developments. Users with some
programming experience are welcome, not only core developers: with many GAP
experts in the room, it is a good opportunity to work on your own package or
code, and to influence where GAP goes next. Upcoming meetings are listed on
the [front page]({{ site.baseurl }}/) and at [gapdays.de][gapdays].

### Feedback and contributions

- **Tell us how you use GAP**, by writing to <support@gap-system.org>. If you
  publish work that used GAP, please [cite it]({{ site.baseurl }}/cite/).
- **Teaching material.** If you use GAP in teaching and can share your
  material, tell us; see [Teaching Material]({{ site.baseurl }}/doc/teach/).
- **Contributing code.** See the
  [contribution guide](https://github.com/gap-system/gap/blob/master/CONTRIBUTING.md)
  for GAP itself. Much of GAP's functionality comes from
  [packages][packages] written by users; see the
  [hints for package authors]({{ site.baseurl }}/packages/authors/) and how to
  [submit a package]({{ site.baseurl }}/packages/authors/submit/).

[tutorial]: {{ site.docsurl }}/doc/tut/chap0_mj.html
[refman]: {{ site.docsurl }}/doc/ref/chap0_mj.html
[packages]: {{ site.baseurl }}/packages/
[faq]: {{ site.baseurl }}/faq/
[learn]: {{ site.baseurl }}/doc/learn/
[forum]: {{ site.baseurl }}/forum/#gap-forum
[forumarchive]: {{ site.baseurl }}/forum/archive/
[devlist]: {{ site.baseurl }}/forum/#gap-development-list
[support]: {{ site.baseurl }}/forum/#gap-support
[issues]: {{ site.baseurl }}/issues/
[slack]: {{ site.baseurl }}/slack
[github]: https://github.com/gap-system/gap
[gapissues]: https://github.com/gap-system/gap/issues
[discussions]: https://github.com/gap-system/gap/discussions
[mathse]: https://math.stackexchange.com/questions/tagged/gap
[mo]: https://mathoverflow.net/questions/tagged/gap
[gpf]: https://www.bath.ac.uk/case-studies/group-pub-forum/
[gapdays]: https://www.gapdays.de
