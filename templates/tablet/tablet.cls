\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tablet}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=TBT,
    prefix=TBT@
}

\DeclareStringOption[article]{style}
\DeclareBoolOption{sansfont}

\ProcessKeyvalOptions*

\LoadClass[12pt]{\TBT@style}

\ifTBT@sansfont
    \RequirePackage{newtxsf} % Sans font
    \renewcommand{\familydefault}{\sfdefault}
\else
    \RequirePackage{newtxtext} % Times font
\fi

\RequirePackage[en-GB]{datetime2}
\RequirePackage{geometry}
\RequirePackage[export]{adjustbox}
\RequirePackage{subfiles}
\RequirePackage[bookmarksnumbered,colorlinks=true,allcolors=black,bookmarks=true]{hyperref}

\geometry{
    papersize={15.4cm,20.5cm},
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includeheadfoot,
    headsep=0.6cm,
    footskip=0.9cm
}

\ifnum\pdf@strcmp{\TBT@style}{article}=0
\renewcommand{\maketitle}{%
    \vspace*{-10pt}
    \begin{center}
    \huge\@title\vskip1ex\normalsize\@author\vskip1ex\@date
    \end{center}
    \vspace{10pt}
}
\else\ifnum\pdf@strcmp{\TBT@style}{report}=0
\renewcommand{\maketitle}{
    \vspace*{.19\textheight}
    \begin{minipage}[c][.62\textheight][c]{\dimexpr\textwidth - 2\parindent\relax}\centering
        {\noindent\ignorespaces\bfseries\fontsize{35}{44}\selectfont\@title\par}%
        \vfill
        {\noindent\Large\@author\vskip1ex\normalsize\@date\par}%
    \end{minipage}\setcounter{page}{0}
}
\fi\fi