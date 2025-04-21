\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tablet}

\RequirePackage{ifthen}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=TBT,
    prefix=TBT@
}

\DeclareStringOption[article]{style}
\DeclareBoolOption{sansfont}
\DeclareBoolOption{nohead}
\DeclareBoolOption{handout}

\ProcessKeyvalOptions*

\ifthenelse{\equal{\TBT@style}{exercises}}{\def\docstyle{article}}{\def\docstyle{\TBT@style}}

\LoadClass[12pt]{\docstyle}

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
    footskip=0.9cm,
    includefoot
}

\ifTBT@nohead
\geometry{
    total={13.4cm,19.2cm},
    marginratio={1:1,7:2}
}
\else
\geometry{
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includehead,
    headsep=0.6cm
}
\fi

\ifTBT@handout
\geometry{
    paper=a4paper,
    total={13.4cm,24.7cm},
    marginratio=1:1
}
\else
\geometry{papersize={15.4cm,20.5cm}}
\fi

\ifnum\pdf@strcmp{\TBT@style}{article}=0
\renewcommand{\maketitle}{\begin{center}
    \Large\textbf{\@title}\vskip1.5ex
    \normalsize\@author\vskip1.5ex
    \small\@date\vskip20pt
    \thispagestyle{plain}
\end{center}}
\else\ifnum\pdf@strcmp{\TBT@style}{report}=0
\renewcommand{\maketitle}{\nointerlineskip\vspace*{.19\textheight}%
\begin{minipage}[c][.62\textheight][c]{\dimexpr\textwidth - 2\parindent\relax}\centering
    \Huge\bfseries\@title\vfill\Large\normalfont\@author\vskip1.5ex\large\@date\par%
\end{minipage}\setcounter{page}{0}\thispagestyle{empty}}
\else\ifnum\pdf@strcmp{\TBT@style}{exercises}=0
\renewcommand{\maketitle}{\begin{center}
    \Large\@title\vskip1ex
    \normalsize\@author\vskip1.5ex
    \small\textbf{Due \@date}\par
    \thispagestyle{plain}
\end{center}}
\fi\fi\fi
