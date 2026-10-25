% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A new style for FAIR pre-prints
% Adapted for Palette: Violet Twilight, Maya Blue, Amber Flame, Dark Blue, Green
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Class declarations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fairsnow}
\LoadClassWithOptions{article}

% Layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[top=2.25cm, bottom=2.5cm, left=2.5cm, right=2.5cm, columnsep=0.65cm]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage[latin, english]{babel}
\RequirePackage{lipsum}
\RequirePackage{etoolbox}
\usepackage{fontawesome5}

\DisableLigatures[f]{family=sf*}

% Graphics %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{graphicx}

% Tables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\newcommand{\nm}[1]{#1}

% Colorful stuff %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}

% DEFAULT_PLOT_PALETTE Mapping
\definecolor{plotviolet}{HTML}{6442d3} % Violet Twilight
\definecolor{plotmaya}{HTML}{77bdff}   % Maya Blue
\definecolor{plotamber}{HTML}{f9b40d}  % Amber Flame
\definecolor{plotblue}{HTML}{0026FF}   % Dark Blue
\definecolor{plotgreen}{HTML}{7BC952}  % Green/Dusty Rose

% Primary Branding Colors
\definecolor{snowblue}{HTML}{0026FF}   % Using Dark Blue for links/branding
% \definecolor{snowfg}{HTML}{2A1B59}     % Darkened Violet for abstract text (readability)
\definecolor{snowfg}{HTML}{1C2B33} % original snow color for text abstract}
% \definecolor{snowbg}{HTML}{6442d3}     % Violet Twilight for the box frame
\definecolor{snowbg}{HTML}{63DF4E}   % SNOW wasabi


% References %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=snowblue,
  citecolor=snowblue,
  urlcolor=snowblue
}

\RequirePackage[round,authoryear]{natbib}
\def\bibfont{\small}

% Section and caption format %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}
\titleformat*{\paragraph}{\sffamily\bfseries}
\titleformat*{\section}{\Large\sffamily\bfseries}
\titleformat*{\subsection}{\large\sffamily\bfseries}
\titleformat*{\subsubsection}{\normalsize\sffamily\bfseries}
\DeclareTextFontCommand{\textbf}{\bfseries\sffamily}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\sffamily\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=false,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}

% Custom fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand*\ttdefault{cmvtt}
\RequirePackage[T1]{fontenc}

% Authors, affiliations, infos %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter

\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand\authorlist{}
\newcommand\authorformat[2][]{{\sffamily \bfseries #2$^{#1}$}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{, }}

\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{{\normalsize $^{#1}$#2}}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{, }}

\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{{\small $^{#1}$#2}}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

\newcommand\snowdatalist{}
\newcommand\snowdataformat[2][]{{\small {\sffamily \bfseries #1:} #2}}
\newcommand\snowdata[2][]{\addtolist[#1]{#2}{\snowdatalist}{\snowdataformat}{\par}}

\renewcommand{\abstract}[1]{\def\abstractlist{{\color{snowfg} #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}

\renewcommand\date[1]{\snowdata[Date]{#1}}
\newcommand\correspondence[1]{\snowdata[Correspondence]{#1}}

\newcommand\github[1]{\snowdata[{\color{black}\faGithub}\ ]{#1}}
\newcommand\youtube[1]{\snowdata[{\color{plotamber}\faYoutube}\ ]{#1}} % Changed to Amber
\newcommand\huggingface[1]{\snowdata[\raisebox{-0.15em}{\includegraphics[height=1em]{assets/huggingface_logo-noborder.png}}\ ]{#1}}

\newcommand\morelinks[1]{\snowdata[More links]{#1}}

\renewcommand{\title}[1]{\newcommand{\titlelist}{{\huge\sffamily\bfseries #1}}}

\newcommand{\beginappendix}{\appendix{\huge\sffamily Appendix\par}}

% Titlebox %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\mymaketitle}{%
  \begin{tcolorbox}[
    enhanced,
    arc=10pt,
    left=0.46cm, right=0.46cm, top=0.3cm, bottom=0.3cm,
    colback=black!2,
    colframe=snowbg,
    boxrule=2pt,
    before skip=0pt,
    grow to left by=1.5pt,
    grow to right by=1.5pt,
    overlay={
      \node[
        anchor=south east,
        at=(frame.south east),
        xshift=-0.5cm,
        yshift=0.5cm
      ]{
        \begin{tabular}{@{}c@{}}
          \includegraphics[width=4.5cm]{assets/ServiceNow_logo.png}\\[-5pt]
          % \includegraphics[width=4.5cm]{assets/ServiceNow_logo.png}\\[5pt]
          % \includegraphics[width=2.7cm]{Arxiv/assets/mila.pdf}\\[-12pt]
        \end{tabular}
      };
    }
  ]
    \setlength{\parindent}{0cm}
    \setlength{\parskip}{0.5cm}

    {
      \setlength{\parskip}{0cm}
      \raggedright
      \nohyphens

      {
        \setstretch{1.618}
        \titlelist\par
      }
      \vskip 0.2cm

      \authorlist\par
      \vskip 0.2cm

      \affiliationlist\par
      \contributionlist\par
    }

    \abstractlist\par

    \vskip 0.5cm

    {
      \setlength{\parskip}{0cm}
      \ifdefempty{\snowdatalist}{\vspace*{0.65cm}}{\snowdatalist\par}
    }
  \end{tcolorbox}

  \FloatBarrier
}

\renewcommand{\maketitle}{%
  \if@twocolumn
    \twocolumn[%
      \mymaketitle
      \vskip 0.38cm
    ]%
  \else
    \mymaketitle
  \fi
}


\makeatother