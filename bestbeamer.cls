\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bestbeamer}[2026/06/12 v1.0 Beamer class for the TFG defence]

\PassOptionsToClass{aspectratio=169,10pt,t}{beamer}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[catalan]{babel}
\RequirePackage{newpxtext}
\RequirePackage[noamssymbols]{newpxmath}
\RequirePackage[type1]{cinzel}
\RequirePackage[protrusion=true,expansion=true]{microtype}
\RequirePackage{mathtools}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{colortbl}
\RequirePackage{tabularx}
\RequirePackage{ragged2e}
\RequirePackage[
  inkscapeexe=/opt/homebrew/bin/inkscape,
  inkscapeversion=1
]{svg}
\RequirePackage{xparse}
\RequirePackage{xurl}
\RequirePackage{csquotes}
\DeclareQuoteStyle{catalan}
  {\guillemotleft}{\guillemotright}
  {\textquotedblleft}{\textquotedblright}
\RequirePackage[most]{tcolorbox}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{appendixnumberbeamer}
\RequirePackage[
  backend=biber,
  style=authoryear,
  sorting=nyt,
  dashed=false
]{biblatex}
\RequirePackage[
  type=CC,
  modifier=by-nc-nd,
  version=4.0,
  imagemodifier=-88x31,
  imageposition=left,
  imagewidth=7.5mm,
  imagedistance=1.8mm,
  hyperxmp=false
]{doclicense}

