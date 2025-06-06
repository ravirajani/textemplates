\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slides}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}
\usefonttheme[onlymath]{serif}

\newlength{\hmargin}
\newlength{\htab}
\newlength{\vgap}
\newlength{\vgapsm}
\newlength{\titleboxheight}
\newlength{\titleboxoffset}
\newlength{\titletopmargin}
\setlength\hmargin{2em}
\setlength\htab{3ex}
\setlength\vgap{1.5ex}
\setlength\vgapsm{.5ex}
\setlength\belowcaptionskip{0pt}

\RequirePackage{newtxmath}
\RequirePackage[scaled=0.78]{FiraMono}
\RequirePackage[scaled]{helvet}
\RequirePackage{anyfontsize}
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

\useinnertheme[rounded,shadow=false,shaded=false]{tcolorbox}
\tcbset{fonttitle=\upshape,fontupper=\upshape,center title}

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
\definecolor{OULightBlue}{RGB}{219,227,250}
\definecolor{OUGreen}{RGB}{8,160,69}
\definecolor{OULightGreen}{RGB}{216,249,218}
\definecolor{OURed}{RGB}{221,28,26}
\definecolor{OULightRed}{RGB}{255,229,218}
\definecolor{OUYellow}{RGB}{255,253,152}

\DeclareCaptionFont{blue}{\color{OUMidBlue}}
\captionsetup{labelformat=empty,textfont=blue}

\setbeamercolor{palette primary}{fg=white,bg=Core}
\setbeamercolor{palette secondary}{fg=white,bg=Core}
\setbeamercolor{palette tertiary}{fg=white,bg=Core}
\setbeamercolor{palette quaternary}{fg=white,bg=Core}
\setbeamercolor{normal text}{fg=black}
\setbeamercolor{author}{fg=white}
\setbeamercolor{institute}{fg=white}
\setbeamercolor{date}{fg=white}
\setbeamercolor{title}{fg=white}
\setbeamercolor{subsection in head/foot}{fg=OUYellow}
\setbeamercolor{page number in head/foot}{fg=Core}
\setbeamercolor{frametitle}{fg=OUMidBlue}
\setbeamercolor{structure}{fg=black}
\setbeamercolor{subsection in toc}{fg=OUMidBlue}
\setbeamercolor{section in toc}{fg=black}
\setbeamercolor{block title example}{fg=white,bg=OUGreen}
\setbeamercolor{block body example}{fg=black,bg=OULightGreen}
\setbeamercolor{block title alerted}{fg=white,bg=OURed}
\setbeamercolor{block body alerted}{fg=black,bg=OULightRed}
\setbeamercolor{alerted text}{fg=OURed}
\setbeamercolor{block title}{fg=white,bg=OUMidBlue}
\setbeamercolor{block body}{fg=black,bg=OULightBlue}
\setbeamercolor{description item}{fg=OUMidBlue}
\setbeamercolor{proof title}{fg=OUMidBlue}

\setbeamerfont{title}{series=\bfseries,size=\huge}
\setbeamerfont{subtitle}{series=\mdseries,size=\Large}
\setbeamerfont{author}{series=\bfseries,size=\normalsize}
\setbeamerfont{institute}{series=\mdseries,size=\normalsize}
\setbeamerfont{date}{series=\mdseries,size=\normalsize}
\setbeamerfont{frametitle}{series=\bfseries,size=\large}
\setbeamerfont{caption}{size=\normalsize}
\setbeamerfont{block title}{size=\normalsize}
\setbeamerfont{block title example}{size=\normalsize}
\setbeamerfont{block title alerted}{size=\normalsize}
\setbeamerfont{proof title}{size=\normalsize,shape=\itshape}

\setbeamertemplate{sections/subsections in toc}[sections numbered]
\setbeamertemplate{itemize items}[default]
\setbeamertemplate{enumerate item}[default]
\setbeamertemplate{enumerate subitem}{\alph{enumii})}
\setbeamertemplate{footline}[frame number]

\newcommand{\adjusttitlepadding}{%
  \setlength\titleboxoffset{4em}%
  \setlength\titleboxheight{\dimexpr\paperheight - \titleboxoffset\relax}%
  \setlength\titletopmargin{\dimexpr .5\titleboxoffset + .5\textheight - .5\paperheight\relax}%
  \vspace{\titletopmargin}
}

\setbeamertemplate{title page}{\adjusttitlepadding\nointerlineskip%
\begin{columns}
\column{\dimexpr\paperwidth - 2\hmargin\relax}
\begin{minipage}[c][.24\titleboxheight][t]{.5\paperwidth}\raggedright
  \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic%
\end{minipage}\begin{minipage}[c][.24\titleboxheight][t]{.5\paperwidth - 2\hmargin\relax}\raggedleft
  \usebeamercolor[fg]{date}\usebeamerfont{date}\insertdate
\end{minipage}
\begin{minipage}[t][.52\titleboxheight][c]{\paperwidth - 2\hmargin}\centering
  \usebeamercolor[fg]{title}\usebeamerfont{title}\inserttitle\\[20pt]
  \usebeamercolor[fg]{title}\usebeamerfont{subtitle}\insertsubtitle\\[20pt]
  \usebeamercolor[fg]{author}%
  \usebeamerfont{author}\insertauthor\\
  \usebeamerfont{institute}\insertinstitute
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][c]{\paperwidth - 2\hmargin}
\end{minipage}\end{columns}}

\setbeamertemplate{end page}{\adjusttitlepadding\nointerlineskip%
\begin{columns}
\column{\dimexpr\paperwidth - 2\hmargin\relax}
\begin{minipage}[c][.24\titleboxheight][t]{\paperwidth - 2\hmargin}\raggedright
  \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic%
\end{minipage}
\begin{minipage}[c][.52\titleboxheight][c]{\paperwidth - 2\hmargin}\centering
  \usebeamercolor[fg]{title}\usebeamerfont{title}Thank you%
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][c]{\paperwidth - 2\hmargin}
\end{minipage}\end{columns}}

\setbeamertemplate{frametitle}{\nointerlineskip%
\begin{beamercolorbox}[center,wd=\paperwidth,ht=2em,dp=.5ex]{frametitle}
  \insertframetitle
\end{beamercolorbox}}


\setbeamersize{text margin left=\hmargin,text margin right=\hmargin}

\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}

\beamertemplatenavigationsymbolsempty

\setbeamertemplate{proof begin}{\vspace{0.5ex}%
{\usebeamercolor[fg]{proof title}\usebeamerfont*{proof title}%
\insertproofname}%
}
\setbeamertemplate{proof end}{\vskip.5ex}
\renewenvironment<>{proof}[1][\proofname]{%
    \par
    \def\insertproofname{#1\enspace}%
    \pushQED{\qed}
    \usebeamertemplate{proof begin}#2}
  {\popQED\usebeamertemplate{proof end}}

\newenvironment<>{plainblock}[1]{%
  \begin{actionenv}#2%
    \def\insertblocktitle{#1}%
    \par%
    \only<presentation>{\setbeamerfont{block title}{size=\large}%
      \setbeamercolor{block title}{fg=OUMidBlue,bg=}%
      \setbeamercolor{block body}{fg=black,bg=}}%
    \setbeamertemplate{blocks}[default]%
    \usebeamertemplate{block begin}}
  {\par%
    \usebeamertemplate{block end}%
  \end{actionenv}}
