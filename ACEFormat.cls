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
\RequirePackage{array}

\newcommand{\MT}{\textsf{MT}}

\newcommand{\var}[1]{\textsf{#1}}
\newcommand{\aceArray}[1]{\textsf{#1}}
\newcommand{\IZAW}{\aceArray{IZAW}}
\newcommand{\NXS}{\aceArray{NXS}}
\newcommand{\nxs}[1]{\texttt{NXS(#1)}}
\newcommand{\JXS}{\aceArray{JXS}}
\newcommand{\jxs}[1]{\texttt{JXS(#1)}}
\newcommand{\XSS}{\aceArray{XSS}}
\newcommand{\xss}[1]{\texttt{XSS(#1)}}

\newcommand{\Block}[1]{{\sffamily #1} Block}
\newcommand{\startblock}[1]{\ensuremath{S_{\mathsf{#1}}}}
\newcommand{\law}[1]{\textsf{law=#1}}

\newcommand{\LAB}{Lab}
\newcommand{\CM}{center-of-mass}

\newcommand{\PDF}{\ensuremath{\mathrm{PDF}}}
\newcommand{\CDF}{\ensuremath{\mathrm{CDF}}}

\newcommand{\ACE}{ACE}
\newcommand{\SaB}{\ensuremath{S(\alpha, \beta)}}
\newcommand{\ZA}{ {\sffamily ZA}}
\newcommand{\ZAID}{{\sffamily ZAID}}
\newcommand{\SZAID}{{\sffamily SZAID}}
\newcommand{\Type}[1]{Type #1}
\newcommand{\nubar}{\ensuremath{\overline{\nu}}}

\newcommand{\Sectionref}[1]{Section~\ref{#1}}
\newcommand{\Figureref}[1]{Figure~\ref{#1}}
\newcommand{\Tableref}[1]{Table~\ref{#1}}

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
    \bottomrule%
    \ifcsempty{TPTL@body}{}{%test
      \insertTableNotes 
      \csgdef{TPTL@body}{}% delete the body
    }
  \endlastfoot
}
{\end{longtable}}

\newenvironment{BlockTable}[2][]{%
  \begin{XSSTable}{\Block{#2}#1.}
  }
{\end{XSSTable}}

\newcolumntype{L}{>{\arraybackslash}m{0.5\linewidth}}

\newenvironment{XSSTable}[1]{%
  \begin{longtable}{llL}
    \caption{#1.} \\[1.5ex]
    \toprule
    Location in \XSS & Parameter & Description \\
    \midrule
  \endfirsthead
    \caption{#1 (continued)} \\[1.5ex]
    \toprule
    Location in \XSS\  & Parameter   & Description \\
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

\newcolumntype{M}{>{\arraybackslash}m{0.65\linewidth}}
\newenvironment{LOCTable}[1]{%
  \begin{longtable}{lM}
    \caption{#1.} \\[1.5ex]
    \toprule
    Location in \XSS &  Description \\
    \midrule
  \endfirsthead
    \caption{#1 (continued)} \\[1.5ex]
    \toprule
    Location in \XSS\  &  Description \\
    \midrule
\endhead
    \bottomrule
    \multicolumn{2}{r}{\emph{Continued on next page}}
  \endfoot
    \bottomrule
    \ifcsempty{TPTL@body}{}{%test
      \insertTableNotes 
      \csgdef{TPTL@body}{}% delete the body
    }
  \endlastfoot
}
{\end{longtable}}

