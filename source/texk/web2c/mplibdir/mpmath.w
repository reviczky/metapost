% $Id $
%
% Copyright 2008-2010 Taco Hoekwater.
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
%
% You should have received a copy of the GNU Lesser General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
% TeX is a trademark of the American Mathematical Society.
% METAFONT is a trademark of Addison-Wesley Publishing Company.
% PostScript is a trademark of Adobe Systems Incorporated.

% Here is TeX material that gets inserted after \input webmac

\font\tenlogo=logo10 % font used for the METAFONT logo
\font\logos=logosl10
\def\MF{{\tenlogo META}\-{\tenlogo FONT}}
\def\MP{{\tenlogo META}\-{\tenlogo POST}}

\def\title{Reading TEX metrics files}
\pdfoutput=1

@ Introduction.

@d EL_GORDO   0x7fffffff /* $2^{31}-1$, the largest value that \MP\ likes */

@c 
#include "config.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mplib.h"
#include "mpmp.h" /* internal header */
#include "mpmath.h" /* internal header */
@h

@ @c
@<Declarations@>

@ @(mpmath.h@>=
@<Internal library declarations@>;

@ Currently empty
@<Declarations@>=

@ The |make_fraction| routine produces the |fraction| equivalent of
|p/q|, given integers |p| and~|q|; it computes the integer
$f=\lfloor2^{28}p/q+{1\over2}\rfloor$, when $p$ and $q$ are
positive. If |p| and |q| are both of the same scaled type |t|,
the ``type relation'' |make_fraction(t,t)=fraction| is valid;
and it's also possible to use the subroutine ``backwards,'' using
the relation |make_fraction(t,fraction)=t| between scaled types.

If the result would have magnitude $2^{31}$ or more, |make_fraction|
sets |arith_error:=true|. Most of \MP's internal computations have
been designed to avoid this sort of error.

If this subroutine were programmed in assembly language on a typical
machine, we could simply compute |(@t$2^{28}$@>*p)div q|, since a
double-precision product can often be input to a fixed-point division
instruction. But when we are restricted to int-eger arithmetic it
is necessary either to resort to multiple-precision maneuvering
or to use a simple but slow iteration. The multiple-precision technique
would be about three times faster than the code adopted here, but it
would be comparatively long and tricky, involving about sixteen
additional multiplications and divisions.

This operation is part of \MP's ``inner loop''; indeed, it will
consume nearly 10\pct! of the running time (exclusive of input and output)
if the code below is left unchanged. A machine-dependent recoding
will therefore make \MP\ run faster. The present implementation
is highly portable, but slow; it avoids multiplication and division
except in the initial stage. System wizards should be careful to
replace it with a routine that is guaranteed to produce identical
results in all cases.
@^system dependencies@>

As noted below, a few more routines should also be replaced by machine-dependent
code, for efficiency. But when a procedure is not part of the ``inner loop,''
such changes aren't advisable; simplicity and robustness are
preferable to trickery, unless the cost is too high.
@^inner loop@>

@<Internal library declarations@>=
fraction mp_make_fraction (MP mp, integer p, integer q);

@ We need these preprocessor values

@d TWEXP31  2147483648.0
@d TWEXP28  268435456.0
@d TWEXP16 65536.0
@d TWEXP_16 (1.0/65536.0)
@d TWEXP_28 (1.0/268435456.0)


@c
fraction mp_make_fraction (MP mp, integer p, integer q) {
  fraction i;
  if (q == 0)
    mp_confusion (mp, "/");
@:this can't happen /}{\quad \./@> {
    register double d;
    d = TWEXP28 * (double) p / (double) q;
    if ((p ^ q) >= 0) {
      d += 0.5;
      if (d >= TWEXP31) {
        mp->arith_error = true;
        return EL_GORDO;
      }
      i = (integer) d;
      if (d == (double) i && (((q > 0 ? -q : q) & 077777)
                              * (((i & 037777) << 1) - 1) & 04000) != 0)
        --i;
    } else {
      d -= 0.5;
      if (d <= -TWEXP31) {
        mp->arith_error = true;
        return -EL_GORDO;
      }
      i = (integer) d;
      if (d == (double) i && (((q > 0 ? q : -q) & 077777)
                              * (((i & 037777) << 1) + 1) & 04000) != 0)
        ++i;
    }
  }
  return i;
}


@ The dual of |make_fraction| is |take_fraction|, which multiplies a
given integer~|q| by a fraction~|f|. When the operands are positive, it
computes $p=\lfloor qf/2^{28}+{1\over2}\rfloor$, a symmetric function
of |q| and~|f|.

This routine is even more ``inner loopy'' than |make_fraction|;
the present implementation consumes almost 20\pct! of \MP's computation
time during typical jobs, so a machine-language substitute is advisable.
@^inner loop@> @^system dependencies@>

@<Internal library declarations@>=
integer mp_take_fraction (MP mp, integer q, fraction f);

