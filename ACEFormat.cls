% ==============================================================================
% file: LabNotebook.cls
% author: Jeremy Lloyd Conlin (jlconlin@lanl.gov)
% desc: Provides some custom environments used in the ACE Format specification
% This is really to clean up the main tex file and keep it simpler.
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ACEFormat}[2017/12/13 v1.0 ACe Format]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

\LoadClass{scrartcl}

\newcommand{\MT}{\textsf{MT}}

\newcommand{\var}[1]{\textsf{#1}}
\newcommand{\aceArray}[1]{{\sffamily #1}}
\newcommand{\IZAW}{\aceArray{IZAW}}
\newcommand{\NXS}{\aceArray{NXS}}
\newcommand{\nxs}[1]{\texttt{NXS(#1)}}
\newcommand{\JXS}{\aceArray{JXS}}
\newcommand{\jxs}[1]{\texttt{JXS(#1)}}
\newcommand{\XSS}{\aceArray{XSS}}
\newcommand{\xss}[1]{\texttt{XSS(#1)}}

\newcommand{\Block}[1]{{\sffamily #1} Block}
\newcommand{\startblock}[1]{\ensuremath{S_{\mathrm{#1}}}}

%------- table environments ---------
\newenvironment{NXSTable}[1]{%
  \begin{XXSTable}{\NXS}{#1}
  }
{\end{XXSTable}}

\newenvironment{JXSTable}[1]{%
  \begin{XXSTable}{\JXS}{#1}
  }
{\end{XXSTable}}

\newenvironment{XXSTable}[2]{%
  \begin{longtable}{rll}
  \caption{#1 array element definitions for #1 \ACE\ Table.} \\[1.5ex]
    \toprule
    \ifthenelse{\equal{#1}{\JXS}}%
      {Element  & Name   & Location Description \\}
      {Element  & Name   & Description \\}
    \midrule
\endfirsthead
  \caption{#1 (continued)} \\[1.5ex]
    \toprule
    \ifthenelse{\equal{#1}{\JXS}}%
      {Element  & Name   & Location Description \\}
      {Element  & Name   & Description \\}
    \midrule
\endhead
    \bottomrule
    \multicolumn{3}{r}{\emph{Continued on next page}}
  \endfoot
    \bottomrule
    \ifcsempty{TPTL@body}{}{%test
      \insertTableNotes 
      \csgdef{TPTL@body}{}% delete the body
    }
  \endlastfoot
}
{\end{longtable}}

\newenvironment{BlockTable}[2][]{%
  \begin{longtable}{lll}
    \caption{\Block{#2}#1.} \\[1.5ex]
    \toprule
    Location in \XSS & Parameter & Description \\
    \midrule
  \endfirsthead
    \caption{\Block{#2}#1 (continued)} \\[1.5ex]
    \toprule
    Element  & Name   & Location Description \\
    \midrule
\endhead
    \bottomrule
    \multicolumn{3}{r}{\emph{Continued on next page}}
  \endfoot
    \bottomrule
    \ifcsempty{TPTL@body}{}{%test
      \insertTableNotes 
      \csgdef{TPTL@body}{}% delete the body
    }
  \endlastfoot
}
{\end{longtable}}

