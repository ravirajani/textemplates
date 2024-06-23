\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tablet}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=TBT,
    prefix=TBT@
}

\DeclareStringOption[article]{style}
\DeclareBoolOption{sansfont}
\DeclareBoolOption{nohead}

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

\ifTBT@nohead
\geometry{
    papersize={15.4cm,20.5cm},
    total={13.4cm,19.2cm},
    marginratio={1:1,3:1},
    includefoot,
    footskip=0.9cm
}
\else
\geometry{
    papersize={15.4cm,20.5cm},
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includeheadfoot,
    headsep=0.6cm,
    footskip=0.9cm
}
\fi

\ifnum\pdf@strcmp{\TBT@style}{article}=0
\setlength{\droptitle}{-30pt}
\else\ifnum\pdf@strcmp{\TBT@style}{report}=0
\renewcommand{\maketitle}{
    \nointerlineskip\vspace*{.19\textheight}%
    \begin{minipage}[c][.62\textheight][c]{\dimexpr\textwidth - 2\parindent\relax}\centering
        \Huge\bfseries\@title\vfill\Large\normalfont\@author\vskip1.5ex\large\@date\par%
    \end{minipage}\setcounter{page}{0}\thispagestyle{empty}
}
\fi\fi