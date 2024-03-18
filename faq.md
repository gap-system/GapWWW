---
title: FAQ
layout: faq
nav_order: 7
permalink: /faq/
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}



<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

## Obtaining GAP

<!-- ================================================================================== -->

### Can I obtain the algorithm and/or code for some function of GAP?

The brief answer is: "Yes, GAP is open source."

You can use tools such as 'grep' to search for the code.

Also the <a href="#2.6">answer&nbsp;to&nbsp;FAQ&nbsp;2.6</a> may be helpful.

<!-- ================================================================================== -->

### How do I find my way through the GAP Library?

<a href="{{ site.baseurl }}/Doc/Talks/linz99.html#Library">The following text</a>, adapted from  a
<a href="{{ site.baseurl }}/Doc/Talks/l_ah_lib.pdf">talk</a>
by Alexander Hulpke at a Summer School at Linz in 1999, may be helpful.

<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

## Usage hints
<!-- ================================================================================== -->

### How can I customise GAP?

When you start GAP, it looks for files with the names
`gap.ini` and `gaprc` in its root directories
(see {%- include ref.html label="GAP Root Directories" %}),
and reads the first `gap.ini` and the first `gaprc` file it finds.
These files may be used for certain customisations, for example, to
read a file containing  functions or data that you always need,
to set your personal preferences, to load certain packages, or to define your
personal  abbreviations for some names in the library, which seems to
be  too  long for you.

For more details about `gap.ini` and `gaprc` files see the section
{%- include ref.html label="The gap.ini and gaprc files" text="The&nbsp;gap.ini&nbsp;and&nbsp;gaprc&nbsp;files" %}
from the GAP Reference Manual.

In former GAP releases prior to GAP 4.5
a filed called `.gaprc` was used for customisations. If you
have used the `.gaprc` file, see the section
{%- include ref.html label="The former .gaprc file" text="The&nbsp;former&nbsp;.gaprc&nbsp;file" %}.
from the GAP Reference Manual for the transitional arrangements.

<!-- ================================================================================== -->

### How can I avoid excessive output?

If  you  expect  that  the output will have too many lines, typing a
double  semicolon  ";;"  at  the end of the command line will suppress
displaying  output  on  the  screen.  This  will allow you to see more
history of your session, and also will prevent your network connection
from overloading.

Sometimes a strange indentation behaviour can be repaired by issuing one
or several times the command `Print("\<\<\<\<\<\<\<");`.

<!-- ================================================================================== -->

### How can I stop excessive output?

In case you did not type the double semicolon ";;", and GAP started
to  print  too  many  lines  on the screen, sometimes Ctrl-C may break
printing.  But  this  may  cause some side effects on the style of the
further output, so you should use this measure carefully.

Sometimes a strange indentation behaviour can be repaired by issuing one
or several times the command `Print("\<\<\<\<\<\<\<");`.

<!-- ================================================================================== -->

### How can I save my GAP input and output?

The  command  <tt>LogTo(  name-file  )</tt>  causes  the  subsequent
interaction   to    be   logged   to   the   file    with   the   name
<tt>name-file</tt>, i.e.,  everything you see on  your terminal will
also appear in this file. <tt>LogTo</tt>  may also be used to log to
a stream (see <tt>LogTo</tt> for streams). This file must of course
be  writable by  GAP,  otherwise  an error  is  signalled.  Note  that
<tt>LogTo</tt> will overwrite the  previous contents of this file if
it  already   existed.

The most convenient way of creating larger pieces of GAP
code is to write them to some text file. For this purpose you can simply use
your favorite text editor. You can load such a file into GAP
using the command <tt>Read( name-file )</tt>. See the reference manual section
{%- include ref.html label="Read" text="File&nbsp;Operations" %} for information
on these and related commands.

The   command   <tt>SaveWorkspace( filename )</tt>   will  save   a
"snapshot"  image   of  the  current  GAP  workspace   in  the  file
<tt>filename</tt>.  This image  then can be loaded by  another copy of
GAP  which then will  behave as  at the  point when <tt>SaveWorkspace</tt>
was called.
See the section
{%- include ref.html label="SaveWorkspace" text="Saving&nbsp;and&nbsp;Loading&nbsp;a&nbsp;Workspace" %} for
information on this and related commands.

<!-- ================================================================================== -->

### Can I run GAP remotely?

It is possible to run GAP remotely. Usually this can be done via an
`ssh` connection. (On Windows one can use, e.g., <a
href="https://www.chiark.greenend.org.uk/~sgtatham/putty/">PuTTY</a>.)

Since GAP uses standard text terminals as user interface, the remote usage
is very similar to the usage on a local machine.

<!-- ================================================================================== -->

### Why should I use the "screen" program?

If the remote server is operated by a UNIX operating system, it is very
convenient to use the 'screen' program - a screen manager with VT100/ANSI
terminal emulation. The advantage is that your GAP session will not be
lost in case of (unintended) interrupts of your network connection, and
that you can close the network connection while GAP is busy with long
computations.

It  is  likely  that screen is already installed on your server - just
type  'screen'  to check this.
(Otherwise look
<a href="https://www.gnu.org/software/screen/screen.html">here</a> to get
it, or on Linux install the 'screen' package from your distribution.)
If so, it will be launched and you will
see its welcome message. Now you are able to work just as usual, but
in case of a broken connection your session will not be closed, and your
computations  will  be  continued while you are not connected.
When you will connect to the server next time, enter 'screen -r'
to  restore  your  session. To detach your session again (i.e. move it
into  background) press Ctrl-A and then D (and you will see the normal
command  line  prompt  of  your  UNIX  system)  or  simply  close the
connection.  For more details about screen, see its documentation (for
example, type 'man screen').

<!-- ================================================================================== -->

### Can I convert a file obtained from the GAP LogTo command into a Latex file?

David Joyner ( wdj@usna.edu) announced in the  GAP
Forum that he ...
> ... has  written a very simple python program which takes a file
> obtained from the GAP LogTo command and converts into a
> Latex file.
> You must have the python binary installed in /usr/bin
> (on a linux/unix setup). However, if you have the windows version
> of python then it presumably works with some editing. The file
> with an example in on David Joyner's webpage
> <a href="https://web.archive.org/web/20110709161231/http://www.usna.edu/Users/math/wdj/gap/">GAP&nbsp;Stuff</a>,
> if you are interested.

<!-- ================================================================================== -->

### When I use time or Runtime() or the profiler to determine how long a piece of GAP code takes, the answers can vary significantly. Why is this?

There are a number of possible reasons for this:
<ol>
<li>
For some calculations, GAP actually uses randomized algorithms (although,
unless you choose otherwise, the results produced are always checked). In
these cases, the algorithm may be more or less "lucky" and take a shorter
or longer time accordingly. You can usually avoid this  variation by setting
the random seed to a standard value before each test, using RANDOM_SEED(1).
</li>
<li>
Garbage collection. The GAP memory manager runs when the system runs out of
free memory and can take significant time. To standardise when this happens,
run GASMAN("collect") before each test.
</li>
<li>
The granularity of the underlying OS timing function being used is at
best 1ms, sometimes courser,  so a test which takes 0,1 or 2 ms per run could
represent a calculation that takes about 1ms and may cross anywhere between 0
and 2 clock ticks without more than a small variation in how long it takes.
</li>
<li>
The method cache. The GAP method selection system caches the last few
methods that were used for each operation. The cost of a cache miss is
considerable.
</li>
<li>
The CPU cache. If the relevant parts of the GAP interpreter and/or of the
workspace are in CPU cache when the test starts, this will save some time.
</li>
</ol>

