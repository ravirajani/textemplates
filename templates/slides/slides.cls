\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}
\usefonttheme{professionalfonts}

\def\hmargin{2em}

\RequirePackage{times}
\RequirePackage[scaled=0.8]{FiraMono}
\RequirePackage{sfmath}
\RequirePackage[UKenglish]{babel}
\RequirePackage[UKenglish]{isodate}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{array}
\RequirePackage{mathtools}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage[export]{adjustbox}
\RequirePackage{import}
\RequirePackage[labelformat=empty]{caption}
\RequirePackage{xpatch}

\xpatchcmd{\itemize}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{1.5ex}% separation for first level
     \setlength\topsep{1.5ex}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{1.5ex}% separation for second level
       \setlength\topsep{1.5ex}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{1ex}% separation for third level
         \setlength\topsep{1ex}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}

 \xpatchcmd{\beamer@enum@}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{1.5ex}% separation for first level
     \setlength\topsep{1.5ex}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{1.5ex}% separation for second level
       \setlength\topsep{1.5ex}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{1ex}% separation for third level
         \setlength\topsep{1ex}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}

\newenvironment{pseudocode}{%
\setbeamertemplate{itemize/enumerate body begin}{\normalsize}%
\setbeamertemplate{itemize/enumerate subbody begin}{\normalsize}%
\xpatchcmd{\itemize}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{.5ex}% separation for first level
     \setlength\topsep{.5ex}
     \setlength\leftmargin{0pt}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{.5ex}% separation for second level
       \setlength\topsep{.5ex}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{.5ex}% separation for third level
         \setlength\topsep{.5ex}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}
 }{}

\definecolor{OUCoreBlue}{RGB}{6,6,69}
\definecolor{OUMidBlue}{RGB}{28,70,192}
\definecolor{OUDarkBlue}{RGB}{68,62,137}
\definecolor{OULightBlue}{RGB}{102,238,250}
\definecolor{OUGreen}{RGB}{125,255,211}
\definecolor{OUYellow}{RGB}{255,244,136}
\definecolor{OULightYellow}{RGB}{255,249,178}

\def\titleboxheight{\dimexpr\paperheight - 4em\relax}
\def\titletopmargin{\dimexpr 2em + .5\textheight - .5\paperheight\relax}

\defbeamertemplate*{title page}{OUTitlePage}[1][]
{%
  \nointerlineskip%
  \vspace{\titletopmargin}
  \begin{minipage}[c][.28\titleboxheight][t]{\textwidth}\raggedright
  \usebeamercolor[fg]{title}\usebeamerfont{title}\inserttitle%
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][t]{\textwidth}\raggedright
  \usebeamercolor[fg]{title}\usebeamerfont{subtitle}\insertsubtitle%
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][c]{\textwidth}\raggedright
  \usebeamercolor[fg]{author}
  \usebeamerfont{author}\insertauthor\par%
  \usebeamerfont{institute}\insertinstitute\par%
  \usebeamerfont{date}\insertdate%
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][b]{\textwidth}
  \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic%
\end{minipage}%
}

\defbeamertemplate*{frametitle}{OUTitlePage}[1][left]
{%
\vspace{0.1cm}
\nointerlineskip%
\begin{columns}
  \column{\dimexpr\paperwidth - 0.7cm\relax}%
  \begin{beamercolorbox}[#1,dp=0.3cm,ht=0.7cm]{frametitle}
    \usebeamerfont{frametitle}%
    \insertframetitle\par%
  \end{beamercolorbox}%
\end{columns}
}

\setbeamercolor{palette primary}{fg=white,bg=OUCoreBlue}
\setbeamercolor{palette secondary}{fg=white,bg=OUCoreBlue}
\setbeamercolor{palette tertiary}{fg=white,bg=OUCoreBlue}
\setbeamercolor{palette quaternary}{fg=white,bg=OUCoreBlue}
\setbeamercolor{normal text}{fg=OUCoreBlue}
\setbeamercolor{author}{fg=white}
\setbeamercolor{institute}{fg=white}
\setbeamercolor{date}{fg=white}
\setbeamercolor{title}{fg=white}
\setbeamercolor{subsection in head/foot}{fg=OUYellow}
\setbeamercolor{page number in head/foot}{fg=OUCoreBlue}
\setbeamercolor{titlelike}{fg=OUCoreBlue}
\setbeamercolor{structure}{fg=OUCoreBlue}
\setbeamercolor{subsection in toc}{fg=OUMidBlue}
\setbeamercolor{section in toc}{fg=OUCoreBlue}
\setbeamercolor{example text}{fg=OUMidBlue}
\setbeamercolor{block title}{fg=OUMidBlue}
\setbeamercolor{description item}{fg=OUMidBlue}

\setbeamerfont{title}{series=\bfseries,size=\huge}
\setbeamerfont{subtitle}{series=\mdseries,size=\Large}
\setbeamerfont{author}{series=\bfseries,size=\fontsize{10pt}{14pt}}
\setbeamerfont{institute}{series=\mdseries,size=\fontsize{10pt}{14pt}}
\setbeamerfont{date}{series=\mdseries,size=\fontsize{10pt}{14pt}}
\setbeamerfont{frametitle}{series=\bfseries,size=\Large}
\setbeamerfont{caption}{size=\normalsize}

\setbeamertemplate{sections/subsections in toc}[sections numbered]
\setbeamertemplate{itemize items}[default]
\setbeamertemplate{enumerate item}[default]
\setbeamertemplate{enumerate subitem}{\alph{enumii})}
\setbeamertemplate{footline}[page number]
\setbeamertemplate{title page}[OUTitlePage]
\setbeamertemplate{frametitle}[OUFrameTitle]

\setbeamersize{text margin left=\hmargin,text margin right=\hmargin}

\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}

\beamertemplatenavigationsymbolsempty