%%%
%%% EU project deliverable latex document class
%%%
%%% Version 2.0 (2016-02-15)
%%%
%%% Based on the JAMES and PACO-PLUS deliverable latex document classes by Ron Petrick
%%% and the JAST deliverable latex document class by Mary Ellen Foster.
%%%
%%% Copyright 2016 Mary Ellen Foster and Ron Petrick
%%% http://maryellenfoster.uk/, http://petrick.uk/
%%% 
%%% This work is licensed under the Creative Commons 
%%% Attribution-ShareAlike 4.0 International License. 
%%% To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.
%%%
%%% Revision History
%%%
%%% 2016-02-16
%%%  - Cleaned up for external distribution
%%%
%%% 2012-01-23
%%%  - Major rewrite for JAMES.
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eu-deliverable}[2016/02/15 v2.0 EU Project deliverable documentclass]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,twoside,11pt]{article}

%%% Required packages
\RequirePackage{pslatex}
\RequirePackage{ifthen}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}%  Custom headers
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}%

\RequirePackage{ccicons}

%%% Custom page dimensions
\RequirePackage[a4paper,ignorehead,ignorefoot,top=2.75cm,bottom=2.0cm,left=2.0cm,right=2.0cm,headsep=0.75cm,headheight=2.5cm,footskip=0.5cm]{geometry}

%%% Dates (ISO format: yyyy-mm-dd)
\def\today{\number\year-\number\month-\number\day}

%%% Commands to define author, title, etc.
\newcommand{\project@acronym}{}
\newcommand{\project@grantno}{}
\newcommand{\project@startdate}{}
\newcommand{\project@duration}{}
\newcommand{\project@name}{}
\newcommand{\project@url}{}
\newcommand{\project@deliverable}{}
\newcommand{\project@leadbeneficiary}{}
\newcommand{\project@otherbeneficiaries}{}
\newcommand{\project@workpackage}{}
\newcommand{\project@version}{Draft}
\newcommand{\project@nature}{Report (R)}
\newcommand{\project@dissemination}{Public (P)}
\newcommand{\project@description}{}
\newcommand{\project@date}{\today}
\newcommand{\project@logobox}{}

% Highlight colour (undefined by default)
\colorlet{highlight}{.}

