\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{tumphthesis}[2021/09/13 v0.1 The LaTeX template for master's thesis of Technical University of Munich]
\typeout{Document Class `tumphthesis' v0.2 by Dimitri Saridakis based on the work by Sirui Lu (2021/09)}

%%% class options %%%
\newif\ifqst@color\qst@colorfalse
\DeclareOption{color}{\qst@colortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

%%% custom for image stability
\usepackage[section]{placeins}

%% custom for image rotation
\usepackage[figuresleft]{rotating}
\usepackage{scrhack}

% custom setting for figure wrapping
\usepackage{wrapfig}
\usepackage{graphicx}


% set chapterprefix to true if you want "Chapter 1" displayed before the title of the chapter
\LoadClass[fontsize=11pt
	,a4paper,oneside
	,fontsize=11pt,footnotes=multiple,chapterprefix=false,appendixprefix=true,numbers=noenddot
	,footinclude=false,open=any
	]{scrbook}


%%% hyperref and url %%%
\RequirePackage[unicode]{hyperref}
\ifqst@color
	\hypersetup{colorlinks=true,citecolor=blue,linkcolor=black,urlcolor=blue}
\else
	\hypersetup{hidelinks}
\fi
\hypersetup{
	bookmarksnumbered,
	bookmarksopen,
	pdfdisplaydoctitle,
	pdfsubject=Lab 01,
	pdfcreator=Dimitri Saridakis,
}


\RequirePackage{etoolbox}
\AtBeginDocument{
	\hypersetup{
		pdftitle=\qst@thesistitle,
		pdfauthor=\qst@thesisauthor,
	}
}
\PassOptionsToPackage{hyphens}{url}
\def\UrlFont{\ttfamily}

%%% math symbols %%%
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage{braket}
\RequirePackage{lmodern}

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\tr}{tr}
\DeclareMathOperator*{\Tr}{Tr}

\newcommand{\rem}[1]{\textcolor{red}{\textbf{[#1]}}}
\newcommand{\note}[2]{{\bf[#1: #2]}}
\newcommand{\todo}[1]{{\color{red}TODO: #1}}
\newcommand{\change}[1]{{\color{blue}#1}}


%%% theorem %%%
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\newtheorem{definition}{Definition}[chapter]
\newtheorem{assumption}[definition]{Assumption}
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{corollary}[definition]{Corollary}
\newtheorem{example}[definition]{Example}
\newtheorem{conjecture}[definition]{Conjecture}

%% code formatting %%
\usepackage{xcolor}
\definecolor{light-gray}{gray}{0.95}
\newcommand{\code}[1]{\colorbox{light-gray}{\texttt{#1}}}

% large chunks of code using the \begin{lstlisting} tag
% https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings
\usepackage{listings}
\usepackage{color}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{frame=tb,
%   language=Java,
%   language=Shell,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=left,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}

%%% bibliographies %%%
% \usepackage[numbers]{natbib}
\RequirePackage[
backend=biber,
style=numeric
]{biblatex}
 \addbibresource{fyp.bib}
% \bibliographystyle{unsrtnat}
% \bibliographystyle{authoryear}

%%% header and footer %%%
\RequirePackage{scrlayer-scrpage}

%%% tables %%%
\RequirePackage{booktabs,multirow,longtable,diagbox}


%%% figures %%%
\RequirePackage{graphicx,float}


%%% code listing %%%
\RequirePackage{xcolor}

%%% title page %%%

\newcommand{\MakeFrontCover}{
	\begin{titlepage}
	\begin{center}	
		\begin{figure}[t]	
		\includegraphics[width=1\linewidth]{figures/wit-Logo_horizontal_English-700x194.jpg}
		\end{figure}
		\bigskip
		\noindent\rule{\textwidth}{1pt}
		\Huge\textbf{\qst@thesistitle}\\
		\noindent\rule{\textwidth}{1pt}\\
		\bigskip
		{\huge \textbf{\qst@thesisauthor}}\\
		\bigskip
		\Large{Work submitted\\ within the \qst@program}\\
		\bigskip
		{\Large Supervisor:  \qst@supervisor}\\
		% {\Large Second Reader:  \qst@examiner}\\%		
        % {\Large Lecturer:  \qst@lecturer}\\
		\vfill{\Large \today}
	\end{center}
	\end{titlepage}
	%\newpage
	%\thispagestyle{empty}	
	%\cleardoublepage
	%\thispagestyle{empty}
}

%%% copyrightpage %%%

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
		{\scshape \noindent \small \copyright \small 2021\hspace{3pt}-- \qst@thesisauthor }\\
		\noindent All rights reserved.
	\end{center}
	\vspace*{\fill}
	\newpage
}

%%% abstract page %%%

\newcommand{\abstractpage}{
	\pdfbookmark{Abstract}{Abstract}
	\newpage
	% \setcounter{page}{1}
	% \noindent\begin{minipage}[b]{.6\linewidth}%
		%\normalfont {\textit{Thesis advisor: \qst@supervisor}}
	% \end{minipage}
	% \begin{minipage}[b]{.3\linewidth}
	% 	\raggedleft \normalfont \textit{\qst@thesisauthor}
	% \end{minipage}%

	\vspace*{9pt}
	% \begin{center}
		% {\LARGE{\textbf{\qst@thesistitle}}}
	% \end{center}
	\bigskip
	\centerline{\Large {{\textbf{Abstract}}}}
	\bigskip
	\par
}


\newcommand{\acknowledgments}{
	\cleardoublepage
	\addcontentsline{toc}{chapter}{\protect Acknowledgements}
	\chapter*{Acknowledgements}
	\noindent
}

\newcommand{\videolink}{
	\cleardoublepage
	\addcontentsline{toc}{chapter}{\protect Link to Demo Video}
	\chapter*{Link to Demo Video}
	\noindent
}


% \newcommand{\lstlistoflistings}{
	% \cleardoublepage
	% \addcontentsline{toc}{chapter}{\protect Code Listings}

	% \addcontentsline{toc}{chapter}{\protect Code Listings}
	% \chapter*{Code Listings}
	% \noindent
% }

%%% custom information %%%
\renewcommand{\maketitle}{%
	\MakeFrontCover
	\frontmatter
}


\def\qst@university{Waterford Institute of Technology}
\newcommand{\university}[2]{%
	\def\qst@university{#1}

}

\def\qst@institute{Waterford Institute of Technology}
\newcommand{\institute}[2]{%
	\def\tum@institute{#1}
}

\def\qst@department{Department of Mathematics & Computing}
\newcommand{\department}[2]{%
	\def\qst@department{#1}
}

\def\qst@program{ \\ BSc in Applied Computing \\ Cloud \& Networks}
\newcommand{\program}[2]{%
	\def\qst@program{#1}
	
}

\def\qst@thesistitle{}
\newcommand{\thesistitle}[2]{%
	\def\qst@thesistitle{#1}
}

\def\qst@thesisauthor{}
\def\qst@thesisauthornative{}
\newcommand{\thesisauthor}[2]{%
	\def\qst@thesisauthor{#1}
	\def\qst@thesisauthornative{#2}
}
% \def\qst@thesissubtitle{}
% \def\qst@thesissubtitleDe{}
% \newcommand{\thesistitle}[4]{%
% 	\def\qst@thesistitle{#1}
% 	\def\qst@thesissubtitle{#2}
% 	\def\qst@thesistitleDe{#3}
% 	\def\qst@thesissubtitleDE{#4}
% }

\def\qst@thesistype{Lab 01}
\newcommand{\thesistype}[1]{%
	\def\qst@thesistype{#1}
}

\def\qst@supervisor{Dr Kieran Murphy}
\newcommand{\supervisor}[1]{%
	\def\qst@supervisor{#1}
}

\def\qst@examiner{Clodagh Power}
\newcommand{\examiner}[1]{%
	\def\qst@examiner{#1}
}

\def\qst@lecturer{Richard Frisby}
\newcommand{\lecturer}[1]{%
	\def\qst@lecturer{#1}
}


\def\qst@thesisyear{}
\def\qst@thesismonth{}
\def\qst@thesisday{}
\newcommand{\thesisdate}[3]{%
	\def\qst@thesisyear{#1}
	\def\qst@thesismonth{#2}
	\def\qst@thesisday{#3}
}


% for hyperlinks
\usepackage{cleveref}

% for smaller margins
\usepackage[margin=2cm, headheight=0pt,headsep=10pt]{geometry}
	% \addtolength{\oddsidemargin}{- .7in}
	% \addtolength{\evensidemargin}{- .7in}
	% \addtolength{\textwidth}{1.75in}

	% \addtolength{\topmargin}{-.5in}
	% \addtolength{\textheight}{1.6in}


% for yaml in lstlisting
\usepackage{xcolor}
\usepackage{listings}
\newcommand\YAMLcolonstyle{\color{red}\mdseries}
\newcommand\YAMLkeystyle{\color{black}\bfseries}
\newcommand\YAMLvaluestyle{\color{blue}\mdseries}
\makeatletter
% here is a macro expanding to the name of the language
% (handy if you decide to change it further down the road)
\newcommand\language@yaml{yaml}
\expandafter\expandafter\expandafter\lstdefinelanguage
\expandafter{\language@yaml}
{
  keywords={true,false,null,y,n},
  keywordstyle=\color{darkgray}\bfseries,
  basicstyle=\YAMLkeystyle,                                 % assuming a key comes first
  sensitive=false,
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\YAMLvaluestyle\ttfamily,
  moredelim=[l][\color{orange}]{\&},
  moredelim=[l][\color{magenta}]{*},
  moredelim=**[il][\YAMLcolonstyle{:}\YAMLvaluestyle]{:},   % switch to value style at :
  morestring=[b]',
  morestring=[b]",
  literate =    {---}{{\ProcessThreeDashes}}3
                {>}{{\textcolor{red}\textgreater}}1     
                {|}{{\textcolor{red}\textbar}}1 
                {\ -\ }{{\mdseries\ -\ }}3,
}
% switch to key style at EOL
\lst@AddToHook{EveryLine}{\ifx\lst@language\language@yaml\YAMLkeystyle\fi}
\makeatother
\newcommand\ProcessThreeDashes{\llap{\color{cyan}\mdseries-{-}-}}

% edit page number position up or down
\setlength{\footskip}{20pt}

% for subsubsection in toc
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% for strikeout text
\usepackage[normalem]{ulem}

% for quotes
\usepackage[font=itshape]{quoting}

\usepackage{tikz}
\usetikzlibrary{calc}
% for spy zoom in thing
\usetikzlibrary{spy}

% to use the f1 score function use: \FO\ score
\def\FO{\ensuremath{F_1}}

\usepackage{amsmath}
\usepackage{relsize}