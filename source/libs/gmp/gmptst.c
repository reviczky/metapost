/* gmptst.c: Basic test for libgmp
 *
 * Copyright (C) 2013 Peter Breitenlohner <tex-live@tug.org>
 * You may freely use, modify and/or distribute this file.
 */

#include <stdio.h>
#include <gmp.h>

int main (int argc, char **argv)
{
  printf ("%s: Compiled with gmp version %s\n",
          argv[0], gmp_version);
  return 0;
}
