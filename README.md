Brian Campbell's Markdown Resume
================================

This repository contains my resume, in Markdown format.  The basic
structure was inspired by that of [Christophe-Marie Duquesne][chmd],
with some other inspiration from a derivative by [Mark
Szepieniec][mszep], with some styling changes to suit my tastes, as
well as a change to using CSS grid to make the layout easier to work
with.

[chmd]: https://blog.chmd.fr/editing-a-cv-in-markdown-with-pandoc.html
[mszep]: https://github.com/mszep/pandoc_resume

### Build Instructions

First, make sure that you have `make` and `pandoc` installed.  They
are packaged in most package managers under those names.

``` bash
git clone https://github.com/lambda/resume
cd resume
make
```

This should produce `resume.html` that you can open in your web
browser.

### How It Works

`pandoc` is a tool which is able to convert between a variety of
different markup languages.  Its internal model is similar to an
extended version of [Markdown][] or [CommonMark][] (a standardized
dialect of Markdown), and it provides an extended version of
CommonMark which can target this model.  It is also able to parse and
generate markup corresponding to this model in a variety of other
formats, such as HTML, TeX, RTF, docx, and more.

This repo contains a `Makefile` which specifies how to convert my
resume to HTML using `pandoc`, including a reference to the CSS file
which formats it attractively.  It uses mostly standard
Markdown/CommonMark elements, with a few Pandoc extensions like the
[definition list][] and [en-dash][smart].

The CSS formatting is fairly simple; the body is a centered, fixed
width column to avoid the text being too wide.  Colors are defined
using CSS variables, to avoid repetition without having to use a CSS
pre-processor; according to ["Can I use..."][caniuse-variables], this is
supported by over 95% of clients, so given the technical audience of
my resume and the fact that if this doesn't work you only lose some
color, should be OK.

Elements within the body are laid out using CSS grid ([94% support
rate][caniuse-grid]), with two columns in a 1:5 ratio.  To display the
dates and details in different columns, which are marked up in a
definition list, I use `display: contents` for the definition list
element itself, which causes its children to be laid out as if they
were children of the parent of the definition list.  This works in
[92% of clients][caniuse-display-contents], with the caveat that
there's a bug in Chrome causing the definition list itself to be taken
out of the accessibility tree.  Since the definition list itself
doesn't convey very much meaning, it is simply a way to allow pairing
of date ranges with the job description at the time, I don't think
losing this one element from the accessibility tree should be too big
of a problem, but if it is let me know and I can update the
formatting.

[Markdown]: https://daringfireball.net/projects/markdown/
[CommonMark]: https://commonmark.org/
[definition list]: https://pandoc.org/MANUAL.html#definition-lists
[smart]: https://pandoc.org/MANUAL.html#extension-smart
[caniuse-variables]: https://caniuse.com/css-variables
[caniuse-grid]: https://caniuse.com/css-grid
[caniuse-display-contents]: https://caniuse.com/css-display-contents
