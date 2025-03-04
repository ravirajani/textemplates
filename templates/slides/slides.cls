\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}
\usefonttheme{professionalfonts}

\newlength{\hmargin}
\newlength{\htab}
\newlength{\vgap}
\newlength{\vgapsm}
\setlength\hmargin{2em}
\setlength\htab{3ex}
\setlength\vgap{1.5ex}
\setlength\vgapsm{.5ex}
\setlength\belowcaptionskip{0pt}

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
\RequirePackage{caption}
\RequirePackage{xpatch}

\xpatchcmd{\itemize}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{\vgap}% separation for first level
     \setlength\topsep{\vgap}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{\vgap}% separation for second level
       \setlength\topsep{\vgap}
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
     \setlength\itemsep{\vgap}% separation for first level
     \setlength\topsep{\vgap}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{\vgap}% separation for second level
       \setlength\topsep{\vgap}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{1ex}% separation for third level
         \setlength\topsep{1ex}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}

\newenvironment{pseudocode}[1][0pt]{%
\setbeamertemplate{itemize/enumerate body begin}{\normalsize}%
\setbeamertemplate{itemize/enumerate subbody begin}{\normalsize}%
\setbeamertemplate{itemize/enumerate subsubbody begin}{\normalsize}%
\xpatchcmd{\itemize}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{\vgapsm}% separation for first level
     \setlength\topsep{\vgapsm}
     \setlength\leftmargin{#1}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{\vgapsm}% separation for second level
       \setlength\topsep{\vgapsm}
       \setlength\leftmargin{\htab}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{\vgapsm}% separation for third level
         \setlength\topsep{\vgapsm}
         \setlength\leftmargin{\htab}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}
 }{}

\definecolor{Core}{RGB}{27, 27, 25}
\definecolor{OUMidBlue}{RGB}{28,70,192}
\definecolor{OUDarkBlue}{RGB}{68,62,137}
\definecolor{OULightBlue}{RGB}{189,212,231}
\definecolor{OUGreen}{RGB}{8,160,69}
\definecolor{OULightGreen}{RGB}{216,249,218}
\definecolor{OURed}{RGB}{221,28,26}
\definecolor{OULightRed}{RGB}{255,229,218}
\definecolor{OUYellow}{RGB}{255,253,152}

\DeclareCaptionFont{blue}{\color{OUMidBlue}}
\captionsetup{labelformat=empty,textfont=blue}

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

\setbeamercolor{palette primary}{fg=white,bg=Core}
\setbeamercolor{palette secondary}{fg=white,bg=Core}
\setbeamercolor{palette tertiary}{fg=white,bg=Core}
\setbeamercolor{palette quaternary}{fg=white,bg=Core}
\setbeamercolor{normal text}{fg=Core}
\setbeamercolor{author}{fg=white}
\setbeamercolor{institute}{fg=white}
\setbeamercolor{date}{fg=white}
\setbeamercolor{title}{fg=white}
\setbeamercolor{subsection in head/foot}{fg=OUYellow}
\setbeamercolor{page number in head/foot}{fg=Core}
\setbeamercolor{titlelike}{fg=Core}
\setbeamercolor{structure}{fg=Core}
\setbeamercolor{subsection in toc}{fg=OUMidBlue}
\setbeamercolor{section in toc}{fg=Core}
\setbeamercolor{block title example}{fg=white,bg=OUGreen}
\setbeamercolor{block body example}{fg=Core,bg=OULightGreen}
\setbeamercolor{block title alerted}{fg=white,bg=OURed}
\setbeamercolor{block body alerted}{fg=Core,bg=OULightRed}
\setbeamercolor{alerted text}{fg=OURed}
\setbeamercolor{block title}{fg=white,bg=OUMidBlue}
\setbeamercolor{block body}{fg=Core,bg=OULightBlue}
\setbeamercolor{description item}{fg=OUMidBlue}

\setbeamerfont{title}{series=\bfseries,size=\huge}
\setbeamerfont{subtitle}{series=\mdseries,size=\Large}
\setbeamerfont{author}{series=\bfseries,size=\fontsize{10pt}{13pt}}
\setbeamerfont{institute}{series=\mdseries,size=\fontsize{10pt}{13pt}}
\setbeamerfont{date}{series=\mdseries,size=\fontsize{10pt}{13pt}}
\setbeamerfont{frametitle}{series=\bfseries,size=\Large}
\setbeamerfont{caption}{size=\normalsize}
\setbeamerfont{block title}{size=\normalsize}
\setbeamerfont{block title example}{size=\normalsize}
\setbeamerfont{block title alerted}{size=\normalsize}

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