%%% User configurable settings
\newcommand{\deliverable}[1]{\gdef\project@deliverable{#1}}
\newcommand{\leadbeneficiary}[1]{\gdef\project@leadbeneficiary{#1}}
\newcommand{\otherbeneficiaries}[1]{\gdef\project@otherbeneficiaries{#1}}
\newcommand{\workpackage}[1]{\gdef\project@workpackage{#1}}
\newcommand{\version}[1]{\gdef\project@version{#1}}
\newcommand{\nature}[1]{\gdef\project@nature{#1}}
\newcommand{\dissemination}[1]{\gdef\project@dissemination{#1}}
\newcommand{\docdate}[1]{\gdef\project@date{#1}}
\newcommand{\docdescription}[1]{\gdef\project@description{#1}}

%%% Define 
\AtEndDocument{\clearpage
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{%
    \string\newlabel{project@lastpage}%
    {{}{\thepage}}}%
  \addtocounter{page}{1}%
}

%%% Custom page style - plain
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

%%% Custom page style - headings
\fancypagestyle{headings}{%
    \fancyhf{}
    \lhead{\normalsize Deliverable~\project@deliverable}
    \chead{\normalsize \project@acronym}
    \rhead{\normalsize Grant No.~\project@grantno}
    \lfoot{}
    \cfoot{\thepage}
    \rfoot{}
    \renewcommand{\headrulewidth}{0.25mm}
    \renewcommand{\footrulewidth}{0pt}
}

%%% Custom page style - pretty
\fancypagestyle{pretty}{%
    \fancyhf{}
    \lhead{\normalsize Deliverable~\project@deliverable}
    \chead{\normalsize \project@acronym}
    \rhead{\normalsize Grant No.~\project@grantno}
    \lfoot{}
    \cfoot{\thepage}
    \rfoot{}
    \renewcommand{\headrulewidth}{0.25mm}
    \renewcommand{\footrulewidth}{0pt}
}

%%%
%%% Title page
%%%
\renewcommand{\maketitle}{%
    \ifpdf%
    \pdfinfo{%
        /Author (\@author)%
        /Title (\project@acronym Deliverable \project@deliverable)%
        /Subject (\@title)%
    }%
    \fi%
    \renewcommand{\familydefault}{\sfdefault}%
    \newgeometry{ignorehead,ignorefoot,top=1.5cm,bottom=0.8cm,left=2.0cm,right=2.0cm,headsep=0.5cm,headheight=1.5cm,footskip=10pt}%
    \begin{titlepage}
        \normalsize%
        \thispagestyle{plain}%
        %%% Header
        \vbox to 4.75cm {%
		  \project@logobox%
          \color{highlight}%
          \Large%
          \scalebox{0.91}{%
            \textbf{\project@name}} \hfill \project@url \\[-5pt]
          \rule{\textwidth}{0.75mm} \\%[-2pt]
          \normalsize%
          Grant No.~\project@grantno.
          Project started \project@startdate.
          Duration \project@duration.%
          \vfil}%
        \color{black}%
        %%% Deliverable number and title
        \vbox to 5.1cm {%
          \textbf{\huge\textcolor{highlight}{DELIVERABLE} \project@deliverable} \\
          \vskip8mm%
          \parbox{\textwidth}{\raggedright\huge%
            \textbf{\MakeUppercase{\@title}}}%
          \vfil}%
        %%% Authors
        \vbox to 3.0cm {%
          \parbox{\textwidth}{\raggedright\LARGE%
            \@author}%
            %\textbf{\@author}}%
          \vfil}%
        %%% Beneficiaries, workpackage, and description
        \vbox to 8.8cm {%
          \large%
          \begin{tabular}{@{}p{4.25cm}p{11.5cm}}
          \textcolor{highlight}{\textbf{Beneficiaries:}} & 
            \textbf{\project@leadbeneficiary} (lead)%
            \ifthenelse{%
              \equal{%
                \project@otherbeneficiaries}{}}{}{,~\project@otherbeneficiaries}
                \\[4pt]
          \textcolor{highlight}{\textbf{Workpackage:}} &
            \textbf{\project@workpackage} \\[4pt]
          \textcolor{highlight}{\textbf{Description:}} & 
            \raggedright\project@description \\
          \end{tabular}%
          \vfil}%
        %%% Version, nature, dissemination, pages, and date
        \vbox to 4.15cm {%
          \large%
          \begin{tabular}{@{}p{4.25cm}l}
          \textcolor{highlight}{\textbf{Version:}} &
            \project@version \\[4pt]
          \textcolor{highlight}{\textbf{Nature:}} &
            \project@nature \\[4pt]
          \textcolor{highlight}{\textbf{Dissemination level:}} &
            \project@dissemination \\[4pt]
          \textcolor{highlight}{\textbf{Pages:}} &
            \pageref{project@lastpage} \\[4pt]
          \textcolor{highlight}{\textbf{Date:}} &
            \ifthenelse{%
              \equal{%
                \@date}{}}{\today}{\@date}
          \end{tabular}%
          \vfil}%
        %%% Footer
        \vbox to 1.15cm {%
          \footnotesize%
          \color{highlight}%
          \rule{\textwidth}{0.75mm} \\
          %\vskip -1.0mm%
          Project co-funded by the European Commission within the
          Horizon 2020 Programme.
          \hfill%
          \vtop{%
            \vskip-1.5ex%
            \hbox{%
              \includegraphics[height=0.7cm]{images/eu-flag}%
            }%
            %\vskip-1.5ex%
          }%
          \vfil}%
        \vfil%
        \color{black}%
        \normalsize%
    \end{titlepage}%
    \restoregeometry%
    \clearpage%
}

\raggedbottom
\pagestyle{pretty}
\pagenumbering{arabic}%
\normalsize%
%\addtocontents{toc}{\protect\thispagestyle{pretty}}

