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
\RequirePackage{etoolbox}
\RequirePackage[a4paper,margin={3cm,2cm}]{geometry}
\RequirePackage{comment}
\RequirePackage{enumitem}

\newcommand{\pointsname}{pts}
\newcommand{\pointname}{pt}
\newcommand{\pointsformat}[2]{[#1 #2]}

\newlength{\wlogo}
\setlength\wlogo{6cm}

\newcounter{npoints}
\newcounter{questionpts}
\newcounter{nptsdefault}
\newcounter{nptscomputed}
\newcounter{tpoints}
\newcommand{\totalpts}[1][]{%
\ifstrempty{#1}{\thetpoints}{\setcounter{tpoints}{#1}}}

\newcommand{\displaypoints}[1]{%
\ifnumequal{#1}{1}%
{\pointsformat{#1}{\pointname}}%
{\pointsformat{#1}{\pointsname}}}

\newcommand{\pointserror}{}
\newcommand{\addtopointserror}[3]{%
  \protected@edef\@tempa{\textbf{Q#1}: & #2\; & #3\; \noexpand\\}
  \expandafter\gappto\expandafter\pointserror\expandafter{\@tempa}}

\AtEndEnvironment{question}{%
    \ifnumgreater{\value{subpts}}{0}{% IF TRUE
        \ifnumequal{\value{subpts}}{\value{questionpts}}{}{% IF FALSE
            \ifdefempty{\pointserror}{% IF TRUE
                \gappto{\pointserror}{\vskip1.5ex\hrule\vskip1ex\begin{tabular}{rrr}
                    & \textbf{Expected Points} & \textbf{Actual Points} \\[.2ex]}
            }{}%
            \addtopointserror{\thequestion}{\thequestionpts}{\thesubpts}
        }%
    }{}%
}

\AtEndDocument{%
\ifdefempty{\pointserror}{}{% IF FALSE
    \gappto{\pointserror}{%
        \ifnumequal{\value{tpoints}}{\value{npoints}}{}{% IF FALSE
            \textbf{Total}: & \thetpoints\; & \thenpoints\; \\
        }
        \end{tabular}}
    \pointserror
}%
}

\newcommand{\subpart}[1][]{%
\setcounter{nptsdefault}{\value{questionpts}}%
\addtocounter{nptsdefault}{-\value{subpts}}%
\ifstrempty{#1}%
{\setcounter{nptscomputed}{\value{nptsdefault}}}{\setcounter{nptscomputed}{#1}}%
\addtocounter{subpts}{\value{nptscomputed}}%
\item\textbf{\displaypoints{\thenptscomputed}}\enspace}

\renewcommand{\maketitle}{{\setlength\parindent{0pt}\vspace*{-1.5cm}%
\begin{minipage}[t]{\wlogo}%
    \vspace{0pt}\includegraphics[width=\wlogo]{aselogo_en.pdf}\end{minipage}%
\begin{minipage}[t]{\dimexpr\textwidth - \wlogo\relax}%
    \vspace{0pt}\raggedleft\@date\end{minipage}\vskip.5cm
\centering\LARGE\@title\vskip.5ex}}

\newlist{subparts}{enumerate}{2}
\setlist[subparts,1]{label=\bfseries\alph*.,labelsep=.5em}
\setlist*[subparts,2]{label=\bfseries\roman*.,labelsep=.5em}

\newcommand{\nodescription}{\leavevmode\vspace{\dimexpr-\topsep-\itemsep\relax}}

\newtheoremstyle{question}% name
{2ex plus 1ex minus .5ex}%      Space above, empty = `usual value'
{2ex plus .5ex minus .5ex}%     Space below
{}% Body font
{}%         Indent amount (empty = no indent, \parindent = para indent)
{\bfseries}% Thm head font
{}%        Punctuation after thm head
{\newline}%     Space after thm head: " " = normal interword space;
      %       \newline = linebreak
{%
\ifstrempty{#3}{%
\setcounter{questionpts}{\value{tpoints}}%
\addtocounter{questionpts}{-\value{npoints}}%
}{\setcounter{questionpts}{#3}}%
\addtocounter{npoints}{\value{questionpts}}%
\thmname{#1}\thmnumber{ #2}.\enspace\displaypoints{\thequestionpts}}% Thm head spec

\theoremstyle{question}
\newtheorem{question}{Question}

\newcounter{subpts}[question]
\xpatchcmd{\proof}{\itshape}{\itshape\bfseries}{}{}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{Solution}
\specialcomment{soltn}{\proof}{\endproof}
\specialcomment{instructions}
{\hrule\begin{itemize}[label=\textbullet,noitemsep,leftmargin=\parindent,topsep=1.5ex]}
{\end{itemize}\hrule}
\ifEXM@solutions\excludecomment{instructions}\else\excludecomment{soltn}\fi
