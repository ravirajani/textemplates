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
\RequirePackage{titling}

\geometry{
    papersize={15.4cm,20.5cm},
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includeheadfoot,
    headsep=0.6cm,
    footskip=0.9cm
}

\ifnum\pdf@strcmp{\TBT@style}{article}=0
\setlength{\droptitle}{-30pt}
\else\ifnum\pdf@strcmp{\TBT@style}{report}=0
\renewcommand{\maketitle}{
    \vspace*{.19\textheight}
    \begin{minipage}[c][.62\textheight][c]{\dimexpr\textwidth - 2\parindent\relax}\centering
        \Huge\@title\vfill\Large\@author\vskip1em\large\@date\par%
    \end{minipage}\setcounter{page}{0}\thispagestyle{empty}
}
\fi\fi