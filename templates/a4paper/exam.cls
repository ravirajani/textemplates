\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exam}

\LoadClass[11pt]{article}
\RequirePackage{newtxtext} % Times font
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{newtxmath}
\RequirePackage[en-GB]{datetime2}
\RequirePackage[export]{adjustbox}
\RequirePackage[a4paper]{geometry}
\RequirePackage{enumitem}
\newcommand{\npts}[1]{\item\textbf{(#1 points)}\enspace}

\geometry{margin=1.5cm}

\renewcommand{\maketitle}{%
\vspace*{-1.5cm}%
\begin{center}
    \nointerlineskip%
    \includegraphics[width=6cm]{aselogo_en.pdf}\vskip.3cm%
    \hrule\vskip.5ex\@title\hfill\@date\vskip.5ex\hrule\par%
\end{center}}

\newlist{instructions}{itemize}{1}
\setlist[instructions,1]{label=\textbullet,noitemsep,leftmargin=\parindent}
\newlist{parts}{enumerate}{2}
\setlist[parts,1]{label=\bfseries\alph*.,labelsep=.5em}
\setlist*[parts,2]{label=\bfseries\roman*.,labelsep=.5em}

\newtheoremstyle{question}% name
{}%      Space above, empty = `usual value'
{20pt}%      Space below
{}% Body font
{}%         Indent amount (empty = no indent, \parindent = para indent)
{\bfseries}% Thm head font
{}%        Punctuation after thm head
{\newline}%     Space after thm head: " " = normal interword space;
      %       \newline = linebreak
{\thmname{#1}\thmnumber{ #2}.\thmnote{\enspace (#3 points)}}% Thm head spec

\theoremstyle{question}
\newtheorem{question}{Question}