\newcommand{\familynameformat}[1]{\textsc{#1}}

\pgfplotsset{compat=1.18}
\usetikzlibrary{
  arrows.meta,
  backgrounds,
  calc,
  fit,
  positioning,
  shapes.geometric
}

% Legacy neutral accents kept for compatibility with earlier drafts.
\definecolor{bestArsenic}{RGB}{102,102,102}
\definecolor{bestLightSilver}{RGB}{247,247,247}
\definecolor{bestSilver}{RGB}{236,236,236}
\definecolor{bestDarkSilver}{RGB}{220,220,220}
\definecolor{bestUltraLight}{RGB}{250,250,250}
\definecolor{bestPink}{RGB}{252,92,125}
\definecolor{bestBlue}{RGB}{106,130,251}
\definecolor{bestLink}{HTML}{476C85}
\definecolor{bestInk}{RGB}{45,45,48}
\definecolor{bestGraphite}{RGB}{76,76,80}
\definecolor{bestMist}{RGB}{242,242,242}

% Air Force blue scale for navigation chrome and presentation accents.
\definecolor{bestAirforce700}{HTML}{334B5C}
\definecolor{bestAirforce600}{HTML}{476C85}
\definecolor{bestAirforce500}{HTML}{5D8AA8}
\definecolor{bestAirforce450}{HTML}{6D96B0}
\definecolor{bestAirforce400}{HTML}{88A9BF}
\definecolor{bestAirforce300}{HTML}{A2BCCD}
\definecolor{bestAirforce250}{HTML}{B1C4D2}
\definecolor{bestAirforce200}{HTML}{BDCFDB}
\definecolor{bestAirforce150}{HTML}{CBD8E2}
\definecolor{bestAirforce100}{HTML}{D8E2E9}

\colorlet{bestBoxStrongFrame}{bestAirforce600}
\colorlet{bestBoxStrongTitle}{bestAirforce300}
\colorlet{bestBoxStrongBack}{bestAirforce100!42!white}
\colorlet{bestBoxSoftFrame}{bestAirforce300}
\colorlet{bestBoxSoftTitle}{bestAirforce150}
\colorlet{bestBoxSoftBack}{bestAirforce100!48!white}
\colorlet{bestBoxPlainFrame}{bestAirforce300}
\colorlet{bestBoxPlainTitle}{white}
\colorlet{bestBoxPlainBack}{white}
\colorlet{bestDiagramInk}{bestAirforce700}
\colorlet{bestDiagramMuted}{bestAirforce500}
\colorlet{bestDiagramLight}{bestAirforce100}
\colorlet{bestDiagramMid}{bestAirforce300}
\colorlet{bestDiagramAccentA}{bestAirforce600}
\colorlet{bestDiagramAccentB}{bestAirforce400}

\arrayrulecolor{bestAirforce400}

\newcommand{\bestbibauthor}[1]{\textcolor{bestLink}{#1}}
\newrobustcmd*{\bestciteparens}[1]{\textcolor{bestLink}{\mkbibparens{#1}}}
\renewcommand*{\nameyeardelim}{\addcomma\space}
\DeclareCiteCommand{\cite}[\bestciteparens]
  {\usebibmacro{prenote}}
  {\usebibmacro{citeindex}\usebibmacro{cite}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\DeclareFieldFormat{labelalpha}{\textcolor{bestLink}{#1}}
\DeclareFieldFormat{labelalphawidth}{\textcolor{bestLink}{\mkbibbrackets{#1}}}
\DeclareFieldFormat{url}{\mkbibacro{URL}\addcolon\space{\color{bestLink}\url{#1}}}
\DeclareFieldFormat{doi}{\mkbibacro{DOI}\addcolon\space
  \href{https://doi.org/#1}{\textcolor{bestLink}{\nolinkurl{#1}}}}
\AtBeginBibliography{%
  \color{bestInk}%
  \renewcommand*{\mkbibnamegiven}[1]{\bestbibauthor{#1}}
  \renewcommand*{\mkbibnamefamily}[1]{\bestbibauthor{\familynameformat{#1}}}%
  \renewcommand*{\mkbibnameprefix}[1]{\bestbibauthor{#1}}%
  \renewcommand*{\mkbibnamesuffix}[1]{\bestbibauthor{#1}}%
}
\setbeamercolor{bibliography item}{fg=bestLink}
\setbeamercolor{bibliography entry author}{fg=bestInk}
\setbeamercolor{bibliography entry title}{fg=bestInk}
\setbeamercolor{bibliography entry location}{fg=bestInk}
\setbeamercolor{bibliography entry note}{fg=bestInk}
\setbeamertemplate{bibliography item}{}

\newlength{\bestbodymargin}
\newlength{\bestheadmargin}
\newlength{\bestfootmargin}
\newlength{\bestframebarheight}
\newlength{\bestboxtitleleft}
\newlength{\bestboxparpreskip}
\newlength{\bestboxchainpreskip}
\newlength{\bestboxafterskip}
\newlength{\besttakeawaypreskip}
\newlength{\besttakeawayafterskip}
\newlength{\bestsourcepreskip}
\newlength{\bestsourceafterskip}
\newlength{\bestfigurepreskip}
\newlength{\bestfigureafterskip}
\setlength{\bestbodymargin}{9mm}
\setlength{\bestheadmargin}{3.5mm}
\setlength{\bestfootmargin}{4mm}
\setlength{\bestframebarheight}{7.2mm}
\setlength{\bestboxtitleleft}{4pt}
\setlength{\bestboxparpreskip}{8pt}
\setlength{\bestboxchainpreskip}{2pt}
\setlength{\bestboxafterskip}{3pt}
\setlength{\besttakeawaypreskip}{6pt}
\setlength{\besttakeawayafterskip}{6pt}
\setlength{\bestsourcepreskip}{3pt}
\setlength{\bestsourceafterskip}{0pt}
\setlength{\bestfigurepreskip}{0pt}
\setlength{\bestfigureafterskip}{0pt}
\newif\ifbestafterbox
\bestafterboxfalse

\mode<presentation>
\usetheme{Antibes}
\usefonttheme{professionalfonts}
\setbeamertemplate{navigation symbols}{}
\setbeamersize{text margin left=\bestbodymargin,text margin right=\bestbodymargin}
\setlength{\columnsep}{6mm}

\setbeamercolor{normal text}{fg=bestInk,bg=white}
\setbeamercolor{structure}{fg=bestAirforce600}
\setbeamercolor{alerted text}{fg=bestAirforce700}
\setbeamercolor{palette primary}{fg=white,bg=bestAirforce700}
\setbeamercolor{palette secondary}{fg=white,bg=bestAirforce600}
\setbeamercolor{palette tertiary}{fg=white,bg=bestAirforce500}
\setbeamercolor{palette quaternary}{fg=white,bg=bestAirforce700}
\setbeamercolor{titlelike}{fg=bestAirforce700,bg=bestAirforce100}
\setbeamercolor{title}{fg=bestInk,bg=white}
\setbeamercolor{subtitle}{fg=bestAirforce600,bg=white}
\setbeamercolor{author}{fg=bestInk,bg=white}
\setbeamercolor{date}{fg=bestInk,bg=white}
\setbeamercolor{title in head/foot}{fg=white,bg=bestAirforce700}
\setbeamercolor{section in head/foot}{fg=white,bg=bestAirforce600}
\setbeamercolor{subsection in head/foot}{fg=white,bg=bestAirforce500}
\setbeamercolor{upper separation line head}{bg=bestAirforce700}
\setbeamercolor{lower separation line head}{bg=bestAirforce300}
\setbeamercolor{frametitle}{fg=bestAirforce700,bg=bestAirforce100}
\setbeamercolor{framesubtitle}{fg=bestAirforce600,bg=white}
\setbeamercolor{footline}{fg=bestAirforce700,bg=bestAirforce100}
\setbeamercolor{navigation symbols}{fg=bestAirforce400,bg=bestAirforce100}
\setbeamercolor{navigation symbols dimmed}{fg=bestAirforce250,bg=bestAirforce100}
\setbeamercolor{best takeaway}{fg=bestAirforce700,bg=bestAirforce100}

\setbeamerfont{title}{family=\cinzel,series=\bfseries,size=\LARGE}
\setbeamerfont{subtitle}{shape=\itshape,size=\large}
\setbeamerfont{author}{series=\bfseries,size=\normalsize}
\setbeamerfont{institute}{size=\small}
\setbeamerfont{date}{shape=\itshape,size=\small}
\setbeamerfont{frametitle}{family=\cinzel,series=\bfseries,size=\large}
\setbeamerfont{framesubtitle}{shape=\itshape,size=\small}
\setbeamerfont{title in head/foot}{series=\bfseries,size=\scriptsize}
\setbeamerfont{section in head/foot}{series=\bfseries,size=\scriptsize}
\setbeamerfont{subsection in head/foot}{series=\bfseries,size=\scriptsize}
\setbeamerfont{footline}{size=\scriptsize}
\setbeamerfont{caption}{size=\scriptsize}
\setbeamerfont{caption name}{series=\bfseries}

\AtBeginDocument{%
  \setlength{\parskip}{1.2pt}%
  \setlength{\abovedisplayskip}{5pt}%
  \setlength{\belowdisplayskip}{5pt}%
  \setlength{\abovedisplayshortskip}{3pt}%
  \setlength{\belowdisplayshortskip}{3pt}%
  \everypar\expandafter{\the\everypar\global\bestafterboxfalse}%
}
\AtBeginEnvironment{itemize}{%
  \setlength{\itemsep}{2.4pt}%
  \setlength{\topsep}{2.5pt}%
}
\AtBeginEnvironment{enumerate}{%
  \setlength{\itemsep}{3pt}%
  \setlength{\topsep}{2.5pt}%
}
\AtBeginEnvironment{figure}{%
  \par\vspace{\bestfigurepreskip}%
  \centering
  \setlength{\abovecaptionskip}{2pt}%
  \setlength{\belowcaptionskip}{0pt}%
}
\AtEndEnvironment{figure}{%
  \par\vspace{\bestfigureafterskip}%
}

\setbeamertemplate{itemize item}{\color{bestAirforce600}\raisebox{.12ex}{\scriptsize$\bullet$}}
\setbeamertemplate{itemize subitem}{\color{bestAirforce600}\raisebox{.1ex}{\tiny$\bullet$}}
\setbeamertemplate{enumerate item}{\color{bestAirforce600}\itshape\insertenumlabel.}
\setbeamertemplate{caption label separator}{\enspace}
\setbeamertemplate{caption}[numbered]

\newcommand{\bestgradientrule}[1][\textwidth]{%
  \begin{tikzpicture}[baseline]
    \fill[bestAirforce300] (0,0) rectangle (#1,0.035cm);
  \end{tikzpicture}%
}

\newcommand{\bestfullwidthbox}[3]{%
  \makebox[0pt][l]{%
    \begin{beamercolorbox}[wd=\paperwidth,#1]{#2}%
      #3%
    \end{beamercolorbox}%
  }%
}

\makeatletter
\setbeamertemplate{section in head/foot}[default]
\setbeamertemplate{subsection in head/foot}[default]

\setbeamertemplate{headline}{%
  \begin{beamercolorbox}[wd=\paperwidth,colsep=.45pt]{upper separation line head}
  \end{beamercolorbox}
  {\usebeamerfont{title in head/foot}%
  \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,
    leftskip=\bestheadmargin,rightskip=\bestheadmargin]{title in head/foot}
    \insertshorttitle
  \end{beamercolorbox}}
  {\usebeamerfont{section in head/foot}%
  \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,
    leftskip=\bestheadmargin,rightskip=\bestheadmargin]{section in head/foot}
    \ifbeamer@tree@showhooks
      \setbox\beamer@tempbox=\hbox{\usebeamertemplate{section in head/foot}}%
      \ifdim\wd\beamer@tempbox>1pt%
        \hskip2pt\raise1.9pt\hbox{\vrule width0.4pt height1.875ex\vrule width 5pt height0.4pt}%
        \hskip1pt%
      \fi%
    \else%
      \hskip6pt%
    \fi%
    \usebeamertemplate{section in head/foot}
  \end{beamercolorbox}}
  {\usebeamerfont{subsection in head/foot}%
  \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,
    leftskip=\bestheadmargin,rightskip=\bestheadmargin]{subsection in head/foot}
    \ifbeamer@tree@showhooks
      \setbox\beamer@tempbox=\hbox{\usebeamertemplate{subsection in head/foot}}%
      \ifdim\wd\beamer@tempbox>1pt%
        \hskip9.4pt\raise1.9pt\hbox{\vrule width0.4pt height1.875ex\vrule width 5pt height0.4pt}%
        \hskip1pt%
      \fi%
    \else%
      \hskip12pt%
    \fi%
    \usebeamertemplate{subsection in head/foot}
  \end{beamercolorbox}}
  \begin{beamercolorbox}[wd=\paperwidth,colsep=.45pt]{lower separation line head}
  \end{beamercolorbox}
}
\makeatother

\newcommand{\bestframetitletext}{%
  \hbox{\usebeamerfont{frametitle}\insertframetitle}%
  \ifx\insertframesubtitle\@empty
  \else
    \hfill
    {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}%
    \insertframesubtitle}%
    \hspace*{\bestheadmargin}%
  \fi
}

\setbeamertemplate{frametitle}{%
  \hbox{\bestfullwidthbox{ht=\bestframebarheight,dp=0mm}{frametitle}{%
    \vbox to \bestframebarheight{%
      \vfil
      \makebox[\paperwidth][l]{%
        \hspace*{\bestheadmargin}%
        \bestframetitletext
      }%
      \vfil
    }%
  }}%
}

\newcommand{\bestfootnavsymbols}{%
  {\usebeamercolor[fg]{navigation symbols}%
    \insertslidenavigationsymbol%
    \hspace{1.3mm}%
    \insertframenavigationsymbol%
    \hspace{1.3mm}%
    \insertsubsectionnavigationsymbol%
    \hspace{1.3mm}%
    \insertsectionnavigationsymbol%
    \hspace{1.3mm}%
    \insertdocnavigationsymbol%
    \hspace{1.3mm}%
    \insertbackfindforwardnavigationsymbol}%
}

\setbeamertemplate{footline}{%
  \hbox{\bestfullwidthbox{ht=3.1mm,dp=1.7mm}{footline}{%
    \makebox[\paperwidth][l]{%
      \hspace*{\bestfootmargin}%
      \usebeamerfont{footline}\insertsectionhead
      \hfill
      \raisebox{-0.4mm}{\bestfootnavsymbols}%
      \hspace{5mm}%
      \insertframenumber\,/\,\inserttotalframenumber
      \hspace*{\bestfootmargin}%
    }%
  }}%
}

\newcommand{\bestbackgroundfile}{guilloche.pdf}
\newcommand{\besttitlelogofile}{matematiquesinformatica-pos-rgb.png}
\newcommand{\bestrepositoryurl}{https://github.com/mariovilar/TFG}
\newcommand{\bestrepositorylabel}{github.com/mariovilar/TFG}
\newcommand{\bestsetbackground}[1]{\renewcommand{\bestbackgroundfile}{#1}}
\newcommand{\bestsettitlelogo}[1]{\renewcommand{\besttitlelogofile}{#1}}
\newcommand{\bestrepository}[2][github.com/mariovilar/TFG]{%
  \renewcommand{\bestrepositorylabel}{#1}%
  \renewcommand{\bestrepositoryurl}{#2}%
}
\newcommand{\bestbackgroundoverlay}[1][0.10]{%
  \begin{tikzpicture}[remember picture,overlay]
    \IfFileExists{\bestbackgroundfile}{%
      \node[inner sep=0pt,opacity=#1] at (current page.center)
        {\includegraphics[width=\paperwidth]{\bestbackgroundfile}};
    }{}
    \fill[white,opacity=.76] (current page.south west)
      rectangle (current page.north east);
  \end{tikzpicture}%
}
\newcommand{\besttitlebackgroundoverlay}{%
  \begin{tikzpicture}[remember picture,overlay]
    \IfFileExists{\bestbackgroundfile}{%
      \node[inner sep=0pt,opacity=.42] at (current page.center)
        {\includegraphics[width=\paperwidth]{\bestbackgroundfile}};
    }{}
    \fill[white,opacity=.52] (current page.south west)
      rectangle (current page.north east);
    \IfFileExists{\besttitlelogofile}{%
      \node[anchor=south east,inner sep=0pt,opacity=.92]
        at ($(current page.south east)+(-7mm,7mm)$)
        {\includegraphics[width=40mm]{\besttitlelogofile}};
    }{}
  \end{tikzpicture}%
}
\newcommand{\besttitlemetadata}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node[anchor=south west,inner sep=0pt,align=left,text width=.50\paperwidth]
      at ($(current page.south west)+(7mm,6.2mm)$) {%
        {\scriptsize\color{bestAirforce600}%
          \href{\bestrepositoryurl}{\texttt{\bestrepositorylabel}}\par}%
        \vspace{.7mm}%
        {\tiny\color{bestAirforce700}%
          \begingroup
          \setlength{\parskip}{0pt}%
          \setlength{\baselineskip}{8pt}%
          \doclicenseThis
          \endgroup}%
      };
  \end{tikzpicture}%
}

\makeatletter
\newcommand{\bestfirstadvisor}{}
\newcommand{\bestsecondadvisor}{}
\newcommand{\advisors}[2]{%
  \renewcommand{\bestfirstadvisor}{#1}%
  \renewcommand{\bestsecondadvisor}{#2}%
}

\setbeamertemplate{title page}{%
  \besttitlebackgroundoverlay\par
  \besttitlemetadata\par
  \vspace*{12mm}
  \begin{minipage}{.86\textwidth}
    {\usebeamerfont{title}\color{bestInk}\inserttitle\par}
    \vspace{1.5mm}
    \bestgradientrule[\textwidth]\par
  \end{minipage}\par
  \vspace{8mm}
  \begin{minipage}{.86\textwidth}
    {\usebeamerfont{author}\insertauthor\par}
    \vspace{2mm}
    {\small
      Tutors: \bestfirstadvisor\ i \bestsecondadvisor\par
      \insertinstitute\par
    }
    \vspace{2mm}
    {\usebeamerfont{date}\insertdate\par}
  \end{minipage}
  \vspace{4mm}
}
\makeatother

% Theorem-like environments adapted to the slide format.
\providecommand{\thrmname}{Teorema}
\providecommand{\propname}{Proposició}
\providecommand{\axiomname}{Axioma}
\providecommand{\lemname}{Lema}
\providecommand{\corname}{Corol·lari}
\providecommand{\propertyname}{Propietat}
\providecommand{\conjname}{Conjectura}
\providecommand{\processname}{Procés}
\providecommand{\probname}{Problema}
\providecommand{\algname}{Algorisme}
\providecommand{\defname}{Definició}
\providecommand{\notname}{Notació}
\providecommand{\remname}{Observació}
\providecommand{\exmpname}{Exemple}
\providecommand{\notename}{Nota}

\newcounter{besttheorem}[section]
\renewcommand{\thebesttheorem}{%
  \ifnum\value{section}>0
    \thesection.\arabic{besttheorem}%
  \else
    \arabic{besttheorem}%
  \fi
}

\newcommand{\besttheoremnote}[1]{%
  \if\relax\detokenize{#1}\relax
  \else
    \space(\textsc{#1})%
  \fi
}
\newcommand{\besttheoremtitle}[2]{%
  #1~\thebesttheorem\besttheoremnote{#2}.%
}
\newcommand{\bestboxbefore}{%
  \par
  \ifbestafterbox
    \vspace{\bestboxchainpreskip}%
  \else
    \vspace{\bestboxparpreskip}%
  \fi
  \global\bestafterboxfalse
}
\newcommand{\bestboxafter}{%
  \par\vspace{\bestboxafterskip}%
  \global\bestafterboxtrue
}
\newcommand{\besttakeawaybefore}{%
  \par\vspace{\besttakeawaypreskip}%
  \global\bestafterboxfalse
}
\newcommand{\besttakeawayafter}{%
  \par\vspace{\besttakeawayafterskip}%
  \global\bestafterboxtrue
}
\newcommand{\bestboxdisplayspacing}{%
  \setlength{\abovedisplayskip}{2pt plus .5pt minus .5pt}%
  \setlength{\belowdisplayskip}{2pt plus .5pt minus .5pt}%
  \setlength{\abovedisplayshortskip}{1pt plus .5pt minus .5pt}%
  \setlength{\belowdisplayshortskip}{2pt plus .5pt minus .5pt}%
  \setlength{\jot}{2pt}%
}
\newcommand{\bestboxinnertop}{2.5pt}
\newcommand{\bestboxinnerbottom}{2.5pt}
\newcommand{\bestbeginbox}[6]{%
  \refstepcounter{besttheorem}%
  \begin{tcolorbox}[
    enhanced,
    sharp corners,
    boxrule=0pt,
    leftrule=2.2pt,
    colframe=#2,
    colback=#3,
    colbacktitle=#4,
    coltitle=bestAirforce700,
    fonttitle=\bfseries,
    fontupper=#5,
    before upper={\bestboxdisplayspacing},
    halign=flush left,
    lefttitle=\bestboxtitleleft,
    title={\besttheoremtitle{#1}{#6}},
    left=4pt,
    right=4pt,
    top=\bestboxinnertop,
    bottom=\bestboxinnerbottom,
    before=\bestboxbefore,
    after=\bestboxafter
  ]%
}
\newcommand{\bestbegincontinuedbox}[6]{%
  \begin{tcolorbox}[
    enhanced,
    sharp corners,
    boxrule=0pt,
    leftrule=2.2pt,
    colframe=#2,
    colback=#3,
    colbacktitle=#4,
    coltitle=bestAirforce700,
    fonttitle=\bfseries,
    fontupper=#5,
    before upper={\bestboxdisplayspacing},
    halign=flush left,
    lefttitle=\bestboxtitleleft,
    title={#1~\thebesttheorem\besttheoremnote{#6}.},
    left=4pt,
    right=4pt,
    top=\bestboxinnertop,
    bottom=\bestboxinnerbottom,
    before=\bestboxbefore,
    after=\bestboxafter
  ]%
}
\newcommand{\bestendbox}{\end{tcolorbox}}

\DeclareDocumentEnvironment{theorem}{O{}}%
  {\bestbeginbox{\thrmname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{prop}{O{}}%
  {\bestbeginbox{\propname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{axiom}{O{}}%
  {\bestbeginbox{\axiomname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{proposition}{O{}}%
  {\begin{prop}[#1]}%
  {\end{prop}}
\DeclareDocumentEnvironment{lemma}{O{}}%
  {\bestbeginbox{\lemname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{corollary}{O{}}%
  {\bestbeginbox{\corname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{property}{O{}}%
  {\bestbeginbox{\propertyname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{conjecture}{O{}}%
  {\bestbeginbox{\conjname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{process}{O{}}%
  {\bestbeginbox{\processname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{problem}{O{}}%
  {\bestbeginbox{\probname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\itshape}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{algorisme}{O{}}%
  {\bestbeginbox{\algname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{algorithm}{O{}}%
  {\begin{algorisme}[#1]}%
  {\end{algorisme}}
\DeclareDocumentEnvironment{algorismecont}{O{continuació}}%
  {\bestbegincontinuedbox{\algname}{bestBoxStrongFrame}{bestBoxStrongBack}{bestBoxStrongTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{algorithmcont}{O{continuació}}%
  {\begin{algorismecont}[#1]}%
  {\end{algorismecont}}
\newcounter{bestpseudoline}
\NewDocumentEnvironment{bestpseudo}{O{\footnotesize} O{0}}%
  {%
    #1%
    \setcounter{bestpseudoline}{#2}%
    \begin{list}{}{%
      \setlength{\labelwidth}{1.4em}%
      \setlength{\labelsep}{.55em}%
      \setlength{\leftmargin}{1.95em}%
      \setlength{\rightmargin}{0pt}%
      \setlength{\itemindent}{0pt}%
      \setlength{\listparindent}{0pt}%
      \setlength{\itemsep}{.35pt}%
      \setlength{\parsep}{0pt}%
      \setlength{\topsep}{2pt}%
      \setlength{\partopsep}{0pt}%
    }%
  }%
  {\end{list}}
\NewDocumentCommand{\pseudoline}{O{0em} m}{%
  \refstepcounter{bestpseudoline}%
  \item[{\makebox[\labelwidth][r]{\color{bestAirforce700}\footnotesize\arabic{bestpseudoline}}}]%
  \hspace*{#1}#2%
}
\NewDocumentCommand{\pseudocomment}{O{0em} m}{%
  \item[]\hspace*{#1}{\color{bestAirforce700}\footnotesize\itshape #2}%
}
\DeclareDocumentEnvironment{definition}{O{}}%
  {\bestbeginbox{\defname}{bestBoxSoftFrame}{bestBoxSoftBack}{bestBoxSoftTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{notation}{O{}}%
  {\bestbeginbox{\notname}{bestBoxSoftFrame}{bestBoxSoftBack}{bestBoxSoftTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{remark}{O{}}%
  {\bestbeginbox{\remname}{bestBoxPlainFrame}{bestBoxPlainBack}{bestBoxPlainTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{exmp}{O{}}%
  {\bestbeginbox{\exmpname}{bestBoxPlainFrame}{bestBoxPlainBack}{bestBoxPlainTitle}{\normalfont}{#1}}%
  {\bestendbox}
\DeclareDocumentEnvironment{example}{O{}}%
  {\begin{exmp}[#1]}%
  {\end{exmp}}
\DeclareDocumentEnvironment{note}{O{}}%
  {\bestbeginbox{\notename}{bestBoxPlainFrame}{bestBoxPlainBack}{bestBoxPlainTitle}{\normalfont}{#1}}%
  {\bestendbox}

\DeclareDocumentEnvironment{mockdefinition}{O{}}%
  {\begin{tcolorbox}[enhanced,sharp corners,boxrule=0pt,leftrule=2.2pt,
    colframe=bestBoxSoftFrame,colback=bestBoxSoftBack,colbacktitle=bestBoxSoftTitle,
    coltitle=bestAirforce700,fonttitle=\bfseries,title={\defname\besttheoremnote{#1}.},
    halign=flush left,lefttitle=\bestboxtitleleft,
    left=9pt,right=9pt,top=\bestboxinnertop,bottom=\bestboxinnerbottom,before upper={\bestboxdisplayspacing},
    before=\bestboxbefore,after=\bestboxafter]}%
  {\end{tcolorbox}}
\DeclareDocumentEnvironment{mocktheorem}{O{}}%
  {\begin{tcolorbox}[enhanced,sharp corners,boxrule=0pt,leftrule=2.2pt,
    colframe=bestBoxStrongFrame,colback=bestBoxStrongBack,colbacktitle=bestBoxStrongTitle,
    coltitle=bestAirforce700,fonttitle=\bfseries,fontupper=\itshape,
    halign=flush left,lefttitle=\bestboxtitleleft,
    title={\thrmname\besttheoremnote{#1}.},
    left=9pt,right=9pt,top=\bestboxinnertop,bottom=\bestboxinnerbottom,before upper={\bestboxdisplayspacing},
    before=\bestboxbefore,after=\bestboxafter]}%
  {\end{tcolorbox}}
\DeclareDocumentEnvironment{mockremark}{O{}}%
  {\begin{tcolorbox}[enhanced,sharp corners,boxrule=0pt,leftrule=2.2pt,
    colframe=bestBoxPlainFrame,colback=bestBoxPlainBack,colbacktitle=bestBoxPlainTitle,
    coltitle=bestAirforce600,fonttitle=\bfseries,title={\remname\besttheoremnote{#1}.},
    halign=flush left,lefttitle=\bestboxtitleleft,
    left=9pt,right=9pt,top=\bestboxinnertop,bottom=\bestboxinnerbottom,before upper={\bestboxdisplayspacing},
    before=\bestboxbefore,after=\bestboxafter]}%
  {\end{tcolorbox}}

% Backwards-compatible names from the first Beamer draft.
\DeclareDocumentEnvironment{bestdefinition}{O{}}%
  {\begin{definition}[#1]}%
  {\end{definition}}
\DeclareDocumentEnvironment{bestresult}{O{}}%
  {\begin{prop}[#1]}%
  {\end{prop}}
\DeclareDocumentEnvironment{bestobservation}{O{}}%
  {\begin{remark}[#1]}%
  {\end{remark}}

\newcommand{\besttakeaway}[1]{%
  \begin{tcolorbox}[
    enhanced,
    sharp corners,
    boxrule=0pt,
    leftrule=1.4pt,
    colframe=bestAirforce500,
    colback=bestAirforce100!20!white,
    left=7pt,
    right=2pt,
    top=1.5pt,
    bottom=1.5pt,
    before=\besttakeawaybefore,
    after=\besttakeawayafter,
    fontupper=\itshape
  ]
    #1
  \end{tcolorbox}%
}

\newcommand{\bestsource}[1]{%
  \par\vspace{\bestsourcepreskip}\hfill
  {\scriptsize\color{bestAirforce600}\itshape Font: #1}%
  \par\vspace{\bestsourceafterskip}%
}

\newcommand{\bestlinkbutton}[2]{%
  \hyperlink{#1}{%
    \begin{tikzpicture}[baseline=(bestlinkbutton.base)]
      \node[
        draw=bestAirforce300,
        fill=bestAirforce100!30!white,
        text=bestAirforce700,
        rounded corners=1pt,
        inner xsep=5pt,
        inner ysep=2pt,
        font=\scriptsize\bfseries
      ] (bestlinkbutton) {#2\,{\footnotesize$\hookleftarrow$}};
    \end{tikzpicture}%
  }%
}

\newcommand{\bestsectionframe}[2]{%
  \begin{frame}[plain]
    \bestbackgroundoverlay[0.08]
    \vfill
    {\cinzel\bfseries\LARGE #1\par}
    \vspace{2mm}
    \bestgradientrule[.62\textwidth]\par
    \vspace{3mm}
    {\large\itshape\color{bestAirforce600}#2\par}
    \vfill
  \end{frame}
}

% Frequently used causal notation.
\newcommand{\talque}{\; \big| \;}

\DeclareMathOperator{\doop}{do}
\DeclareMathOperator{\Var}{Var}
\newcommand{\E}{\mathbb{E}}
\newcommand{\indep}{\perp\!\!\!\perp}
\newcommand{\nindep}{\not\!\indep}

\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\K}{\mathbb{K}}

\newcommand{\G}{\mathcal{G}}
\newcommand{\U}{\mathcal{U}}
\newcommand{\V}{\mathcal{V}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\EE}{\mathcal{E}}
\newcommand{\X}{\mathcal{X}}
\newcommand{\UU}{\mathbf{U}}
\newcommand{\VV}{\mathbf{V}}
\newcommand{\vvv}{\mathbf{v}}
\newcommand{\XX}{\mathbf{X}}
\newcommand{\xx}{\mathbf{x}}
\newcommand{\TT}{\mathbf{T}}
\newcommand{\ttt}{\mathbf{t}}
\newcommand{\Y}{\mathcal{Y}}
\newcommand{\YY}{\mathbf{Y}}
\newcommand{\yy}{\mathbf{y}}
\newcommand{\WW}{\mathbf{W}}
\newcommand{\ww}{\mathbf{w}}
\newcommand{\ZZ}{\mathbf{Z}}
\newcommand{\zz}{\mathbf{z}}
\newcommand{\M}{\mathcal{M}}
\endinput
