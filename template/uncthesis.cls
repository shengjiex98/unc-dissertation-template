%%
%% uncthesis.cls — UNC Chapel Hill PhD Dissertation Class
%%
%% Implements formatting requirements from the UNC Graduate School
%% Thesis and Dissertation Guide. Based on KOMA-Script scrbook.
%%
%% Usage:
%%   \documentclass[12pt]{uncthesis}
%%   \title{...}  \author{...}  \advisor{...}
%%   \department{...}  \school{...}  \degree{...}  \gradyear{...}
%%   \committee{\member{First Last}\member{First Last}...}
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uncthesis}[2026/03/04 UNC Chapel Hill PhD Dissertation]

%% ── Options ────────────────────────────────────────────────────────
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{scrbook}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{scrbook}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{scrbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ExecuteOptions{12pt}
\ProcessOptions\relax

%% ── Base class ─────────────────────────────────────────────────────
\LoadClass[
  oneside,
  numbers=noenddot,
  listof=totoc,
  titlepage=false,
  toc=bibliography,
  headings=normal,
]{scrbook}

%% ── Core packages ──────────────────────────────────────────────────
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{iftex}

\ifpdftex
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\fi

\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage[nopatch=footnote]{microtype}
\RequirePackage{lmodern}
\RequirePackage[table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{caption}
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black,
  unicode,
  bookmarksopen=true,
]{hyperref}
\RequirePackage{bookmark}
\RequirePackage[acronym]{glossaries}
\glsdisablehyper
\makenoidxglossaries
\RequirePackage[
  autocite=plain,
  backend=biber,
  doi=true,
  url=true,
  giveninits=true,
  hyperref=true,
  maxbibnames=99,
  maxcitenames=99,
  sortcites=true,
  style=numeric,
]{biblatex}

%% ── Page geometry ──────────────────────────────────────────────────
%% UNC: 1" margins all sides; page numbers centered 1/2" from bottom.
\RequirePackage[
  letterpaper,
  left=1in,
  right=1in,
  top=1in,
  bottom=1in,
  head=24pt,
  footskip=0.5in,
  includehead=false,
  includefoot=false,
]{geometry}

%% ── Spacing ────────────────────────────────────────────────────────
%% UNC: double-spaced throughout; single-space block quotes, captions,
%% footnotes, and bibliography entries.
\RequirePackage{setspace}
\doublespacing
\setlength{\parindent}{0.5in}

\AtBeginEnvironment{quote}{
\begin{singlespace}}
  \AtEndEnvironment{quote}{
\end{singlespace}}
\AtBeginEnvironment{quotation}{
\begin{singlespace}}
  \AtEndEnvironment{quotation}{
\end{singlespace}}

%% ── Page style ─────────────────────────────────────────────────────
%% UNC: centered bottom page numbers only, no running headers/footers.
\AfterPackage{scrlayer-scrpage}{%
  \setlength{\footheight}{\baselineskip}%
}
\RequirePackage{scrlayer-scrpage}
\clearpairofpagestyles
\cfoot[\pagemark]{\pagemark}
\pagestyle{scrheadings}

%% ── Heading fonts ──────────────────────────────────────────────────
\setkomafont{disposition}{\normalfont\bfseries}
\setkomafont{chapter}{\normalfont\bfseries\normalsize\MakeUppercase}
\setkomafont{section}{\normalfont\bfseries\normalsize}
\setkomafont{subsection}{\normalfont\bfseries\normalsize}
\setkomafont{caption}{\small}
\setkomafont{captionlabel}{\small}
\renewcommand{\raggedchapter}{\centering}

%% ── Chapter formatting ─────────────────────────────────────────────
%% UNC: first page of each chapter starts 2" from top (1" margin + 1" skip).
\renewcommand*{\chapterheadstartvskip}{\vspace*{1in}}
\renewcommand*{\chapterheadendvskip}{\vspace{\baselineskip}}

\renewcommand*{\chapterformat}{%
  \mbox{\MakeUppercase{\chaptername}\nobreakspace\thechapter:\enskip}%
}
\renewcommand{\chapterlinesformat}[3]{%
  #2#3%
}

%% ── Widow/orphan penalties ─────────────────────────────────────────
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

%% ── Metadata commands ──────────────────────────────────────────────
\newcommand{\unc@advisor}{}
\newcommand{\unc@department}{Computer Science}
\newcommand{\unc@school}{the College of Arts and Sciences}
\newcommand{\unc@degree}{Doctor of Philosophy}
\newcommand{\unc@year}{\the\year}
\newcommand{\unc@committeelist}{}

\newcommand{\advisor}[1]{\renewcommand{\unc@advisor}{#1}}
\newcommand{\department}[1]{\renewcommand{\unc@department}{#1}}
\newcommand{\school}[1]{\renewcommand{\unc@school}{#1}}
\newcommand{\degree}[1]{\renewcommand{\unc@degree}{#1}}
\newcommand{\gradyear}[1]{\renewcommand{\unc@year}{#1}}

\makeatletter
\newcommand{\member}[1]{%
  \g@addto@macro\unc@committeelist{#1\\[\baselineskip]}%
}
\newcommand{\committee}[1]{%
  \renewcommand{\unc@committeelist}{}%
  #1%
}
\makeatother

%% ── Title page ─────────────────────────────────────────────────────
%% UNC: title ALL CAPS centered 2" from top; author 1" below title;
%% required statement 1" below name; "Chapel Hill" + year 1" below
%% statement; "Approved by:" with committee names right-aligned;
%% no page number printed (counts as page i).
\makeatletter
\newcommand{\maketitlepage}{%
  \begin{titlepage}
    \thispagestyle{empty}%
    {\centering
      \singlespacing
      \vspace*{\dimexpr 1in - \topskip\relax}%
      {\MakeUppercase{\@title}}\\
      \vspace*{1in}%
      {\@author}\\
      \vspace*{1in}%
      A dissertation submitted to the faculty at the University of North
      Carolina at Chapel Hill in partial fulfillment of the requirements
      for the degree of \unc@degree{} in the Department of
      \unc@department{} in \unc@school.\\
      \vspace*{1in}%
      Chapel Hill\\
      \unc@year\par
    \par}
    \vspace{1in}
    \hfill
    \begin{tabular}[h]{l@{}}
      Approved by:\\
      \unc@committeelist
    \end{tabular}
  \end{titlepage}%
}
\makeatother

%% ── Copyright page ─────────────────────────────────────────────────
%% UNC: © year, author ALL CAPS, ALL RIGHTS RESERVED; single-spaced,
%% centered near bottom; page ii (Roman numeral).
\makeatletter
\newcommand{\makecopyrightpage}{%
  \clearpage
  \thispagestyle{plain}%
  \vspace*{\fill}%
  {\centering
    \singlespacing
    \textcopyright{} \unc@year\\
    \MakeUppercase{\@author}\\
    ALL RIGHTS RESERVED\par
  }%
  \vspace{1in}%
  \clearpage
}
\makeatother

%% ── Front-matter helpers ───────────────────────────────────────────
%% Shared environment for front-matter pages (abstract, dedication,
%% acknowledgments, preface, abbreviations). Starts a new page with the
%% plain page style, adds 1" of vertical space (for 2" from top with the
%% 1" top margin), and optionally prints a bold centered ALL CAPS heading.
\newenvironment{uncfrontmatter}[1]{
  \clearpage
  \thispagestyle{plain}%
  \vspace*{\dimexpr 1in - \headheight\relax}%
  \ifstrempty{#1}{}{%
    {\centering%
      \textbf{\MakeUppercase{#1}}%
    \par}%
  }%
}{%
  \clearpage
}

%% UNC: "ABSTRACT" ALL CAPS centered 2" from top; author name, title,
%% and advisor below; text double-spaced, max 350 words.
\makeatletter
\newenvironment{uncabstract}{%
  \begin{uncfrontmatter}{ABSTRACT}
    {\centering \singlespacing
      \@author : \@title\\*%
      (Under the direction of \unc@advisor)
    \par}
    \vspace{\baselineskip}%
    \ignorespaces%
  }{%
  \end{uncfrontmatter}
}
\makeatother

%% ── Dedication environment ─────────────────────────────────────────
%% UNC: no heading required; centered text beginning 2" from top.
\newenvironment{uncdedication}{%
  \begin{uncfrontmatter}{}
    \centering\ignorespaces%
  }{%
  \end{uncfrontmatter}
}

%% ── Acknowledgments environment ────────────────────────────────────
%% UNC: "ACKNOWLEDGMENTS" ALL CAPS centered 2" from top; text one
%% double-spaced line below heading.
\newenvironment{uncacknowledgments}{%
  \begin{uncfrontmatter}{ACKNOWLEDGMENTS}
    \vspace{\baselineskip}%
    \ignorespaces%
  }{%
  \end{uncfrontmatter}
}

%% ── Preface environment ────────────────────────────────────────────
\newenvironment{uncpreface}{%
  \begin{uncfrontmatter}{PREFACE}
    \vspace{\baselineskip}%
    \ignorespaces%
  }{%
  \end{uncfrontmatter}
}

%% ── Table of Contents / Lists ──────────────────────────────────────
%% UNC: headings ALL CAPS, centered; ToC begins 2" from top;
%% LoT/LoF headings 1" from top; leader dots to page numbers.
%% Override section names. Use babel's \addto mechanism to ensure these
%% survive babel's caption resets.
\makeatletter
\AtBeginDocument{%
  \renewcommand{\contentsname}{TABLE OF CONTENTS}%
  \renewcommand{\listtablename}{LIST OF TABLES}%
  \renewcommand{\listfigurename}{LIST OF FIGURES}%
  \@ifpackageloaded{babel}{%
    \addto\captionsenglish{%
      \renewcommand{\contentsname}{TABLE OF CONTENTS}%
      \renewcommand{\listtablename}{LIST OF TABLES}%
      \renewcommand{\listfigurename}{LIST OF FIGURES}%
    }%
  }{}%
}
\makeatother

\RedeclareSectionCommands[toclinefill=\TOCLineLeaderFill]{%
  chapter,section,subsection,subsubsection%
}

\makeatletter
\renewcommand*{\addchaptertocentry}[2]{%
  \addtocentrydefault{chapter}{#1}{\MakeUppercase{#2}}%
  \if@chaptertolists
  \doforeachtocfile{%
    \Iftocfeature{\@currext}{chapteratlist}{%
      \addxcontentsline{\@currext}{chapteratlist}[{#1}]{\MakeUppercase{#2}}%
    }{}%
  }%
  \fi
}
\makeatother

\BeforeTOCHead[lof]{%
  \clearpage
  \thispagestyle{plain}%
  \renewcommand*{\chapterheadstartvskip}{}%
}

\BeforeTOCHead[lot]{%
  \clearpage
  \thispagestyle{plain}%
  \renewcommand*{\chapterheadstartvskip}{}%
}

%% ── List of Abbreviations ──────────────────────────────────────────
%% Uses \makenoidxglossaries / \printnoidxglossary so no external
%% makeglossaries/makeindex run is needed.  Mirrors the LoF/LoT
%% pattern so the TOC hyperlink lands at the top of the page.
\makeatletter
\newcommand{\makelistofabbreviations}{%
  \clearpage
  \thispagestyle{plain}%
  \phantomsection
  \addcontentsline{toc}{chapter}{LIST OF ABBREVIATIONS}%
  {\centering \textbf{LIST OF ABBREVIATIONS}\par}%
  \vspace{\baselineskip}%
  \begingroup
  \renewcommand{\glossarysection}[2][]{}%
  \printnoidxglossary[
    type=\acronymtype,
    style=long,
    nonumberlist,
    nogroupskip
  ]%
  \endgroup
  \clearpage
}
\makeatother

%% ── Bibliography ───────────────────────────────────────────────────
%% UNC: "REFERENCES" heading ALL CAPS centered; single-spaced within
%% entries, double-spaced between entries. Deferred until biblatex loads.
\makeatletter
\AtEndPreamble{%
  \@ifpackageloaded{biblatex}{%
    \defbibheading{bibliography}[\bibname]{%
      \chapter*{REFERENCES}%
      \addcontentsline{toc}{chapter}{REFERENCES}%
    }%
    \AtBeginBibliography{%
      \singlespacing
      \setlength{\bibitemsep}{\baselineskip}%
    }%
  }{}%
  \@ifpackageloaded{caption}{%
    \captionsetup{font={singlespacing}}%
  }{}%
}
\makeatother

%% ── Pagination ─────────────────────────────────────────────────────
%% UNC: Roman numerals for front matter (title = i, not printed);
%% Arabic numerals starting at 1 from Chapter 1.
\makeatletter
\let\unc@origfrontmatter\frontmatter
\renewcommand{\frontmatter}{%
  \unc@origfrontmatter
  \pagenumbering{roman}%
}

\let\unc@origmainmatter\mainmatter
\renewcommand{\mainmatter}{%
  \unc@origmainmatter
  \pagenumbering{arabic}%
}
\makeatother

\endinput