@ @c
integer mp_take_fraction (MP mp, integer p, fraction q) {
  register double d;
  register integer i;
  d = (double) p *(double) q *TWEXP_28;
  if ((p ^ q) >= 0) {
    d += 0.5;
    if (d >= TWEXP31) {
      if (d != TWEXP31 || (((p & 077777) * (q & 077777)) & 040000) == 0)
        mp->arith_error = true;
      return EL_GORDO;
    }
    i = (integer) d;
    if (d == (double) i && (((p & 077777) * (q & 077777)) & 040000) != 0)
      --i;
  } else {
    d -= 0.5;
    if (d <= -TWEXP31) {
      if (d != -TWEXP31 || ((-(p & 077777) * (q & 077777)) & 040000) == 0)
        mp->arith_error = true;
      return -EL_GORDO;
    }
    i = (integer) d;
    if (d == (double) i && ((-(p & 077777) * (q & 077777)) & 040000) != 0)
      ++i;
  }
  return i;
}


@ When we want to multiply something by a |scaled| quantity, we use a scheme
analogous to |take_fraction| but with a different scaling.
Given positive operands, |take_scaled|
computes the quantity $p=\lfloor qf/2^{16}+{1\over2}\rfloor$.

Once again it is a good idea to use a machine-language replacement if
possible; otherwise |take_scaled| will use more than 2\pct! of the running time
when the Computer Modern fonts are being generated.
@^inner loop@>

@<Internal library declarations@>=
integer mp_take_scaled (MP mp, integer q, scaled f);

@ @c
integer mp_take_scaled (MP mp, integer p, scaled q) {
  register double d;
  register integer i;
  d = (double) p *(double) q *TWEXP_16;
  if ((p ^ q) >= 0) {
    d += 0.5;
    if (d >= TWEXP31) {
      if (d != TWEXP31 || (((p & 077777) * (q & 077777)) & 040000) == 0)
        mp->arith_error = true;
      return EL_GORDO;
    }
    i = (integer) d;
    if (d == (double) i && (((p & 077777) * (q & 077777)) & 040000) != 0)
      --i;
  } else {
    d -= 0.5;
    if (d <= -TWEXP31) {
      if (d != -TWEXP31 || ((-(p & 077777) * (q & 077777)) & 040000) == 0)
        mp->arith_error = true;
      return -EL_GORDO;
    }
    i = (integer) d;
    if (d == (double) i && ((-(p & 077777) * (q & 077777)) & 040000) != 0)
      ++i;
  }
  return i;
}


@ For completeness, there's also |make_scaled|, which computes a
quotient as a |scaled| number instead of as a |fraction|.
In other words, the result is $\lfloor2^{16}p/q+{1\over2}\rfloor$, if the
operands are positive. \ (This procedure is not used especially often,
so it is not part of \MP's inner loop.)

@<Internal library ...@>=
scaled mp_make_scaled (MP mp, integer p, integer q);

@ @c
scaled mp_make_scaled (MP mp, integer p, integer q) {
  register integer i;
  if (q == 0)
    mp_confusion (mp, "/");
@:this can't happen /}{\quad \./@> {
    register double d;
    d = TWEXP16 * (double) p / (double) q;
    if ((p ^ q) >= 0) {
      d += 0.5;
      if (d >= TWEXP31) {
        mp->arith_error = true;
        return EL_GORDO;
      }
      i = (integer) d;
      if (d == (double) i && (((q > 0 ? -q : q) & 077777)
                              * (((i & 037777) << 1) - 1) & 04000) != 0)
        --i;
    } else {
      d -= 0.5;
      if (d <= -TWEXP31) {
        mp->arith_error = true;
        return -EL_GORDO;
      }
      i = (integer) d;
      if (d == (double) i && (((q > 0 ? q : -q) & 077777)
                              * (((i & 037777) << 1) + 1) & 04000) != 0)
        ++i;
    }
  }
  return i;
}

@ The following function divides |s| by |m|. |dd| is number of decimal digits.

@<Internal library ...@>=
scaled mp_divide_scaled (MP mp, scaled s, scaled m, integer dd);

@ @c
scaled mp_divide_scaled (MP mp, scaled s, scaled m, integer dd) {
  scaled q, r;
  integer sign, i;
  sign = 1;
  if (s < 0) {
    sign = -sign;
    s = -s;
  }
  if (m < 0) {
    sign = -sign;
    m = -m;
  }
  if (m == 0)
    mp_confusion (mp, "arithmetic: divided by zero");
  else if (m >= (EL_GORDO / 10))
    mp_confusion (mp, "arithmetic: number too big");
  q = s / m;
  r = s % m;
  for (i = 1; i <= dd; i++) {
    q = 10 * q + (10 * r) / m;
    r = (10 * r) % m;
  }
  if (2 * r >= m) {
    q++;
    r = r - m;
  }
  mp->scaled_out = sign * (s - (r / mp->ten_pow[dd]));
  return (sign * q);
}



