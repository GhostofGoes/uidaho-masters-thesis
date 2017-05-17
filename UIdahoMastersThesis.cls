% --------------------------------------------------------------------------
% Author   Christopher Goes
% Email    goesc@acm.org    (Alternate: goes8945@alumni.uidaho.edu)
% --------------------------------------------------------------------------
% Developed from Kai's UIThesis class file.
% Don't recall last name, he graduated Spring 2017 in biology, will have to lookup later)
% --------------------------------------------------------------------------


% Sets up the class
\LoadClass[oneside]{book}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UIdahoMastersThesis}[2017/04/03 University of Idaho Masters Thesis]


% --------------------------------------------------------------------------
% Packages
\RequirePackage{color}
\RequirePackage[table]{xcolor}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{graphicx} % Allows placement of graphics
\RequirePackage{setspace} % Allows fcns like doublespace, singlespace, and singlehalfspacing of text
\RequirePackage{listings} % For code listings
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{adjustbox}
\RequirePackage{indentfirst}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{lipsum}
\RequirePackage{fmtcount}
\RequirePackage{gensymb}
\RequirePackage{url}


% Set margins
\geometry{letterpaper,
	left= 1.2in,
	right=1in,
	bottom=1in}

% Set pagenumber to top right
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}

\fancypagestyle{plain}{\fancyhf{}
\fancyfoot{}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{\thepage}}


\makeatletter  % DO NOT REMOVE THIS (unless you know what you are doing)


