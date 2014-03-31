/* mpfrtst.c: Basic test for libmpfr
 *
 * Copyright (C) 2013 Peter Breitenlohner <tex-live@tug.org>
 * You may freely use, modify and/or distribute this file.
 */

#include <stdio.h>
#include <gmp.h>
#include <mpfr.h>

int main (int argc, char **argv)
{
  printf ("%s: Compiled with mpfr version %s\n",
          argv[0], mpfr_get_version());
  return 0;
}
