# UNC Dissertation Template

A minimal LaTeX template conforming to the [UNC Graduate School Thesis and Dissertation Guide](https://gradweb.unc.edu/content/academics/thesis-diss/guide/) based on [KOMA-Script](https://ctan.org/pkg/koma-script).

All of the Graduate School's formatting rules — margins, spacing, title page layout, TOC conventions, and the rest — are encoded in the class file, so you should not need to hand-tune any formatting yourself. The goal is to keep the user-facing boilerplate as close to zero as possible: fill in your metadata, write your content, and compile.

I (mostly [Claude](https://code.claude.com/docs/en/overview)) built this because I wanted the smallest possible setup that still handled all the formatting requirements. This is largely similar to the other templates out there and is nothing special, but if you are a minimalist or have OCD, the setup of this template will hopefully make you very happy.

Tested on [TeX Live 2026](https://www.tug.org/texlive/) and [Overleaf](https://www.overleaf.com/).

## Files

- [`thesis.tex`](template/thesis.tex): the main document you edit
- [`thesis.bib`](template/thesis.bib): your bibliography database
- [`uncthesis.cls`](template/uncthesis.cls): the class that implements the formatting defaults
- [`mimosis-bibliography.tex`](template/mimosis-bibliography.tex) and [`mimosis-english.lbx`](template/mimosis-english.lbx): optional bibliography tweaks

## Quick Start

1. Copy or clone this repository.
2. Edit the metadata block at the top of [`thesis.tex`](/Users/jerry/Papers/unc-dissertation-template/thesis.tex).
3. Replace the placeholder abstract, dedication, acknowledgments, and chapter text.
4. Add your bibliography entries to [`thesis.bib`](/Users/jerry/Papers/unc-dissertation-template/thesis.bib).
5. Add chapters inline or split them into separate files with `\input{...}`.

The main metadata you need is:

- `\title`
- `\author`
- `\advisor`
- `\department`
- `\gradyear`
- `\committee{...}`
- `\school`
- `\degree`

## Example Structure

The default template keeps everything in one file so you can get started immediately. If you want a slightly larger project layout, something like this works well:

```text
.
├── thesis.tex
├── thesis.bib
├── uncthesis.cls
└── chapters/
    ├── introduction.tex
    └── methods.tex
```

Then in `thesis.tex`:

```tex
\mainmatter
\input{chapters/introduction}
\input{chapters/methods}
```