% --------------------------------------------------------------------------
% This fixes issues with table of contents for appendices (Source: https://tex.stackexchange.com/a/231875)
\g@addto@macro{\appendix}{%
  \renewcommand\chaptername{Appendix}%
  \addtocontents{toc}{\protect\renewcommand*{\protect\chaptername}{\protect\appendixname}}%
}


% --------------------------------------------------------------------------
% Configure Table of Contents (TOC)

% Change TOC name to Table of Contents
\renewcommand{\contentsname}{Table of Contents}

% Define command to match the default dot fill for the book class in the TOC
\newcommand \Dotfill {\leavevmode \cleaders \hb@xt@ 0.9em{\hss .\hss }\hfill \kern \z@}


% --------------------------------------------------------------------------
% Configure sections

% Change the chapter and section display format in the TOC
\titlecontents{chapter}% <section-type>
[0pt]% <left>
{}% <above-code>
{\scshape\chaptername\ \thecontentslabel:\ }% <numbered-entry-format>
{}% <numberless-entry-format>
{\Dotfill\contentspage}% <filler-page-format>

\titlecontents{section}% <section-type>
[10pt]% <left>
{\scshape}% <above-code>
{}% <numbered-entry-format>
{\contentslabel}% <numberless-entry-format>
{\Dotfill\contentspage}% <filler-page-format>

\titlecontents{subsection}%
[20pt]%
{\scshape}%
{}%
{\contentslabel}%
{\Dotfill\contentspage}%

% Rename list of listings to list of code listings, per handbook requirements
\renewcommand{\lstlistlistingname}{List of Code Listings}


% --------------------------------------------------------------------------
% Define an environment that vertically centers
\newenvironment{vplace}[1][1]{%
	\par
	\vspace*{\stretch{#1}}
	}{%
	\par
	\vspace{\stretch{1}}%
	}


% --------------------------------------------------------------------------
% Command Definitions
\newcommand{\thesisdegree}[1]{
	\def\@degree{#1}}

\newcommand{\advisor}[1]{
	\def\@advisor{#1}}

\newcommand{\major}[1]{
	\def\@major{#1}}

\newcommand{\cmone}[1]{
	\def\@cmone{#1}}

\newcommand{\cmtwo}[1]{
	\def\@cmtwo{#1}}

\newcommand{\deptadmin}[1]{
	\def\@deptadmin{#1}}

\newcommand{\graddate}[1]{
	\def\@graddate{#1}}

\newcommand*{\SignatureAndDate}[1]{%
	\noindent\hspace{1in}\makebox[2.5in]{\hrulefill} \hfill\makebox[1.5in]{\hrulefill}\\%
	\noindent\hspace{1in}\makebox[2.5in][l]{#1}      \hfill\makebox[1.5in][l]{Date}%
}%

\newcommand\frontmattersection[1]{%
	\addcontentsline{toc}{chapter}{\scshape#1}%
	\chaptermark{#1}}


% --------------------------------------------------------------------------
% Title Page
\newcommand{\thesistitlepage}{\thispagestyle{empty}
	\vspace*{0.5in}
		\begin{center}
			\textsc{\@title}\\
			\vspace{48pt}
			A Thesis\\
			Presented in Partial Fulfillment of the Requirements for the\\
			Degree of \@degree\\
			with a\\
			Major in \@major\\
			in the\\
			College of Graduate Studies\\
			University of Idaho\\
			by\\
			\@author\\
			\vspace{60pt}
			Major Professor: \@advisor\\
			Committee Members: \@cmone; \@cmtwo\\
			Department Administrator: \@deptadmin\\
			\vspace{80pt}
			\@graddate
		\end{center}

	\clearpage}


% --------------------------------------------------------------------------
% Authorization Page
\newcommand{\authorizationpage}{\begin{center}
		{\LARGE\textsc{Authorization to Submit Thesis}}
	\end{center}
	\vspace{10pt}
	
This thesis of \@author, submitted for the degree of \@degree\ with a Major in \@major\ and titled ``\@title," has been reviewed in final form. Permission, as indicated by the signatures and dates below is now granted to submit final copies for the College of Graduate Studies for approval.\par
    
	\vspace{1in}
	\begin{table}[ht]
		\centering
		\begin{tabular}{p{1.5in}ll}
			Advisor:                  & \makebox[2.5in]{\hrulefill}   & \makebox[1.5in]{\hrulefill}\\
							          & \@advisor					  & Date\\[0.5in]
			Committee Members:        & \makebox[2.5in]{\hrulefill}   & \makebox[1.5in]{\hrulefill}\\
		                              & \@cmone						  & Date\\[0.5in]
		                              & \makebox[2.5in]{\hrulefill}   & \makebox[1.5in]{\hrulefill}\\
		                              & \@cmtwo						  & Date\\[0.5in]
		    Department Chair:         & \makebox[2.5in]{\hrulefill}   & \makebox[1.5in]{\hrulefill}\\
		                              & \@deptadmin                   & Date\\
		\end{tabular}
	\end{table}}


% --------------------------------------------------------------------------
\newcommand{\I}{$^{129}$I}
\newcommand{\kr}{$^{85}$Kr}

\newcommand\immediateaddcontentsline[3]{%
	\begingroup
	\let\origwrite\write
	\def\write{\immediate\origwrite}%
	\addcontentsline{#1}{#2}{#3}%
	\endgroup
}


% --------------------------------------------------------------------------
% More custom commands to add niceties

\newcommand{\etal}{\textit{et al}.\ }
\newcommand{\ie}{\textit{i}.\textit{e}.\ }
\newcommand{\eg}{\textit{e}.\textit{g}.\ }

\newcommand{\node}[1]{\texttt{#1}}
\newcommand{\tbf}[1]{\textbf{#1}}

% Easy equations
\newcommand{\eq}[1]{\begin{align*}#1\end{align*}} % Usage: \eq{ <equation> }


% --------------------------------------------------------------------------
% YAML syntax highlighting for Listings
% See: http://tex.stackexchange.com/a/145583
% Another possibility: http://tex.stackexchange.com/a/152856
% Example usage: \lstinputlisting[firstline=56, firstnumber=1, language=yaml,caption=Exercise Specification]{Specifications/exercise-specification.yaml}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

\newcommand\YAMLkeystyle{\color{black}\bfseries}
\newcommand\YAMLvaluestyle{\color{blue}\mdseries}

\lstdefinelanguage{yaml}
{
  keywords={true,false,null,y,n},
  sensitive=false,
  comment=[l]{\#},
  morecomment=[s]{/*}{*/},
  moredelim=[l][\color{orange}]{\&},
  moredelim=[l][\color{magenta}]{*},
  morestring=[b]',
  morestring=[b]"
}


% --------------------------------------------------------------------------
% Listing's style for highlighting code
\lstdefinestyle{code}{
	backgroundcolor=\color{backcolour},
	commentstyle=\color{codegreen},
	keywordstyle=\color{magenta},
	numberstyle=\tiny\color{codegray},
	stringstyle=\color{codepurple},
	basicstyle=\ttfamily\singlespacing,
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
	postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\color{red}\hookrightarrow\space}}
}


% --------------------------------------------------------------------------
%% Put your additional LaTeX customizations and definitions here %%
