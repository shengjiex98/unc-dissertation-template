# UNC Dissertation Template

A minimal LaTeX template conforming to the [UNC Graduate School Thesis and Dissertation Guide](https://gradweb.unc.edu/content/academics/thesis-diss/guide/) based on [KOMA-Script](https://ctan.org/pkg/koma-script). My dissertation is accepted by the Graduate School in April 2026 using this tempalte.

All of the Graduate School's formatting rules are encoded in the class file, so you should not need to hand-tune any formatting yourself. The goal is to keep the user-facing boilerplate as close to zero as possible.

Tested on [TeX Live 2026](https://www.tug.org/texlive/) and [Overleaf](https://www.overleaf.com/).

## Files

- [`thesis.tex`](template/thesis.tex): the main document you edit
- [`thesis.bib`](template/thesis.bib): your bibliography database
- [`uncthesis.cls`](template/uncthesis.cls): the class that implements the formatting defaults
- [`mimosis-bibliography.tex`](template/mimosis-bibliography.tex) and [`mimosis-english.lbx`](template/mimosis-english.lbx): optional bibliography tweaks inspired by [latex-mimosis](https://github.com/Pseudomanifold/latex-mimosis)

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