Also note that accessing, especially updating, global
variables is significantly slower than local ones.


<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

## Complaints
<!-- ================================================================================== -->

### I think I found a bug.

While we try to check the GAP system as rigorously as we
can, such a large system  will inevitably contain bugs. We welcome bug
reports and regularly issue updates. However since GAP is
available free and the GAP authors work on the system as
part of their research, we would like to ask you to make sure that the
problem that you encountered really is a bug and that you are giving us
sufficient information to deal with it: please read the page
<a href="{{ site.baseurl }}/issues/">GAP&nbsp;Trouble</a>
before sending us a bug report.

<!-- ================================================================================== -->

### My calculation does not finish (or GAP runs out of memory).

Depending on the size or representation of objects, some harmless-looking
commands can involve very expensive (in terms of runtime and of memory use)
routines. Typical examples are (without any claim towards completeness):

- Isomorphism tests,
- Calculation of all subgroups,
- Calculations with finitely presented structures.

In these cases the calculation might seemingly run forever or terminate
after a while with an error message that GAP could not get
more memory.

The first thing to check is the error message you got, as there are two
variants:

<dl>
<dt><tt>cannot extend the workspace any more</tt></dt>
<dd>
You have hit a hard limit of how much memory is available. This could be due
to physical memory in the machine, the operating system used, or the way how
GAP was compiled (32 bit versus 64 bit). If you need lots of
memory (and have it physically in the machine) you should run a 64 bit
binary of GAP (which might require using a 64 bit version of the operating
system as well).
</dd>
<dt><tt>exceeded the permitted memory (-o command line option)</tt></dt>
<dd>
This (far more frequent) error is a safety device to stop GAP from
allocating so much memory to bring a machine (probably used for other tasks
or by other users as well) to its knees. (A typical situation of this might
be if GAP cannot do better at some task
than enumerating all elements of a
huge group, but the user did not realize this.)
In this case an error is triggered and the trigger limit
increased by a factor of 2. You could either just type <tt>return;</tt> and
restart the calculation, or exit the break loop and restart the calculation
anew. In either case more memory is made available.
In case of running a batch job (or being irritated by this error message),
you can use the <tt>-o</tt> command line option to set this trigger limit to
a higher default level, e.g. the amount of physical memory your machine has.
See the section
{%- include ref.html label="Command Line Options" text="Command&nbsp;Line&nbsp;Options" %} in the Reference Manual for more
detail.
</dd>
</dl>

Assuming that neither of these fixes is available (your job is using all the
physical memory you can have), it often is possible to recast the task in
a different way to get the result more efficiently:
A few approaches for this are:

  - Is there a better representation? Typically PcGroups (only possible for
    solvable groups) are more efficient than permutation groups are more
    efficient than matrix groups are more efficient than Fp groups. Use
    <tt>IsomorphismPermGroup</tt> (or similar) to transfer the calculation
    into a group in a better representation.
  - Is there another operation (probably not as general as the one you are
    using) whose result would be sufficient? (For example it is sufficient
    to search for <i>p</i>-subgroups inside a Sylow subgroup.)
  - Is there information you have about the object that GAP
    will have to find out? Good candidates are the size of a group (use
    <tt>SetSize</tt>) or solvability (use <tt>SetIsSolvableGroup</tt>).
  - Is the amount of data produced by the calculation feasible for the
    machine you are using?
  - Does your computation use mutable lists when
    <a name="immutable">immutable</a> lists might be better?

    In some cases, this can slow down your computation so much
    that it doesn't finish. Using immutable lists allows
    computed properties to be cached, so
    that further checking of the property is instantaneous.  In the
    example below, the comments were introduced after the
    interaction.

    ```gap
    # create a mutable, sorted list
    gap> a:=List([0..20000],i->WordAlp("a",i));;
    gap> IsSortedList(a);
    true
    gap> time;
    256
    gap> IsSortedList(a);
    true
    gap> time;
    260

    # Time to check if it is sorted is about the same every occasion
    gap> KnownPropertiesOfObject(a);
    [ "IsFinite", "IsSmallList" ]

    # not much is known about a
    gap> b:=Immutable(a);;
    gap> KnownPropertiesOfObject(b);
    [ "IsFinite", "IsSmallList" ]

    # also not much is known about b
    # check sortedness for the first time
    gap> IsSortedList(b);
    true
    gap> time;
    284

    # about the same time it took for a. now, check again
    gap> IsSortedList(b);
    true
    gap> time;
    0

    # caching miracle! In this process, a lot was learned about b:
    gap> KnownPropertiesOfObject(b);
    [ "IS_SSORT_LIST", "IsFinite", "IsSmallList", "IsSortedList", "IsDuplicateFree" ]
    ```

    This example point to an important consequence: lookup in b is much faster
    than searching in a, since, as b is known to be sorted, binary search is used
    for the lookup.  An amusing instance of a painful learning experience in the
    subject appears in the Forum thread starting in
    <https://www.gap-system.org/ForumArchive2/2008/002169.html>.

<!-- ================================================================================== -->

### My calculation with matrix groups is slow/runs out of memory.

GAP currently translates essentially every calculation with matrix
groups to an isomorphic permutation group. Two possible bottlenecks are:

<ol>
<li>
Intermediate results might get transferred back to matrix form and
are immediately converted again in a permutation: Because of this it
is often quicker to work in the isomorphic permutation group  (obtained
via `IsomorphismPermGroup`, see the section
'{%- include ref.html label="Computing a Permutation Representation" %}'
of the  GAP reference manual) and only to translate the final
result back to matrix form, using the same homomorphism.
</li>
<li>
GAP finds a permutation representation by acting on a set of  vectors.
There is no optimal heuristics for choosing these vectors (a
necessary condition for faithfulness is that the vectors comprise a
basis, but there are many choices).
Note that `IsomorphismPermGroup`  for matrix groups internally already uses
'{%- include ref.html label="SmallerDegreePermutationRepresentation" %}'
(unless  the matrix  group is known  to contain SL),  thus this
operation cannot be used to reduce the degree further.
If the group is very large, it
can be rather beneficial to try to choose such a set of vectors yourself and
use `ActionHomomorphism` (see the section
'{%- include ref.html label="The Permutation Image of an Action" %}'
of the GAP reference manual) to build the permutation representation.
</li>
</ol>


<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

## Computing with GAP
<!-- ================================================================================== -->

In addition to the list of frequently asked questions on computing with GAP given below,

- David Joyner is collecting a list of frequently asked questions about
  <a href="https://yetanothermathblog.com/the-toric-package-for-gap/how-do-i-construct-in-gap/">
  Constructions</a> of various mathematical objects in GAP
  with fully worked out GAP code answering them. This
  collection is specially recommended for newcomers to the system .
- {% include namelink.html name="Alexander Hulpke" %} has collected user
  questions (mostly from the GAP Forum) about mathematical applications of GAP
  together with the corresponding answers. See <a
  href="https://www.math.colostate.edu/~hulpke/GAPQA/">
  Some&nbsp;GAP&nbsp;Questions</a> on his home page.

### How do I perform binary operations on the elements of a group?

The group  operation in  GAP is  always multiplication,
written with *.
This  works e.g.  for groups  of  permutations, of  matrices, and  for
abstract groups given by generators and relations.

