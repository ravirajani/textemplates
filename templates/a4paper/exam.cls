\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exam}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=EXM,
    prefix=EXM@
}
\DeclareBoolOption{solutions}
\ProcessKeyvalOptions*
\LoadClass[11pt]{article}
\RequirePackage{newtxtext} % Times font
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{newtxmath}
\RequirePackage{mleftright}
\RequirePackage[en-GB]{datetime2}
\RequirePackage[export]{adjustbox}
\RequirePackage[a4paper]{geometry}
\RequirePackage{comment}
\RequirePackage{enumitem}
\newcommand{\npts}[1]{\item\textbf{(#1 points)}\enspace}

\geometry{margin={3cm,2cm}}

\newlength{\wlogo}
\setlength\wlogo{6cm}

\renewcommand{\maketitle}{{\setlength\parindent{0pt}\vspace*{-1.5cm}%
\begin{minipage}[t]{\wlogo}%
    \vspace{0pt}\includegraphics[width=\wlogo]{aselogo_en.pdf}\end{minipage}%
\begin{minipage}[t]{\dimexpr\textwidth - \wlogo\relax}%
    \vspace{0pt}\raggedleft\@date\end{minipage}\vskip.5cm
\centering\LARGE\@title\vskip.2ex}}

\newlist{parts}{enumerate}{2}
\setlist[parts,1]{label=\bfseries\alph*.,labelsep=.5em}
\setlist*[parts,2]{label=\bfseries\roman*.,labelsep=.5em}

\newtheoremstyle{question}% name
{}%      Space above, empty = `usual value'
{}%      Space below
{}% Body font
{}%         Indent amount (empty = no indent, \parindent = para indent)
{\bfseries}% Thm head font
{}%        Punctuation after thm head
{\newline}%     Space after thm head: " " = normal interword space;
      %       \newline = linebreak
{\thmname{#1}\thmnumber{ #2}.\thmnote{\enspace (#3 points)}}% Thm head spec

\theoremstyle{question}
\newtheorem{question}{Question}

\xpatchcmd{\proof}{\itshape}{\itshape\bfseries}{}{}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{Solution}
\specialcomment{soltn}{\proof}{\endproof}
\specialcomment{instructions}
{\begin{itemize}[label=\textbullet,noitemsep,leftmargin=\parindent,topsep=1.5ex]\hrule}
{\end{itemize}\hrule}
\ifEXM@solutions\excludecomment{instructions}\else\excludecomment{soltn}\fi
