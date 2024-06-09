\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tablet}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=TBT,
    prefix=TBT@
}

\DeclareStringOption[article]{style}
\DeclareBoolOption{sansfont}

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

\geometry{
    papersize={15.4cm,20.5cm},
    total={13.4cm,19.9cm},
    marginratio={1:1,4:5},
    includeheadfoot,
    headsep=0.6cm,
    footskip=0.9cm
}
