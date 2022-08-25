% $Id$
%
% This file is part of MetaPost;
% the MetaPost program is in the public domain.
% See the <Show version...> code in mpost.w for more info.

% Here is TeX material that gets inserted after \input webmac

\font\tenlogo=logo10 % font used for the METAFONT logo
\font\logos=logosl10
\def\MF{{\tenlogo META}\-{\tenlogo FONT}}
\def\MP{{\tenlogo META}\-{\tenlogo POST}}
\def\pct!{{\char`\%}} % percent sign in ordinary text
\def\psqrt#1{\sqrt{\mathstrut#1}}


\def\title{Math support functions for MPFR based math}
\pdfoutput=1

@ Introduction.

@c 
#include <w2c/config.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
//#include "mpmathinterval.h" /* internal header */
#define ROUND(a) floor((a)+0.5)
@h


