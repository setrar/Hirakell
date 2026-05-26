\documentclass{article}

% The listings package allows us to define the code environment smoothly
\usepackage{listings}

\usepackage{hyperref}

% Map the 'code' environment to a verbatim-like style for Haskell
\lstnewenvironment{code}
{\lstset{language=Haskell,basicstyle=\small\ttfamily,breaklines=true}}
{}

\begin{document}

This script writes a diminished progression layout out to a MIDI file.

Just copy me to a .lhs file and run me in ghci

Check out the Haskell wiki: \url{https://wiki.haskell.org/Literate_programming}

\begin{code}
import Euterpea
\end{code}

Here is the underlying musical phrase logic.

\begin{code}
music = c 4 qn :=: e 4 qn :+: d 4 qn :=: f 4 qn :+:
        e 4 qn :=: g 4 qn :+: f 4 qn :=: gs 4 qn :+:
        g 4 qn :=: a 4 qn :+: af 4 qn :=: b 4 qn :+:
        a 4 qn :=: c 5 qn :+: b 4 qn :=: d 5 qn :+:
        c 4 qn :=: e 5 qn
\end{code}

Inject the 8/4 time signature metadata wrapper into the rendering compilation thread.

\begin{code}
main = writeMidi "c6dim.midi" $ Modify (Custom "TimeSignature: 8/4") music
\end{code}

\end{document}