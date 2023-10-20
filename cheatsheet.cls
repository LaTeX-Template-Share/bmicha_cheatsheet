% MIT License

% Copyright (c) 2023  Micha Bosshart

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

% Author: % Micha Bosshart - bmicha@ethz.ch

% https://github.com/LaTeX-Template-Share

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2023/10/20 LaTeX class for cheatsheets by Micha Bosshart]
\LoadClass[8pt, a4paper, landscape]{extarticle}

%% packages
\RequirePackage{multicol}
\RequirePackage{amsmath}
\RequirePackage{changepage}
\RequirePackage{etoolbox} % check ifempty
\RequirePackage[dvipsnames]{xcolor}
\newcommand{\customColor}{RoyalBlue}
\RequirePackage{tcolorbox}

%% Link to GitHub Repo
\RequirePackage[hidelinks,
  pdftex,
  pdfauthor={Micha Bosshart},
  pdftitle={https://github.com/LaTeX-Template-Share}
]{hyperref}


%% options
% optionslist [onecolumn, twocolumn, threecolumn, numerate]
\newcommand{\@@colnum}{4} % default number of columns
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{twocolumns}{\def\@@colnum{2}}
\DeclareOption{threecolumns}{\def\@@colnum{3}}
\setcounter{secnumdepth}{0} % disable counting
\DeclareOption{numerate}{\setcounter{secnumdepth}{3}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

%% Header
\def\@doctitle{}
\long\def\doctitle#1{\def\@doctitle{#1}}
\def\@docauthor{}
\long\def\author#1{\def\@docauthor{#1}}


%% text margin for left and right
\def\@@leftTextMargin{1mm}
\def\@@rightTextMargin{1mm}

%% begin and end document
\AtBeginDocument{%
    \begin{multicols*}{\@@colnum}%
    \begin{adjustwidth}{\@@leftTextMargin}{\@@rightTextMargin}%
    \Header{\href{https://github.com/LaTeX-Template-Share}{\@doctitle}}{\@docauthor}
    \small%
}
\AtEndDocument{%
    \end{adjustwidth}%
    \end{multicols*}%
}


%% SECTION
\newcommand*{\sectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=1mm,%
                        colback=\customColor,%
                        boxrule=0pt,%
                        valign=center,%
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}
}%
\renewcommand\section{\@startsection%
                            {section}% name
                            {1}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\sectionbox}% function which automaticaly gets the section argument
}
%% SUBSECTION
\newcommand*{\subsectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=1mm,%
                        colback=\customColor!60,%
                        boxrule=0pt,%
                        valign=center,%
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}%
}
\renewcommand\subsection{\@startsection%
                            {subsection}% name
                            {2}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\subsectionbox}%
}
%% SUBSUBSECTION
\newcommand*{\subsubsectionbox}[1]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
                        arc=1mm,% corner radius
                        colback=\customColor!30,%
                        boxrule=0pt,% border box
                        valign=center,% vertically center title
                        height from=5mm to 5cm,%
                        top=0mm,%
                        bottom=0mm,%
                        left=0.2mm,%
                        right=0.2mm,%
                        after skip = 0.01mm,%
                        before skip = 0.01mm,%
                        fontupper=\color{white}%
                        ]%
                        \textbf{#1}%
        \end{tcolorbox}%
    \end{adjustwidth}%
}
\renewcommand\subsubsection{\@startsection%
                            {subsubsection}% name
                            {3}% level
                            {\z@}% indent
                            {0.1mm}% space before
                            {0.1mm}% space after
                            {\normalsize\subsubsectionbox}%
}

%% HEADER
\newcommand{\Header}[3][]{%
    \begin{adjustwidth}{-\@@leftTextMargin}{-\@@rightTextMargin}
        \begin{tcolorbox}[%
            arc=1mm,%
            colframe=\customColor,%
            colback=\customColor,%
            boxrule=0pt,%
            toptitle=0mm,%
            bottomtitle=1mm,%
            right=0mm,%
            left=0mm,%
            fontupper=\color{white},%
            after skip = 0.01mm,%
            top=-1mm,%
            bottom=0mm,%
            title= \huge \center \textbf{#2} \par%
            \ifstrempty{#3}{}{
                \center \large \vskip1mm #3 %
            }
        ]%
        \center \small Version: \today \vskip1mm \tiny #1
        \end{tcolorbox}%
    \end{adjustwidth}
}

%% MATHBOX
% PRE: #1 math expression
\newcommand{\mathbox}[1]{%
    \vskip4pt%
    \begin{center}%
        \boxed{%
            #1%
        }%
    \end{center}%
    \vskip4pt%
}

%% MATLAB
% simulates matlab syntax font
\newcommand{\matlab}[1]{%
    \vskip4pt%
    \begin{center}%
        \fontfamily{qcr}\selectfont #1%
    \end{center}%
}

\renewcommand{\normalsize}{\fontsize{8}{9}\selectfont} % changes normalsize to small % dirty
\renewcommand{\familydefault}{\sfdefault}

\setlength{\parindent}{0cm}
\setlength\columnsep{0.5mm}
\setlength{\columnseprule}{0pt}
\setlength{\textwidth}{597pt} % max 597pt
\setlength{\textheight}{845pt} % max 845pt
\RequirePackage[top=0.01cm, bottom=0.05cm, left=0.01cm, right=0.01cm]{geometry}