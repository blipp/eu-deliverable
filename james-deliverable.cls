%%%
%%% Sample use of the EU project deliverable class (JAMES project)
%%%
%%% Version 1.0 (2016-02-15)
%%%
%%% Based on the JAMES deliverable latex document classes by Ron Petrick.
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
%%%  - Split off from standalone EU deliverable class

%%% Load the base EU deliverable class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{james-deliverable}[2016/02/15 v2.0 JAMES project deliverable (using eu-deliverable)]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{eu-deliverable}}
\ProcessOptions
\LoadClass{eu-deliverable}

% Define the static properties of the current project
\renewcommand{\project@acronym}{JAMES}
\renewcommand{\project@grantno}{270435}
\renewcommand{\project@startdate}{2011-02-01}
\renewcommand{\project@duration}{36 months}
\renewcommand{\project@name}{JOINT ACTION FOR MULTIMODAL EMBODIED SOCIAL SYSTEMS}
\renewcommand{\project@url}{james-project.eu}

% Logo box (optional)
\renewcommand{\project@logobox}{%
          \raisebox{2mm}{%
            \includegraphics[width=1.8cm]{james/james-logo}}%
          \hskip 2.5mm%
          \includegraphics[height=1.85cm]{james/james-logotext} \\[4pt]}

% Highlight colour (optional)
\definecolor{james@blue}{rgb}{0.145098,0.2862745,0.462745}
\colorlet{highlight}{james@blue}