While you can  construct a number of groups  of permutations, they all
have the same multiplication, in the sense that if two permutations p1
and p2 are both in two permutation groups, their product in each group
will be the permutation p1*p2 given by applying p1 followed by p2.

In fact, this essentially works the other way round. GAP first defines
elements,  such  as  permutations,   matrices  or  words  in  abstract
generators, with their operations  such as multiplication and inverse,
then it allows you to define groups of such objects, using the objects
multiplication as the group operation.

All  the many algorithms,  implemented in  GAP  for the
investigation  of the  structure of  a group,  are written  using this
symbol * for the group multiplication.

<!-- ================================================================================== -->

### How do I represent my group in GAP?

If you can write down permutations or matrix generators, you can use them
directly. (Note, however, that GAP will internally compute
a faithful permutation representation to work with matrix groups anyhow.
However, see below for an example that you should be aware of this,
because it can be <b>dangerous</b>.)

A group given by a finite presentation can be input as a quotient of a
free group. If larger calculations are to be done, it is worthwhile (if it
is possible) to either convert it to a PC group (using for example
<tt>SolvableQuotient</tt> --
Note that even if the presentation is polycyclic, GAP will
not use methods for polycyclic groups, unless the group is also represented
as a PC group) or to a permutation group.

For groups given by structural information, the construction can be much
harder. There are a few general product constructions (direct and
semidirect product for example). The
<a href="{{ site.baseurl }}/Doc/Talks/talks.html">Issac&nbsp;2000</a>
tutorial gives some examples of constructing groups.

Here then is the <b>example</b> to which the first paragraph referred:

A user had sent the following program run, asking for help:

```gap
gap> g := GL(3,27);
GL(3,27)
gap> h := SylowSubgroup(g,2);
<group of 3x3 matrices in characteristic 3>
gap> Size(h);
32
gap> n := Normalizer(g,h);
<group of 3x3 matrices in characteristic 3>
gap> Size(n);
5408
gap> l := List(Irr(n), i-> i[1]);;
exceeded the permitted memory
...

brk> quit;
```

Frank  Lübeck explained  what  happened: First  you  can get  the
number characters of given degree  much easier, using that the group
<tt>n</tt> is solvable, its order being divisible by only two primes.

```gap
gap> IsSolvable(n);
true
gap> CharacterDegrees(n);
[ [ 1, 1352 ], [ 2, 1014 ] ]
gap> h1 := IsomorphismPermGroup(n);
<action isomorphism>
gap> NrMovedPoints(Image(h1));
19682
```

So the user was asking to compute the 2366 irreducible characters of a
permutation group  of order 5408 of  degree 19682 and  this would have
had to be done by  the Dixon/Schneider method using the 2366 conjugacy
classes of  that group! In such  a case one  can either try to  find a
much smaller permutation  representation of that group or  work with a
pc group presentation:

```gap
gap> h2 := SmallerDegreePermutationRepresentation(Image(h1));;
gap> NrMovedPoints(Image(h2));
130
gap> Size(Image(h2));
5408
gap> hpc := IsomorphismPcGroup(n);;
gap> Image(hpc);
Group([ f6, f4*f5*f6, f4, f7, f3, f2^7*f3*f7, f1^7*f4*f5*f6 ])
gap> Size(last);
5408
```

Results of computations in these image groups can then be translated
back into the group <tt>n</tt>, using the function
<tt>PreImage</tt>.

<!-- ================================================================================== -->

### Does GAP support additive groups?

The answer is a clear 'no  and yes'! To understand this 'clear answer'
let  us consider  the integers  mod  15. (See  section
{%- include ref.html label="Residue Class Rings" text="Residue  Class Rings" %} in the chapter on
{%- include ref.html label="Integers" text="integers" %}.)
First  of all  you  can  simply add  and multiply integers mod 15 by

```gap
gap> (17 + 18) mod 15;
5
gap> (17 * 18) mod 15;
6
```

You can also form the ring of integers mod 15 by

```gap
gap> z15 := ZmodnZ(15);
(Integers mod 15)
```

and GAP tells you:

```gap
gap> IsRing(z15);
true
```

In fact you can work with its elements:

```gap
gap> a := ZmodnZObj(17,15);
ZmodnZObj( 2, 15 )
gap> b := ZmodnZObj(18,15);
ZmodnZObj( 3, 15 )
gap> a+b;
ZmodnZObj( 5, 15 )
gap> a*b;
ZmodnZObj( 6, 15 )
```

GAP also tells you

```gap
gap> IsAdditiveGroup(z15);
true
```

But:

```gap
gap> IsGroup(z15);
false
```

The explanation is that  in GAP an additive group A
(of a ring) is  just an
{%- include ref.html label="Additive Magmas" text="additive&nbsp;magma" %}
-with-zero with an operation that maps each element a of
A to its additive inverse and  that most of the algorithms for groups
are not available for these. So you get:

```gap
gap> Size(z15);
15
gap> SylowSubgroup(z15,3);
Error, no method found!
```

On the other  hand, using that the additive group  of the integers mod
15 is cyclic you can deal with this group in the usual way:

```gap
gap> c15 := CyclicGroup(15);
<pc group of size 15 with 2 generators>
gap> Size(c15);
15
gap> s := SylowSubgroup(c15,3);
Group([ f1*f2^3 ])
gap> Size(s);
3
```

<!-- ================================================================================== -->

### In many algebra books the quaternion group is a group on 8 distinct symbols {i,j,k,1,-1,-i,-j,-k}. How can I make GAP use these elements?

GAP's group  constructors will generally, and by  default, construct a
group  of the  specified isomorphism  type, in  whatever form  is most
efficient for  computation. No specific nomenclature  for the elements
if guaranteed.

So
```gap
gap> q8 := SmallGroup(8,4);
<pc group of size 8 with 3 generators>
gap> Elements(q8);
[ <identity> of ..., f1, f2, f3, f1*f2, f1*f3, f2*f3, f1*f2*f3 ]
gap>
```
is a perfectly good description of a group of order 8 isomorphic to the group
generated by the quaternions i and j.

We can actually see that by making the group of quaternions:
```gap
gap> q := QuaternionAlgebra(Rationals);
<algebra-with-one of dimension 4 over Rationals>
gap> gens := GeneratorsOfAlgebraWithOne(q);
[ e, i, j, k ]
gap> e := gens[1]; i := gens[2]; j := gens[3]; k := gens[4];
e
i
j
k
gap> g := Group(i,j);
#I  default `IsGeneratorsOfMagmaWithInverses` method returns `true` for
[ i, j ]
<group with 2 generators>
gap> Elements(g);
[ (-1)*e, (-1)*i, (-1)*j, (-1)*k, k, j, i, e ]
gap> IsomorphismGroups(q8,g);
[ f1, f2, f3 ] -> [ j, i, (-1)*e ]
```

Here  we construct  the group  Q<sub>8</sub> that  you were  expecting,
list its elements and, in the last line, demonstrate an isomorphism between
the library group SmallGroup(8,4) and the group of quaternions.

Using this group g, we can, for instance print the normal subgroups

```gap
gap> Print(NormalSubgroups(g),"\n");;
[ Group( [ i, j ] ), Group( [ (-1)*k, (-1)*e ]), Group( [ (-1)*j, (-1)*e ] ),
Group( [ i, (-1)*e ] ), Group( [(-1)*e ] ), Group( e ) ]
```

