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
\RequirePackage[scaled=0.85]{FiraMono}
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
\RequirePackage{tcolorbox}
\tcbuselibrary{skins}
\RequirePackage{tikz}
\usetikzlibrary{tikzmark}

\renewcommand<>{\colorbox}[2]{%
\alt#3{\beameroriginal\colorbox{#1}{#2}}{\beameroriginal\colorbox{white}{#2}}}
\newcommand<>{\hlight}[1]{\colorbox#2{OUYellow}{#1}}
\newcommand<>{\midblue}[1]{\textcolor#2{OUMidBlue}{#1}}

\newcommand\rectstart{\tikzmark{start}}
\newcommand\rectstop{\tikzmark{stop}}
\newcommand<>{\drawrect}{
\begin{tikzpicture}[remember picture,overlay]
  \draw#1[red,thick,rounded corners] ([yshift=-4pt+\baselineskip,xshift=-2em]pic cs:start) rectangle ([yshift=-4pt,xshift=2em]pic cs:stop);
\end{tikzpicture}
}

\xpatchcmd{\itemize}
  {\def\makelabel}
  {\ifnum\@itemdepth=1\relax
     \setlength\itemsep{\vgap}% separation for first level
     \setlength\topsep{\vgap}
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{1ex}% separation for second level
       \setlength\topsep{1ex}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{0pt}% separation for third level
         \setlength\topsep{0pt}
         \setlength\leftmargin{2ex}
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
       \setlength\itemsep{1ex}% separation for second level
       \setlength\topsep{1ex}
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{0pt}% separation for third level
         \setlength\topsep{0pt}
   \fi\fi\fi\def\makelabel
  }
 {}
 {}

\newenvironment{pseudocode}[1][0pt]{%
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
\definecolor{OULightGrey}{RGB}{211,211,211}
\definecolor{OUGrey}{RGB}{112,112,112}
\definecolor{OUMidBlue}{RGB}{28,70,192}
\definecolor{OUDarkBlue}{RGB}{68,62,137}
\definecolor{OULightBlue}{RGB}{219,227,250}
\definecolor{OUPaleBlue}{RGB}{237,241,253}
\definecolor{OUDarkGreen}{RGB}{0,82,0}
\definecolor{OUGreen}{RGB}{8,160,69}
\definecolor{OULightGreen}{RGB}{216,249,218}
\definecolor{OUDarkRed}{RGB}{201,27,24}
\definecolor{OURed}{RGB}{221,28,26}
\definecolor{OULightRed}{RGB}{255,229,218}
\definecolor{OUYellow}{RGB}{255,253,152}

\DeclareCaptionFont{blue}{\color{OUMidBlue}}
\captionsetup{labelformat=empty,textfont=blue,aboveskip=0pt,belowskip=0pt}

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
\setbeamercolor{block title alerted}{fg=OURed}
\setbeamercolor{alerted text}{fg=OURed}
\setbeamercolor{block title}{fg=OUMidBlue}
\setbeamercolor{description item}{fg=OUMidBlue}
\setbeamercolor{proof title}{fg=OUMidBlue}

\setbeamerfont{title}{series=\bfseries,size=\huge}
\setbeamerfont{subtitle}{series=\mdseries,size=\Large}
\setbeamerfont{author}{series=\bfseries,size=\normalsize}
\setbeamerfont{institute}{series=\mdseries,size=\normalsize}
\setbeamerfont{date}{series=\mdseries,size=\normalsize}
\setbeamerfont{frametitle}{series=\bfseries,size=\large}
\setbeamerfont{caption}{size=\normalsize}
\setbeamerfont{block title}{size=\large}
\setbeamerfont{proof title}{size=\normalsize,shape=\itshape}
\setbeamerfont{section in toc}{size=\large}
\setbeamerfont{subsection in toc}{size=\normalsize}
\setbeamerfont{subsubsection in toc}{size=\normalsize}

\setbeamertemplate{sections/subsections in toc}[sections numbered]
\setbeamertemplate{itemize items}[default]
\setbeamertemplate{itemize subitem}[circle]
\setbeamertemplate{itemize subsubitem}{-}
\setbeamertemplate{enumerate item}[default]
\setbeamertemplate{enumerate subitem}{\alph{enumii})}
\setbeamertemplate{footline}[frame number]
\setbeamertemplate{itemize/enumerate body begin}{\normalsize}
\setbeamertemplate{itemize/enumerate subbody begin}{\normalsize}
\setbeamertemplate{itemize/enumerate subsubbody begin}{\normalsize}

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
  % upper RH corner text
\end{minipage}
\begin{minipage}[c][.52\titleboxheight][c]{\paperwidth - 2\hmargin}\raggedright
  \usebeamercolor[fg]{title}\usebeamerfont{title}\inserttitle\\[20pt]
  \usebeamercolor[fg]{title}\usebeamerfont{subtitle}\insertsubtitle
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][b]{\paperwidth - 2\hmargin}
  \usebeamercolor[fg]{author}%
  \usebeamerfont{author}\insertauthor\\
  \usebeamerfont{institute}\insertinstitute\\
  \usebeamerfont{date}\insertdate
\end{minipage}\end{columns}}

\setbeamertemplate{end page}{\adjusttitlepadding\nointerlineskip%
\begin{columns}
\column{\dimexpr\paperwidth - 2\hmargin\relax}
\begin{minipage}[c][.24\titleboxheight][t]{\paperwidth - 2\hmargin}\raggedright
  \usebeamercolor[fg]{titlegraphic}\inserttitlegraphic%
\end{minipage}
\begin{minipage}[c][.52\titleboxheight][c]{\paperwidth - 2\hmargin}\raggedright
  \usebeamercolor[fg]{title}\usebeamerfont{title}Thank you%
\end{minipage}
\begin{minipage}[c][.24\titleboxheight][c]{\paperwidth - 2\hmargin}
\end{minipage}\end{columns}}

\setbeamertemplate{frametitle}{\nointerlineskip%
\begin{beamercolorbox}[wd=\paperwidth,ht=2em,dp=.5ex]{frametitle}
  \hspace{\hmargin}\insertframetitle\hspace{\hmargin}
\end{beamercolorbox}}


\setbeamersize{text margin left=\hmargin,text margin right=\hmargin}

\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}

\beamertemplatenavigationsymbolsempty

\setbeamertemplate{proof begin}{%
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

\tcbset{enhanced jigsaw,top=0pt,toptitle=1mm,bottomtitle=0pt,boxsep=1pt,
bottom=1mm,left=1mm,right=1mm,middle=2mm,boxrule=0.6pt,titlerule=0pt,
colframe=OUGrey,coltitle=OUMidBlue,colback=black!2!white,colbacktitle=black!2!white,
before title=\strut,after upper=\strut,after skip=12pt}
\newtcolorbox{framedbox}[1][]{#1}
\newtcolorbox{alertbox}[1][]{colframe=OUDarkRed,colback=OULightRed,colbacktitle=OULightRed,
coltitle=OUDarkRed,#1}
\newtcolorbox{examplebox}[1][]{colframe=OUDarkGreen,colback=OULightGreen,colbacktitle=OULightGreen,
coltitle=OUDarkGreen,#1}
