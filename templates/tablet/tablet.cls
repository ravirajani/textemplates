\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tablet}

\RequirePackage{etoolbox}
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

\ifdefstring{\TBT@style}{exercises}{\def\docstyle{article}}{\def\docstyle{\TBT@style}}

\LoadClass[12pt]{\docstyle}

\ifTBT@sansfont
    \RequirePackage{newtxsf} % Sans font
    \renewcommand{\familydefault}{\sfdefault}
\else
    \RequirePackage{newtxtext} % Times font
\fi

\RequirePackage[scaled=0.85]{FiraMono}
\RequirePackage[UKenglish]{babel}
\RequirePackage[UKenglish]{isodate}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage[export]{adjustbox}
\RequirePackage{subfiles}
\RequirePackage[bookmarksnumbered,colorlinks=true,allcolors=blue,bookmarks=true]{hyperref}

\newcommand{\subtitle}[1]{%
\appto{\titlewithsubtitle}{\ifdefstring{\TBT@style}{report}{%
\LARGE#1}{\ifdefstring{\TBT@style}{article}{\large}{\normalsize}#1\vskip1ex}}%
}

\geometry{
    footskip=0.9cm,
    includefoot
}

\ifbool{TBT@nohead}{
\geometry{
    total={13.4cm,19.2cm},
    marginratio={1:1,7:2}
}}{
\geometry{
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includehead,
    headsep=0.6cm
}}

\ifbool{TBT@handout}{
\geometry{
    paper=a4paper,
    total={13.4cm,24.7cm},
    marginratio=1:1
}}{
\geometry{papersize={15.4cm,20.5cm}}
}

\newcommand\titlewithsubtitle{%
\ifdefstring{\TBT@style}{report}{%
    \Huge\bfseries\@title\vskip1ex%
}{\Large\ifdefstring{\TBT@style}{article}{\bfseries}{}\@title\vskip.75ex}%
\normalfont}

\ifdefstring{\TBT@style}{article}{
\renewcommand{\maketitle}{\begin{center}
    \titlewithsubtitle\vskip1ex
    \ifcsempty{@author}{}{\normalsize\@author\vskip1ex}
    \ifcsempty{@date}{}{\small\@date\vskip20pt}
    \thispagestyle{plain}
\end{center}}
}{\ifdefstring{\TBT@style}{report}{
\renewcommand{\maketitle}{\nointerlineskip\vspace*{.19\textheight}%
\begin{minipage}[c][.62\textheight][c]{\dimexpr\textwidth - 2\parindent\relax}\centering
    \titlewithsubtitle\vfill\Large\normalfont\@author\vskip1.5ex\large\@date\par%
\end{minipage}\setcounter{page}{0}\thispagestyle{empty}\newpage}
}{\ifdefstring{\TBT@style}{exercises}{
\renewcommand{\maketitle}{\begin{center}
    \titlewithsubtitle\vskip1ex
    \ifcsempty{@author}{}{\normalsize\@author\vskip1ex}
    \ifcsempty{@date}{}{\small\textbf{Due \@date}\vskip15pt}
    \thispagestyle{plain}
\end{center}}
}{}}}