Each subgroup is still given only in terms of generating elements because as
soon as your groups get much larger you almost never actually want the complete
list of elements. If you want them in this case, you can do

```gap
gap> for n in NormalSubgroups(g) do Print(Elements(n),"\n"); od;
[ (-1)*e, (-1)*i, (-1)*j, (-1)*k, k, j, i, e ]
[ (-1)*e, (-1)*k, k, e ]
[ (-1)*e, (-1)*j, j, e ]
[ (-1)*e, (-1)*i, i, e ]
[ (-1)*e, e ]
[ e ]
gap>
```

In general, if you want to see the elements of your group in some particular
notation, you need to construct the group from elements of that kind. Then, if
you ask for the Elements of a subgroup or coset, you will get what you want.
For instance, when you say you want the generating elements for a particular
subgroup of Q<sub>8</sub>, in what form do you want them? The standard
representation (because it's the best for computing), is as words in
what are called polycylic
generators. If you would prefer permutations, you can specify this when
constructing the group.

<!-- ================================================================================== -->

### I have a finite presentation for a finite polycyclic group. When I tried to use <tt>PcGroupFpGroup()</tt> to convert it to a pc-group, I received an error message.

<tt>PcGroupFpGroup()</tt> is mainly a conversion routine. The given finite
presentation must be a polycyclic presentation for
<tt>PcGroupFpGroup()</tt> to work. <tt>PcGroupFpGroup()</tt> does
<b>not</b> compute a polycyclic presentation for a finite soluble
group given  by an <b>arbitrary</b> finite presentation. See
{%- include ref.html label="Constructing Pc Groups" text="Constructing Pc Groups" %}.

In a
{%- include ref.html label="Pc Groups" text="polycyclic&nbsp;presentation" %}
the generators must occur in the  particular order of a 'polycyclic
generating sequence':

As described in the Reference Manual chapter
{%- include ref.html label="Polycyclic Groups" text="Polycyclic&nbsp;Groups" %}
a group G is polycyclic if there exists a subnormal series
G = C<sub>1</sub>> C<sub>2</sub>> ...  >  C<sub>n</sub>>
C<sub>n+1</sub>  =  {1}  with  cyclic factors, and  a  polycyclic
generating sequence   of G is  a sequence
P :  = (g<sub>1</sub>,..., g<sub>n</sub>) of elements of G  such that
C<sub>i</sub> = &lt;C<sub>i+1</sub>, g<sub>i</sub>> for
1 &le; i &le; n.

Now for the given presentation the order of the generators is defined
by the order in which the generators occur in the <tt>FreeGroup()</tt>
command.  This is important  because it fixes the way in which commutator
or conjugate relations have to be defined.

Relations have to be of the form
<pre>
                  g^m / w
                  Comm( h,g ) / w
                  h^g / w
</pre>
where
- <tt>m</tt> is a positive integer,
- <tt>h</tt> and <tt>g</tt> are generators,
- <tt>h</tt> occurs after <tt>g</tt> and
- <tt>w</tt> is a word in generators coming after <tt>g</tt>.

Note that you may have to use brackets around <tt>w</tt> if it is a
product of several generators because GAP  evaluates
the expressions above from left to right.

Changing the order of the generators or interchanging <tt>g</tt> and
<tt>h</tt> in the left hand side of a commutator or conjugate  relation
can produce an error message as shown by the following three examples
of presentations for the symmetric group S<sub>3</sub>.

##### Example 1
```gap
gap> f := FreeGroup(IsSyllableWordsFamily, "a","b");
<free group on the generators [ a, b ]>
gap>  a := f.1;; b := f.2;;
gap> rels := [a^2,b^3,b^a/b^2];
[ a^2, b^3, a^-1*b*a*b^-2 ]
gap> g:=f/rels;
<fp group on the generators [ a, b ]>
gap> Size(g);
6
gap> gpol := PcGroupFpGroup(g);
<pc group of size 6 with 2 generators>
```
Here we had started from a presentation that obeys the rules for a
polycyclic presentation.

##### Example 2
```gap
gap>  f := FreeGroup(IsSyllableWordsFamily, "b","a");
<free group on the generators [ b, a ]>
gap>  b := f.1;; a := f.2;;
gap>  rels := [a^2,b^3,b^a/b^2];
[ a^2, b^3, a^-1*b*a*b^-2 ]
gap>  g:=f/rels;
<fp group on the generators [ b, a ]>
gap>  Size(g);
6
gap>  gpol := PcGroupFpGroup(g);
Error, illegal relator a^-1*b*a*b^-2 called from
...
brk>
```
Here we have just interchanged the sequence of the generators, thus
breaking the rules, so that <tt>PcGroupFpGroup()</tt> does not work.

##### Example 3
```gap
gap>  f := FreeGroup(IsSyllableWordsFamily, "a","b");
<free group on the generators [ a, b ]>
gap>  a := f.1;; b := f.2;;
gap>  rels := [a^2,b^3,a^b/(b*a)];
[ a^2, b^3, b^-1*a*b*a^-1*b^-1 ]
gap>  g:=f/rels;
<fp group on the generators [ a, b ]>
gap>  Size(g);
6
gap>  gpol := PcGroupFpGroup(g);
Error, relator b^-1*a*b*a^-1*b^-1 is not trivial called from
...
brk>
```
Here the sequence of generators is correct, but the relator is not
in the prescribed form.

##### Some remarks
1. If we want to get a pc group from a finitely presented group,
   the presentation of which is not in the prescribed form, we can
   use the composite function <tt>Image(IsomorphismPcGroup(g))</tt>.
   Note, however, that this function does not work for finitely presented
   groups <tt>g</tt>, so that one first has e.g. to find a faithful
   permutation representation. In Example 3 this has implicitely already been
   done by calling  the function <tt>Size(g)</tt>. So we can continue
   Example 3:
   ```gap
   gap> phi:=IsomorphismPcGroup(g);
   [ a, b ] -> [ f1, f2^2 ]
   gap> h := Image(phi);
   Group([ f1, f2^2 ])
   gap> IsPcGroup(h);
   true
   gap> Size(h);
   6
   ```
2.  For many algorithms working with pc groups it is  additionally
   necessary that the above mentioned cyclic factors of the subnormal
   series are in fact of prime order. The function
   <tt>IsomorphismRefinedPcGroup(G)</tt> returns an isomorphism from G onto
   an isomorphic pc group with that property.
3. At present in order to print out a pc presentation you can
   best use a function from the package 'Polycyclic', as we demonstrate,
   again continuing the last example:
   ```gap
   gap> LoadPackage("polycyclic");
   true
   gap>  DisplayPcpGroup( PcGroupToPcpGroup(h) );
   < g1 g2 |

       g1^2 = id
       g2^3 = id

       g2^g1 = g2^2
   ```

<!-- ================================================================================== -->

### How do I get the elements of my group?

There are functions <tt>AsList</tt> and <tt>AsSSortedList</tt> that
return a (sorted) list of all the group elements. However for bigger
groups such lists can take an enormous amount of memory. You might be
better off just looking at the <tt>ConjugacyClasses</tt>.

<!-- ================================================================================== -->

### How do I get the subgroups of my group?

Everything said for elements holds even more so for subgroups: You
probably want only representatives of the conjugacy classes or even just
of subgroups of a given size.

For groups of moderate size (up to 10<sup>4</sup>/10<sup>5</sup>,
this depends a bit on the group structure) the commands
{%- include ref.html label="LatticeSubgroups" text="<tt>LatticeSubgroups</tt>" %} or
{%- include ref.html label="ConjugacyClassesSubgroups" text="<tt>ConjugacyClassesSubgroups</tt>" %}
will compute representatives of all subgroups up to conjugacy. If the group
gets bigger, however, this will either run out of space or take too long
to be feasible.

In this case it is likely that you are only interested in certain types of
subgroups. Try to use the restricting conditions to reduce the calculation
(for example <i>p</i>-subgroups can be found inside a Sylow subgroup).
GAP commands that might come useful to obtain specific
subgroups are for example
{%- include ref.html label="NormalSubgroups" text="<tt>NormalSubgroups</tt>" %},
{%- include ref.html label="SylowSubgroup" text="<tt>SylowSubgroup</tt>" %},
{%- include ref.html label="HallSubgroup" text="<tt>HallSubgroup</tt>" %},
or
{%- include ref.html label="MaximalSubgroupClassReps" text="<tt>MaximalSubgroupClassReps</tt>" %}.

Furthermore, if you actually want to know if the group has a subgroup of a
particular isomorphism type, the command you want is
{%- include ref.html label="IsomorphicSubgroups" text="<tt>IsomorphicSubgroups</tt>" %}.
This is enormously more efficient than simply listing all [conjugacy classes of] subgroups of
the group in most cases.

It might also be helpful to first replace the group by an isomorphic permutation group
(using {%- include ref.html label="IsomorphismPermGroup" text="<tt>IsomorphismPermGroup</tt>" %})
or pc group (using {%- include ref.html label="IsomorphismPcGroup" text="<tt>IsomorphismPcGroup</tt>" %}).

<!-- ================================================================================== -->

### Is GAP suited for studying combinatorial structures and finite permutation groups?

GAP  is suited very well for computing in
combinatorial structures and permutation groups. A small but
nevertheless illustrative example given by
{% include namelink.html name="Stefan Kohl" %}
in an answer to a letter to 'gap-support'
is the investigation of the automorphism group of a graph whose
vertices are the cards of a card game called
<a href="http://www.ehow.com/way_5207905_directions-duo-card-game.html">
Duo</a> with edges between any two cards that 'fit together'.

The game "Duo" consists of 4^3 = 64 "normal" cards each showing a
triple (colour, shape, number), where there are four possible colours,
shapes and numbers (any possible combination occurs exactly once)
and 3*4 = 12 jokers each showing either a colour, a shape or a number.
Two "normal" cards fit together if and only if they coincide in
two of their symbols. E.g. (red, square, 1) and (green, square, 1) fit
together, but (red, square, 1) and (red, triangle, 3) do not.
A joker fits together with a "normal" card if one of the three symbols
of the latter is the joker's, e.g. the (blue) joker fits together
with (blue, triangle, 4). Two jokers never fit together.

Although this may look a bit complicate, formulating it in the
GAP language is quite easy. For constructing the graph
we use the GAP package
<a href="https://gap-packages.github.io/grape">GRAPE</a> by Leonard Soicher:

```gap
gap> LoadPackage("grape"); # Construct the Duo graph with 4^3 + 12 = 76 vertices:
gap> vertices := Concatenation(List(Tuples([0..3],3),t->t+[0,4,8]),
>                              List([0..11],i->[i]));
gap> TrivialAction := function ( x, g ) return x; end;;
gap> Relation := function ( x, y )
>      return Length(Intersection(x,y)) = 2
>             or    (Length(x) = 1 or Length(y) = 1)
>                and Length(Intersection(x,y)) = 1 and x <> y;
>    end;;
gap> Gamma := Graph(Group(()),vertices,TrivialAction,Relation,true);;
```

We compute the automorphism group, again using GRAPE:

```gap
gap> G := AutGroupGraph(Gamma);
<permutation group with 9 generators>
gap> time; # time in ms
20
gap> DegreeAction(G); # Check: we really have 4^3 + 3*4 = 76 vertices.
76
```

The automorphism group acts transitively both on the "normal" cards
and on the jokers, but a "normal" card cannot be mapped onto a
joker or vice versa:

```gap
gap> orb := Orbits(G,[1..76]); # Compute the orbits on the set of vertices.
[ [ 1, 2, 3, 5, 4, 9, 17, 6, 13, 33, 10, 18, 7, 49, 14, 34, 11, 19, 21, 8,
       50, 15, 35, 37, 12, 20, 25, 22, 51, 53, 16, 36, 41, 38, 29, 26, 23, 52,
       57, 54, 45, 42, 39, 30, 27, 24, 61, 58, 55, 46, 43, 40, 31, 28, 62, 59,
       56, 47, 44, 32, 63, 60, 48, 64 ],
   [ 65, 69, 73, 74, 75, 70, 76, 71, 66, 72, 67, 68 ] ]
gap> List(orb,Length);
[ 64, 12 ]
```

The action of the automorphism group on the "normal" cards is primitive,
but the one on the jokers is not:

```gap
gap> G1 := Action(G,orb[1]); # The action of G on the first orbit.
<permutation group with 9 generators>
gap> G2 := Action(G,orb[2]); # The action of G on the second orbit.
<permutation group with 9 generators>
gap> IsPrimitive(G1,MovedPoints(G1));
true
gap> IsPrimitive(G2,MovedPoints(G2));
false
```

Both actions are faithful:

```gap
gap> Size(G);
82944
gap> List([G1,G2],Size);
[ 82944, 82944 ]
```

The automorphim group is solvable, but not nilpotent:

```gap
gap> Factors(Size(G));
[ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3 ]
gap> IsSolvable(G);
true  # Obvious (by Burnside's Theorem).
gap> IsNilpotent(G);
false
gap> List(LowerCentralSeries(G),Size);
[ 82944, 20736 ]
gap> List(DerivedSeries(G),Size);
[ 82944, 20736, 6912, 1728, 64, 1 ]
```

The action of the automorphism group on the jokers is the imprimitive
action of the wreath product of the symmetric group of degree 4 and
the symmetric group of degree 3 on 3*4 = 12 points, and the action of
the automorphism group on the "normal" cards is
the primitive action of this wreath product on 4^3 = 64 points:

```gap
gap> GeneratorsOfGroup(G2);
[ (1,2)(6,9)(8,11)(10,12), (2,3)(4,6)(5,8)(7,10), (3,4), (4,5), (5,7), (6,8),
(8,10), (9,11), (11,12) ]
gap> H := TransitiveGroup(12,TransitiveIdentification(G2));
# Group structure in human-readable form
[S(4)3]S(3)=S(4)wrS(3)
gap> Size(H); # A check.
82944
gap> 6*24^3; # dito.
82944
gap> W := WreathProduct(Group((1,2),(1,2,3,4)),Group((1,2),(1,2,3)));
<permutation group of size 82944 with 8 generators>
gap> phi := IsomorphismGroups(G,W);   # A concrete isomorphism.
[ (1,21,6,26,11,19)(2,25,7,18,9,23)(3,17,5,22,10,27)(4,29,8,30,12,31)(13,24,
     14,28,15,20)(16,32)(33,53,38,58,43,51)(34,57,39,50,41,55)(35,49,37,54,42,
     59)(36,61,40,62,44,63)(45,56,46,60,47,52)(48,64)(65,66)(67,68)(69,73,70,
     74,71,75)(72,76), (1,46,7,29,35,22)(2,14,15,31,19,18)(3,30)(4,62,11,32,51,
     26)(5,45,39,21,33,38)(6,13,47,23,17,34)(8,61,43,24,49,42)(9,48,55,25,36,
     54)(10,16,63,27,20,50)(12,64,59,28,52,58)(40,53,41)(44,56,57)(65,72,75,66,
     69,74)(67,70,73)(68,71,76) ] -> [ (1,2)(3,4)(5,9,8,10,7,12)(6,11),
   (1,9,5)(2,10,6)(3,11,7,4,12,8) ]
```

<!-- ================================================================================== -->

### How can one compute the Schur Multiplier of a finite group by GAP?

Derek Holt answered:

One possibility is to use the package
<a href="https://gap-packages.github.io/cohomolo">cohomolo</a>.
You first have to follow the instructions in the package directory to
compile the external programs.

It calculates the Schur multiplier with respect to a given prime, so you need
to try all primes dividing the group order. The input group must be a
permutation group (the degree of which is presently restricted to at most
4096). Here is an example.

```gap
gap> G:=PSL(3,4);;
gap> chr := CHR(G,2);;
# This constructs a 'cohomology-record' that is used in all further functions
gap> SchurMultiplier(chr);
[ 4, 4 ]
gap> chr := CHR(G,3);;
gap> SchurMultiplier(chr);
[ 3 ]
gap> chr := CHR(G,5);;
gap> SchurMultiplier(chr);
#The Sylow p-subgroup of the group is cyclic - so the multiplier is trivial.
[  ]
gap> chr := CHR(G,7);;
gap> SchurMultiplier(chr);
#The Sylow p-subgroup of the group is cyclic - so the multiplier is trivial.
[  ]
```

We conclude that the Schur multiplier is a direct product of cyclic groups
of order 4, 4 and 3.

It is also possible to compute finite presentations of covering groups.

Derek Holt gave the warning: "But this package involves
external C programs, and it is only possible to use it under Unix or Linux."

However in a further
<a href="https://www.gap-system.org/ForumArchive2/2004/000926.html">
letter</a>   Dima Pasechnik added:

> In Fact  "cohomolo" also runs seemingly OK on Windows with Cygwin
(<a href="https://www.cygwin.com">https://www.cygwin.com</a>).
Note however that there are a couple of very minor changes in the installation
procedure of the package.

Finally Alexander Hulpke added:

> Let  me just  add to Derek  Holt's response,  that GAP also  has a
built-in  routine  for  multiplier  calculation.   The  commands  are
`AbelianInvariantsMultiplier`   (structure   of   the  multiplier)   and
`EpimorphismSchurCover`  (map  from  a  covering group,  represented  as
finitely  presented group, onto  original group)

```gap
gap> AbelianInvariantsMultiplier(SymmetricGroup(6));
[ 2 ]
gap> EpimorphismSchurCover(SymmetricGroup(6));
[ f1, f2,  f3, f4, f5 ] -> [(1,2), (2,3), (3,4), (4,5), (5,6)]
```
The algorithms
used are similar to the ones  used by the `cohomolo` package, the main
advantage of the library implementation is that it does not require an
external  program  and thus  can  also run  under  Windows  or if  the
`cohomolo` package is not  installed.

Comparison of runtimes
of the  two implementations shows that  for 'small' groups  (say up to
order  20000) there  is  no significant  difference,  while for  large
groups the implementation in the cohomolo package runs faster (e.g. in
an  experiment by  Derek Holt  for  PSp(6,3) of  order 4585351680  the
corresponding times were 6 and 80 seconds respectively).

<!-- ================================================================================== -->

### How can one use GAP to check that given presentation is a nilpotent group of class 2 or not?

Is it possible using GAP to check that a given presentation defines a nilpotent group of class 2 or not?

For example $G=\langle  a,b,c| a^{p^5}, b^{p^3}, c^{p^2},
[a,b]=a^{p^3}, [a,c]=c^p, [b,c]=b^{p^2} \rangle $ where $p$ is a
prime.

Also how can we determine its automorphism group using GAP?

 Answer:

 The question was asked in this form in a GAP Forum letter  on Jan. 27, 2010
  and was answered in the Forum by three letters  on  Jan. 28. The answer
 given here joins the contents of these.

First  please note that the 'example' really is not a presentation of a
single group, but a family of presentations parametrized by the primes p.
GAP has no methods for handling such a family of presentations in one step.
However GAP has methods to investigate  each such presentation   for any
given (not too big) prime p.   In her reply Bettina Eick recommends:

> you can use GAP to investigate your question for any fixed prime p.
> 
> For example, the nilpotent quotient algorithm of the NQ package or the
> NQL package of GAP allows you to determine the largest class-c quotient
> of a finitely presented group for any positive integer c or even the
> largest nilpotent quotient (if this exists).
> 
> Further, there are methods available in GAP to determine the automorphism
> group of a finite p-group. Check the AutPGrp package for this purpose.
> 
> In your given example, you can implement your considered group G in GAP
> as function in p:
> 
> ```gap
> G := function(p)
>     local F, f, r, a, b, c;
>     F := FreeGroup(3);
>     f := GeneratorsOfGroup(F); a := f[1]; b := f[2]; c := f[3];
>     r := [a^(p^5), b^(p^3), c^(p^2),
>           Comm(a,b)/a^(p^3),
>           Comm(a,c)/c^p,
>           Comm(b,c)/b^(p^2) ];
>     return F/r;
> end;
> ```
> 
> Then you load the relevant packages
> 
> ```gap
> LoadPackage("nq");
> LoadPackage("autpgrp");
> ```
> 
> And then you can do the following (for example for p=3):
> 
> ```gap
> gap> H := G(3);
> [fp group on the generators [ f1, f2, f3 ]]
> gap> K := NilpotentQuotient(H);
> Pcp-group with orders [ 27, 9, 3, 9, 3, 3 ]
> gap> Length(LowerCentralSeries(K));
> 3
> gap> A := AutomorphismGroupPGroup(K);;
> gap> A.size;
> 14348907
> ```
> 
> Hence for p=3 your group has class 2 and you can see the size
> of its automorphism group. Generators and further information on
> the automorphisms is also stored in A, but is perhaps too long to
> be displayed here.

In a second letter Derek Holt  recommends:

> You can use  the GAP package KBMAG to prove nilpotency of finitely presented
> groups, using the method described by Charles Sims in his book of computing
> in finitely presented groups. This uses the Knuth-Bendix completion
> algorithm.
> 
> This process is described and illustrated in Example 4 (p. 13) of the KBMAG
> manual. I have successfully verifed that your group below is nilpotent of
> order p^10 for p=2,3,5,7,11,13,17, and I am trying to do 19.
> 
> Of course, since these groups are (apparently) finite, you could try
> use coset enumeration. This will work for small primes such as 2 and 3, but
> for larger primes the group order will probably be too large, and I think
> the Sims algorithm will work better.
> 
> You first run NilpotentQuotient (as described in Bettina Eick's reply) to
> find the maximal nilpotent quotient of your group. The aim is then to
> prove that the group is actually isomorphic to this quotient.
> You do this by introducing new generators in the presentation which
> correspond to the power-commutator generators in the maximal nilpotent
> quotient. You order the generators so that those at the bottom of the
> group come first and then use the so-called recursive ordering on strings
> to run Knuth-Bendix.
> 
> Here is the basic GAP code to do this.
> 
> ```gap
> LoadPackage("kbmag");
> SetInfoLevel(InfoRWS,2);
> F:=FreeGroup("j","i","h","g","f","e","d","c","b","a");;
> j:=F.1;; i:=F.2;; h:=F.3;; g:=F.4;; f:=F.5;;
> e:=F.6;; d:=F.7;; c:=F.8;; b:=F.9;; a:=F.10;;
> p:=3;;
> rels := [a^p/e, b^p/f, c^p/d, e^p/g, f^p/h, g^p/i, i^p/j,
>         j^p, h^p, d^p, Comm(a,b)/i, Comm(a,c)/d, Comm(b,c)/h ];;
> G := F/rels;;
> R := KBMAGRewritingSystem(G);;
> SetOrderingOfKBMAGRewritingSystem(R, "recursive");
> MakeConfluent(R);
> ```
> 
> If successful it will halt with a confluent presentation containing the
> relations of the power-commutator presentation of the computed maximal
> nilpotent quotient. You have then proved that these relations hold in
> the group itself (not just in the nilptent quotient), so you have proved
> that the group is nilpotent.  This consists of 65 reduction equations
> (or 62 when p=2).
> 
> The above works quickly for p=2,3,5,7. For larger primes, it helps to
> restrict the length of the stored reduction relations, and then re-run
> after completion. You have to experiment to find the optimal maximal
> length to store.  So, for example, the following works fast for p=17:
> 
> ```gap
> p:=17;;
> rels := [a^p/e, b^p/f, c^p/d, e^p/g, f^p/h, g^p/i, i^p/j,
>         j^p, h^p, d^p, Comm(a,b)/i, Comm(a,c)/d, Comm(b,c)/h ];;
> G := F/rels;;
> R := KBMAGRewritingSystem(G);;
> SetOrderingOfKBMAGRewritingSystem(R, "recursive");
> O := OptionsRecordOfKBMAGRewritingSystem(R);
> O.maxstoredlen := [40,40];
> MakeConfluent(R);
> Unbind(O.maxstoredlen);
> MakeConfluent(R);
> ```

In a final letter  Charles Wright  gave  an elegant proof  'by hand' that in
fact all the groups for arbitrary primes  are of nilpotency class 2 and order at
most p^10, a proof, the clues for which can perhaps be obtained from the
results of the GAP computations (which of course can be applied in
similar form also to other presentations). He writes:

<blockquote>
If all you want to show is that this particular example is class 2 of
order (at most) p^10, though, it's easy to do it by hand.

We're given that a^b = a^(1+p^3), c^a = c^(1-p) and b^c = b^(1+p^2).

Hence, (a^(p^3))^b = (a^b)^(p^3) = a^((1+p^3)p^3) = a^(p^3) and

c^(a^(p^3)) = c^((1-p)^(p^3)) = c  [what a mess of superscripts!],

so a^(p^3) (i.e., [a,b]) is in Z(G).

Similarly, a^(b^(p^2)) = a^((1+p^3)^(p^2)) = a and

(b^(p^2))^c = (b^c)^(p^2) = b^((1+p^2)p^2) = b^(p^2), so

b^(p^2) (i.e., [b,c]) is central.

Finally, (c^p)^a = c^((1-p)p) = c^p and b^(c^p) = b^((1+p^2)^p) = b, so

c^p (i.e., [a,c]) is central.

Thus G/Z(G) is abelian. Since G' has order (at most) p^4 and G/G' has
order (at most) p^6, G has order (at most) p^10.

In the spirit of Burnside, I'll leave the elimination of "(at most)" to
the reader.
</blockquote>

<!-- ================================================================================== -->

### How do I use GAP to "identify" a given group?

One of the most frequent requests that comes up is for  to
"identify" a given group. While some functionality for this exists, the
problem is basically what "identify" means, or what a user expects from
identification:

<ul>
<li>For tiny orders (say up to 15), there are few groups up to isomorphism, and
each of the groups has a "natural" name. Furthermore many these names belong
into series (symmetric groups, dihedral groups, cyclic groups) and the
remaining groups are in obvious ways (direct product or possibly semidirect
product) composed from groups named this way.
</li>

<li>
This clean situation breaks down quickly once the order increases: for
example there are
- up to isomorphism - 14 groups of order 16, 231 of order 96 and over 10
million of order 512. This rapid growth goes beyond any general "naming"
or "composition" scheme.
</li>

<li>
A decomposition as semidirect, subdirect or central product is not uniquely
defined without some further information, which can be rather extensive to
write down.
</li>

<li>
Even if one might hope that a particular group would be composable in a nice
way, this does not lead to an "obvious" description, for example the same
group of order 16 could be described for example as a semidirekt product of
D<sub>8</sub> with a cyclic group of order 2 (i.e.
D<sub>8</sub>:C<sub>2</sub>), or as semidirect product of Q<sub>8</sub> with
a cyclic group of order 2 (Q<sub>8</sub>:C<sub>2</sub>), or as
(C<sub>2</sub>&times;C<sub>4</sub>):C<sub>2</sub> (and - vice versa -
the last name could be given to 4 nonisomorphic groups). In the context of
matrix groups in characteristic 2, S<sub>3</sub> is better called
SL<sub>2</sub>(2), and so on.
</li>

<li>
There are libraries of different classes of groups (e.g. small order up to
isomorphism, or transitive subgroup of S<sub>n</sub> (for small n) up to
conjugacy); these libraries typically allow to identify a given group, but
the identification is just like the library call number of a book and gives
little information about the group, it is mainly of use to allow recreation
of the group with the identification number given as only information.
</li>
</ul>

With these caveats, the following functions exist to identify groups and
give them a name:

<tt>StructureDescription</tt>
returns a string describing the
isomorphism type of a group . This string is produced recursively,
trying to decompose groups as direct or semidirect products. The resulting
string does <b>not</b> identify isomorphism types, nor is it neccessarily
the most "natural" description of a group.

```gap
gap> g:=Group((1,2,3),(2,3,4));;
gap> StructureDescription(g);
"A4"
```

<h3>Group Libraries</h3>
 contains extensive libraries of "small" groups and many of these
libraries allow identificatuion of a group therein. The associated library
group then often comes with a name that might be appropriate.

<h4>Small Groups</h4>
The small groups library contains - amongst others - all groups of order
 up to 1000, except 512. For such a group <tt>IdGroup</tt> returns a list
 such that the group is isomorphic to
<tt>SmallGroup()</tt>.

```gap
gap> g:=Group((1,2,3),(2,3,4));;
gap> IdGroup(g);
[ 12, 3 ]
gap> SmallGroup(12,3);
<pc group of size 12 with 3 generators>
```

<h4>Transitive Groups</h4>
 The transitive groups library contains transitive subgroups of S<sub>n</sub> of
degree  at most 31 up to S<sub>n</sub> conjugacy. For such a group of degree n,
<tt>TransitiveIdentification</tt> returns a number , such that the
group is conjugate in S<sub>n</sub> to <tt>TransitiveGroup()</tt>.

```gap
gap> g:=Group((1,2,3),(2,3,4));;
gap> TransitiveIdentification(g);
4
gap> TransitiveGroup(NrMovedPoints(g),4);
A4
```

<h4>Primitive Groups</h4>
 The primitive groups library contains primitive subgroups of S<sub>n</sub> (i.e. the
group is transitive and affords no nontrivial G-invariant partition of
the points) of
degree  at most 1000 up to S<sub>n</sub> conjugacy. For such a group of degree n,
<tt>PrimitiveIdentification</tt> returns a number , such that the
group is conjugate in S<sub>n</sub> to <tt>PrimitiveGroup()</tt>.

```gap
gap> g:=Group((1,2,3),(2,3,4));;
gap> IsPrimitive(g,[1..4]);
true
gap> PrimitiveIdentification(g);
1
gap> PrimitiveGroup(NrMovedPoints(g),1);
A(4)
```

<h4>Simple groups and Composition Series</h4>
The one class of groups for which it is unambiguous, and comparatively easy
to assign names to is finite simple groups (assuming the classification of
finite simple groups). A consequence of the classification is that
the order of a simple group determines its isomorphism type, with the
exception of two infinite series (which can be distinguished easily
otherwise).

In GAP, this is achieved by the command
<tt>IsomorphismTypeInfoFiniteSimpleGroup</tt>: For a finite simple group, it
returns a record, containing information about the groups structure, as well
as some name.

```gap
gap> g:=SL(3,5);
SL(3,5)
gap> IsomorphismTypeInfoFiniteSimpleGroup(g/Centre(g));
rec( name := "A(2,5) = L(3,5) ", series := "L", parameter := [ 3, 5 ] )
```

Clearly, this can be applied to the composition series of a finite group,
identifying the isomorphism types of all composition factors. (Of course,
this information does not identify the isomorphism type of the group, and -
in particular for solvable groups - can be rather uninformative.)
The command <tt>DisplayCompositionSeries</tt>
 will print information about the composition factors of a finite group.

```gap
gap> DisplayCompositionSeries(SymmetricGroup(4));
G (4 gens, size 24)
 | Z(2)
S (3 gens, size 12)
 | Z(3)
S (2 gens, size 4)
 | Z(2)
S (1 gens, size 2)
 | Z(2)
1 (0 gens, size 1)
gap> DisplayCompositionSeries(SymmetricGroup(5));
G (2 gens, size 120)
 | Z(2)
S (3 gens, size 60)
 | A(5) ~ A(1,4) = L(2,4) ~ B(1,4) = O(3,4) ~ C(1,4) = S(2,4) ~ 2A(1,4)
   = U(2,4) ~ A(1,5) = L(2,5) ~ B(1,5) = O(3,5) ~ C(1,5)
   = S(2,5) ~ 2A(1,5) = U(2,5)
1 (0 gens, size 1)
gap> DisplayCompositionSeries(GU(6,2));
G (size 82771476480)
 | Z(3)
S (4 gens, size 27590492160)
 | 2A(5,2) = U(6,2)
S (1 gens, size 3)
 | Z(3)
1 (size 1)
```



<!-- ================================================================================== -->

### Can non-isomorphic groups have equal structure descriptions?

Yes, indeed, this can happen.
{%- include ref.html label="StructureDescription" text="The manual entry for \"StructureDescription\"" %}
says: "The   string  returned  by  StructureDescription  is  NOT  an  isomorphism
invariant:  non-isomorphic  groups  can  have the same string value, and two
isomorphic   groups  in  different  representations  can  produce  different
strings."

{%- include ref.html label="StructureDescription" text="StructureDescription" %}
provides an "informal" overview of the structure of a group, which is a useful
first view for small groups. More sophisticated functions in the same area include:
{%- include ref.html book="smallgrp" label="IdGroup" text="IdGroup" %}; the
<tt>StandardPresentation</tt>
function of the <a href="https://gap-packages.github.io/anupq/">ANUPQ package</a> and
{%- include ref.html label="IsomorphismGroups" text="IsomorphismGroups" %},
each of which is described in the appropriate manual.

<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->

## Programming GAP
<!-- ================================================================================== -->

### Can I call GAP functions from another programme?

What you can do is to run  GAP in a child process and communicate with
it using  pipes, pseudo-ttys,  UNIX FIFOs or  some similar  device. We
have  done this  successfully in  a number  of projects,  and  you can
contact the  support list for more  detailed advice if you  want to go
down this route.

One can also embed the entire GAP system as a C library, though one can't
embed individual functions by themselves, and the first call to this
library still has to invoke the full GAP start-up sequence.

Alternatively, there are a number of ways of running GAP as a server
process and calling it from C of C++ programs. See the
[SCSCP package](https://gap-packages.github.io/scscp/) for the GAP side.
There are several C and C++ libraries that implement the client side.

<!-- ================================================================================== -->

### Where is the GAP file editor? How do I save GAP programs?

GAP programs are simple text files, and you can edit them with
any text editor. Some editors may support GAP syntax highlighting and have 
other useful features:

- [BBEdit](https://www.barebones.com/products/bbedit/index.shtml) for macOS,
  using this
  <a href="https://dev.quendi.de/gap/GAPLanguageModule.plist">syntax highlighting module</a>
  by {% include namelink.html name="Max Horn" %}. To install it for BBEdit,
  download the file [GAPLanguageModule.plist](https://dev.quendi.de/gap/GAPLanguageModule.plist)
  and place it in the directory `~/Library/Application Support/BBEdit/Language Modules`.
  You may have to create this directory if it does not exist.
  Then restart BBEdit for it to become available.
- <a href="https://www.gnu.org/software/emacs/">emacs</a>, with the
  <a href="https://melpa.org/#/gap-mode">major-mode for editing GAP files</a> by Ivan Andrus.

- <a href="http://www.jedit.org/">jEdit</a> (exact configuration to be documented soon)

- <a href="https://kate-editor.org/">Kate</a> (out-of-box)

- <a href="https://notepad-plus-plus.org/">Notepad++</a> for Windows, using
  <a href="http://dev.quendi.de/gap/gap.xml">syntax highlighting module</a>
  by {% include namelink.html name="Max Horn" %}). To install, download the
  <a href="http://dev.quendi.de/gap/gap.xml">gap.xml</a>, then select
  "Define your language..." from the "Language" menu in Notepad++.
  In the resulting dialog, click the "Import..." button.
  This opens a file selector dialog, with which you should point to
  the gap.xml file. After that close the "User Defined Language" dialog.

- <a href="https://www.pspad.com/">PsPAD</a> for Windows (out-of-box; see also the alternative
  <a href="https://gist.github.com/olexandr-konovalov/68cea8bd9332a06e08b1#file-gap-ini">GAP.INI</a>
  file by {% include namelink.html name="Olexandr Konovalov" %})

- <a href="https://www.peterborgapps.com/smultron/">Smultron</a> for macOS, using
  <a href="https://gist.github.com/olexandr-konovalov/9a71271870728a448982#file-gap-plist">syntax highlighting module</a>
  by {% include namelink.html name="Olexandr Konovalov" %})

- <a href="https://www.vim.org/">vim</a>
  (see {%- include ref.html label="Editor Support" %}
  and the 'etc' directory of the GAP installation)

- <a href="https://code.visualstudio.com/">Visual Studio Code</a> for Linux, Windows, macOS,
  using the <a href="https://marketplace.visualstudio.com/items?itemName=gap.gap">GAP syntax highlighting extension</a>
  by {% include namelink.html name="Chris Jefferson" %})


You can call  GAP files anything you  like, although we
generally use names  ending .g, .gap, .gd or .gi. It may help Windows
users  to give them  names ending  .txt.  Once  you have  written your
program,  you  can execute  it  using  the  Read() command  in
GAP. Note  that within  GAP the  path
separator character is always '/', so you might say:

```gap
gap> Read("d:/gapfiles/program.g");
```

to read a file that Windows would call `D:\gapfiles\program.g`.
