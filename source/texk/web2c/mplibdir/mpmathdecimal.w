% $Id: mpmathdecimal.w 1915 2013-06-13 10:17:31Z taco $
%
% This file is part of MetaPost;
% the MetaPost program is in the public domain.
% See the <Show version...> code in mpost.w for more info.

% Here is TeX material that gets inserted after \input webmac

\font\tenlogo=logo10 % font used for the METAFONT logo
\font\logos=logosl10
\def\MF{{\tenlogo META}\-{\tenlogo FONT}}
\def\MP{{\tenlogo META}\-{\tenlogo POST}}

\def\title{Math support functions for decNumber based math}
\pdfoutput=1

@ Introduction.

@c 
#include <w2c/config.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "mpmathdecimal.h" /* internal header */
#define ROUND(a) floor((a)+0.5)
@h

@ @c
@<Declarations@>;

@ @(mpmathdecimal.h@>=
#ifndef MPMATHDECIMAL_H
#define  MPMATHDECIMAL_H 1
#include "mplib.h"
#include "mpmp.h" /* internal header */
#define  DECNUMDIGITS 34
#include "decNumber.h"
@<Internal library declarations@>;
#endif

@* Math initialization.

First, here are some very important constants.

@d PI 3.1415926535897932384626433832795028841971 
@d PI_STRING "3.1415926535897932384626433832795028841971"
@d fraction_multiplier 4096
@d angle_multiplier 16

@ Here are the functions that are static as they are not used elsewhere

@<Declarations@>=
static void mp_decimal_scan_fractional_token (MP mp, int n);
static void mp_decimal_scan_numeric_token (MP mp, int n);
static void mp_ab_vs_cd (MP mp, mp_number *ret, mp_number a, mp_number b, mp_number c, mp_number d);
static void mp_decimal_crossing_point (MP mp, mp_number *ret, mp_number a, mp_number b, mp_number c);
static void mp_decimal_number_modulo (mp_number *a, mp_number b);
static void mp_decimal_print_number (MP mp, mp_number n);
static char * mp_decimal_number_tostring (MP mp, mp_number n);
static void mp_decimal_slow_add (MP mp, mp_number *ret, mp_number x_orig, mp_number y_orig);
static void mp_decimal_square_rt (MP mp, mp_number *ret, mp_number x_orig);
static void mp_decimal_sin_cos (MP mp, mp_number z_orig, mp_number *n_cos, mp_number *n_sin);
static void mp_init_randoms (MP mp, int seed);
static void mp_number_angle_to_scaled (mp_number *A);
static void mp_number_fraction_to_scaled (mp_number *A);
static void mp_number_scaled_to_fraction (mp_number *A);
static void mp_number_scaled_to_angle (mp_number *A);
static void mp_decimal_m_exp (MP mp, mp_number *ret, mp_number x_orig);
static void mp_decimal_m_log (MP mp, mp_number *ret, mp_number x_orig);
static void mp_decimal_pyth_sub (MP mp, mp_number *r, mp_number a, mp_number b);
static void mp_decimal_pyth_add (MP mp, mp_number *r, mp_number a, mp_number b);
static void mp_decimal_n_arg (MP mp, mp_number *ret, mp_number x, mp_number y);
static void mp_decimal_velocity (MP mp, mp_number *ret, mp_number st, mp_number ct, mp_number sf,  mp_number cf, mp_number t);
static void mp_set_decimal_from_int(mp_number *A, int B);
static void mp_set_decimal_from_boolean(mp_number *A, int B);
static void mp_set_decimal_from_scaled(mp_number *A, int B);
static void mp_set_decimal_from_addition(mp_number *A, mp_number B, mp_number C);
static void mp_set_decimal_from_substraction (mp_number *A, mp_number B, mp_number C);
static void mp_set_decimal_from_div(mp_number *A, mp_number B, mp_number C);
static void mp_set_decimal_from_mul(mp_number *A, mp_number B, mp_number C);
static void mp_set_decimal_from_int_div(mp_number *A, mp_number B, int C);
static void mp_set_decimal_from_int_mul(mp_number *A, mp_number B, int C);
static void mp_set_decimal_from_of_the_way(MP mp, mp_number *A, mp_number t, mp_number B, mp_number C);
static void mp_number_negate(mp_number *A);
static void mp_number_add(mp_number *A, mp_number B);
static void mp_number_substract(mp_number *A, mp_number B);
static void mp_number_half(mp_number *A);
static void mp_number_halfp(mp_number *A);
static void mp_number_double(mp_number *A);
static void mp_number_add_scaled(mp_number *A, int B); /* also for negative B */
static void mp_number_multiply_int(mp_number *A, int B);
static void mp_number_divide_int(mp_number *A, int B);
static void mp_decimal_abs(mp_number *A);   
static void mp_number_clone(mp_number *A, mp_number B);
static void mp_number_swap(mp_number *A, mp_number *B);
static int mp_round_unscaled(mp_number x_orig);
static int mp_number_to_int(mp_number A);
static int mp_number_to_scaled(mp_number A);
static int mp_number_to_boolean(mp_number A);
static double mp_number_to_double(mp_number A);
static int mp_number_odd(mp_number A);
static int mp_number_equal(mp_number A, mp_number B);
static int mp_number_greater(mp_number A, mp_number B);
static int mp_number_less(mp_number A, mp_number B);
static int mp_number_nonequalabs(mp_number A, mp_number B);
static void mp_number_floor (mp_number *i);
static void mp_decimal_fraction_to_round_scaled (mp_number *x);
static void mp_decimal_number_make_scaled (MP mp, mp_number *r, mp_number p, mp_number q);
static void mp_decimal_number_make_fraction (MP mp, mp_number *r, mp_number p, mp_number q);
static void mp_decimal_number_take_fraction (MP mp, mp_number *r, mp_number p, mp_number q);
static void mp_decimal_number_take_scaled (MP mp, mp_number *r, mp_number p, mp_number q);
static void mp_new_number (MP mp, mp_number *n, mp_number_type t) ;
static void mp_free_number (MP mp, mp_number *n) ;
static void mp_set_decimal_from_double(mp_number *A, double B);
static void mp_free_decimal_math (MP mp);

@ And these are the ones that {\it are} used elsewhere

@<Internal library declarations@>=
void * mp_initialize_decimal_math (MP mp);

@ 

@d coef_bound ((7.0/3.0)*fraction_multiplier) /* |fraction| approximation to 7/3 */
@d fraction_threshold 0.04096 /* a |fraction| coefficient less than this is zeroed */
@d half_fraction_threshold (fraction_threshold/2) /* half of |fraction_threshold| */
@d scaled_threshold 0.000122 /* a |scaled| coefficient less than this is zeroed */
@d half_scaled_threshold (scaled_threshold/2) /* half of |scaled_threshold| */
@d near_zero_angle (0.0256*angle_multiplier)  /* an angle of about 0.0256 */
@d p_over_v_threshold 0x80000 /* TODO */
@d equation_threshold 0.001
@d tfm_warn_threshold 0.0625
@d warning_limit pow(2.0,52.0)  /* this is a large value that can just be expressed without loss of precision */
@d epsilon pow(2.0,-52.0)

@c
static decContext set;
static decNumber one;
static decNumber minusone;
static decNumber fraction_multiplier_decNumber;
static decNumber angle_multiplier_decNumber;
static decNumber PI_decNumber;
static decNumber **factorials = NULL;
static int last_cached_factorial = 0;
void * mp_initialize_decimal_math (MP mp) {
  math_data *math = (math_data *)mp_xmalloc(mp,1,sizeof(math_data));
  // various decNumber initializations
  decContextDefault(&set, DEC_INIT_BASE); // initialize
  set.traps=0;                     // no traps, thank you
  set.digits=DECNUMDIGITS;         // set precision
  decNumberFromInt32(&one, 1);
  decNumberFromInt32(&minusone, -1);
  decNumberFromInt32(&fraction_multiplier_decNumber, fraction_multiplier);
  decNumberFromInt32(&angle_multiplier_decNumber, angle_multiplier);
  decNumberFromString(&PI_decNumber, PI_STRING, &set);
  factorials = (decNumber **)mp_xmalloc(mp,PRECALC_FACTORIALS_CACHESIZE,sizeof(decNumber *));
  factorials[0] = (decNumber *)mp_xmalloc(mp,1,sizeof(decNumber));
  decNumberCopy(factorials[0], &one);

  /* alloc */
  math->allocate = mp_new_number;
  math->free = mp_free_number;
  /* here are the constants for |scaled| objects */
  mp_new_number (mp, &math->epsilon_t, mp_scaled_type);
  math->epsilon_t.data.dval  = epsilon;
  mp_new_number (mp, &math->inf_t, mp_scaled_type);
  math->inf_t.data.dval  = EL_GORDO;
  mp_new_number (mp, &math->warning_limit_t, mp_scaled_type);
  math->warning_limit_t.data.dval  = warning_limit;
  mp_new_number (mp, &math->one_third_inf_t, mp_scaled_type);
  math->one_third_inf_t.data.dval = one_third_EL_GORDO;
  mp_new_number (mp, &math->unity_t, mp_scaled_type);
  math->unity_t.data.dval = unity;
  mp_new_number (mp, &math->two_t, mp_scaled_type);
  math->two_t.data.dval = two;
  mp_new_number (mp, &math->three_t, mp_scaled_type);
  math->three_t.data.dval = three;
  mp_new_number (mp, &math->half_unit_t, mp_scaled_type);
  math->half_unit_t.data.dval = half_unit;
  mp_new_number (mp, &math->three_quarter_unit_t, mp_scaled_type);
  math->three_quarter_unit_t.data.dval = three_quarter_unit;
  mp_new_number (mp, &math->zero_t, mp_scaled_type);
  /* |fractions| */
  mp_new_number (mp, &math->arc_tol_k, mp_fraction_type);
  math->arc_tol_k.data.dval = (unity/4096);  /* quit when change in arc length estimate reaches this */
  mp_new_number (mp, &math->fraction_one_t, mp_fraction_type);
  math->fraction_one_t.data.dval = fraction_one;
  mp_new_number (mp, &math->fraction_half_t, mp_fraction_type);
  math->fraction_half_t.data.dval = fraction_half;
  mp_new_number (mp, &math->fraction_three_t, mp_fraction_type);
  math->fraction_three_t.data.dval = fraction_three;
  mp_new_number (mp, &math->fraction_four_t, mp_fraction_type);
  math->fraction_four_t.data.dval = fraction_four;
  /* |angles| */
  mp_new_number (mp, &math->three_sixty_deg_t, mp_angle_type);
  decNumberFromInt32(math->three_sixty_deg_t.data.num, 360);
  mp_new_number (mp, &math->one_eighty_deg_t, mp_angle_type);
  decNumberFromInt32(math->one_eighty_deg_t.data.num, 180);
  /* various approximations */
  mp_new_number (mp, &math->one_k, mp_scaled_type);
  math->one_k.data.dval = 1024;
  mp_new_number (mp, &math->sqrt_8_e_k, mp_scaled_type); 
  math->sqrt_8_e_k.data.dval = 112429 / 65536.0; /* $2^{16}\sqrt{8/e}\approx 112428.82793$ */
  mp_new_number (mp, &math->twelve_ln_2_k, mp_fraction_type); 
  math->twelve_ln_2_k.data.dval = 139548960 / 65536.0; /* $2^{24}\cdot12\ln2\approx139548959.6165$ */
  mp_new_number (mp, &math->coef_bound_k, mp_fraction_type);
  math->coef_bound_k.data.dval = coef_bound;
  mp_new_number (mp, &math->coef_bound_minus_1, mp_fraction_type);
  math->coef_bound_minus_1.data.dval = coef_bound - 1/65536.0;
  mp_new_number (mp, &math->twelvebits_3, mp_scaled_type);
  math->twelvebits_3.data.dval = 1365 / 65536.0;  /* $1365\approx 2^{12}/3$ */
  mp_new_number (mp, &math->twentysixbits_sqrt2_t, mp_fraction_type);
  math->twentysixbits_sqrt2_t.data.dval = 94906266 / 65536.0;      /* $2^{26}\sqrt2\approx94906265.62$ */
  mp_new_number (mp, &math->twentyeightbits_d_t, mp_fraction_type);
  math->twentyeightbits_d_t.data.dval = 35596755 / 65536.0;        /* $2^{28}d\approx35596754.69$ */
  mp_new_number (mp, &math->twentysevenbits_sqrt2_d_t, mp_fraction_type);
  math->twentysevenbits_sqrt2_d_t.data.dval = 25170707 / 65536.0;  /* $2^{27}\sqrt2\,d\approx25170706.63$ */
  /* thresholds */
  mp_new_number (mp, &math->fraction_threshold_t, mp_fraction_type);
  math->fraction_threshold_t.data.dval = fraction_threshold;
  mp_new_number (mp, &math->half_fraction_threshold_t, mp_fraction_type);
  math->half_fraction_threshold_t.data.dval = half_fraction_threshold;
  mp_new_number (mp, &math->scaled_threshold_t, mp_scaled_type);
  math->scaled_threshold_t.data.dval = scaled_threshold;
  mp_new_number (mp, &math->half_scaled_threshold_t, mp_scaled_type);
  math->half_scaled_threshold_t.data.dval = half_scaled_threshold;
  mp_new_number (mp, &math->near_zero_angle_t, mp_angle_type);
  math->near_zero_angle_t.data.dval = near_zero_angle;
  mp_new_number (mp, &math->p_over_v_threshold_t, mp_fraction_type);
  math->p_over_v_threshold_t.data.dval = p_over_v_threshold;
  mp_new_number (mp, &math->equation_threshold_t, mp_scaled_type);
  math->equation_threshold_t.data.dval = equation_threshold;
  mp_new_number (mp, &math->tfm_warn_threshold_t, mp_scaled_type);
  math->tfm_warn_threshold_t.data.dval = tfm_warn_threshold;
  /* functions */
  math->from_int = mp_set_decimal_from_int;
  math->from_boolean = mp_set_decimal_from_boolean;
  math->from_scaled = mp_set_decimal_from_scaled;
  math->from_double = mp_set_decimal_from_double;
  math->from_addition  = mp_set_decimal_from_addition;
  math->from_substraction  = mp_set_decimal_from_substraction;
  math->from_oftheway  = mp_set_decimal_from_of_the_way;
  math->from_div  = mp_set_decimal_from_div;
  math->from_mul  = mp_set_decimal_from_mul;
  math->from_int_div  = mp_set_decimal_from_int_div;
  math->from_int_mul  = mp_set_decimal_from_int_mul;
  math->negate = mp_number_negate;
  math->add  = mp_number_add;
  math->substract = mp_number_substract;
  math->half = mp_number_half;
  math->halfp = mp_number_halfp;
  math->do_double = mp_number_double;
  math->abs = mp_decimal_abs;
  math->clone = mp_number_clone;
  math->swap = mp_number_swap;
  math->add_scaled = mp_number_add_scaled;
  math->multiply_int = mp_number_multiply_int;
  math->divide_int = mp_number_divide_int;
  math->to_boolean = mp_number_to_boolean;
  math->to_scaled = mp_number_to_scaled;
  math->to_double = mp_number_to_double;
  math->to_int = mp_number_to_int;
  math->odd = mp_number_odd;
  math->equal = mp_number_equal;
  math->less = mp_number_less;
  math->greater = mp_number_greater;
  math->nonequalabs = mp_number_nonequalabs;
  math->round_unscaled = mp_round_unscaled;
  math->floor_scaled = mp_number_floor;
  math->fraction_to_round_scaled = mp_decimal_fraction_to_round_scaled;
  math->make_scaled = mp_decimal_number_make_scaled;
  math->make_fraction = mp_decimal_number_make_fraction;
  math->take_fraction = mp_decimal_number_take_fraction;
  math->take_scaled = mp_decimal_number_take_scaled;
  math->velocity = mp_decimal_velocity;
  math->n_arg = mp_decimal_n_arg;
  math->m_log = mp_decimal_m_log;
  math->m_exp = mp_decimal_m_exp;
  math->pyth_add = mp_decimal_pyth_add;
  math->pyth_sub = mp_decimal_pyth_sub;
  math->fraction_to_scaled = mp_number_fraction_to_scaled;
  math->scaled_to_fraction = mp_number_scaled_to_fraction;
  math->scaled_to_angle = mp_number_scaled_to_angle;
  math->angle_to_scaled = mp_number_angle_to_scaled;
  math->init_randoms = mp_init_randoms;
  math->sin_cos = mp_decimal_sin_cos;
  math->slow_add = mp_decimal_slow_add;
  math->sqrt = mp_decimal_square_rt;
  math->print = mp_decimal_print_number;
  math->tostring = mp_decimal_number_tostring;
  math->modulo = mp_decimal_number_modulo;
  math->ab_vs_cd = mp_ab_vs_cd;
  math->crossing_point = mp_decimal_crossing_point;
  math->scan_numeric = mp_decimal_scan_numeric_token;
  math->scan_fractional = mp_decimal_scan_fractional_token;
  math->free_math = mp_free_decimal_math;
  
  return (void *)math;
}

void mp_free_decimal_math (MP mp) {
  int i;
  free_number (((math_data *)mp->math)->three_sixty_deg_t);
  free_number (((math_data *)mp->math)->one_eighty_deg_t);
  free_number (((math_data *)mp->math)->fraction_one_t);
  free_number (((math_data *)mp->math)->zero_t);
  free_number (((math_data *)mp->math)->half_unit_t);
  free_number (((math_data *)mp->math)->three_quarter_unit_t);
  free_number (((math_data *)mp->math)->unity_t);
  free_number (((math_data *)mp->math)->two_t);
  free_number (((math_data *)mp->math)->three_t);
  free_number (((math_data *)mp->math)->one_third_inf_t);
  free_number (((math_data *)mp->math)->inf_t);
  free_number (((math_data *)mp->math)->warning_limit_t);
  free_number (((math_data *)mp->math)->one_k);
  free_number (((math_data *)mp->math)->sqrt_8_e_k);
  free_number (((math_data *)mp->math)->twelve_ln_2_k);
  free_number (((math_data *)mp->math)->coef_bound_k);
  free_number (((math_data *)mp->math)->coef_bound_minus_1);
  free_number (((math_data *)mp->math)->fraction_threshold_t);
  free_number (((math_data *)mp->math)->half_fraction_threshold_t);
  free_number (((math_data *)mp->math)->scaled_threshold_t);
  free_number (((math_data *)mp->math)->half_scaled_threshold_t);
  free_number (((math_data *)mp->math)->near_zero_angle_t);
  free_number (((math_data *)mp->math)->p_over_v_threshold_t);
  free_number (((math_data *)mp->math)->equation_threshold_t);
  free_number (((math_data *)mp->math)->tfm_warn_threshold_t);
  for (i = 0; i <= last_cached_factorial; i++) {
    free(factorials[i]);
  }
  free(factorials);
  free(mp->math);
}

@ Creating an destroying |mp_number| objects

@ @c
void mp_new_number (MP mp, mp_number *n, mp_number_type t) {
  (void)mp;
  n->data.num = mp_xmalloc(mp,1,sizeof(decNumber));
  decNumberZero(n->data.num);
  n->type = t;
}

@ 

@c
void mp_free_number (MP mp, mp_number *n) {
  (void)mp;
  free(n->data.num);
  n->data.num = NULL;
  n->type = mp_nan_type;
}

@ Here are the low-level functions on |mp_number| items, setters first.

@c 
void mp_set_decimal_from_int(mp_number *A, int B) {
  decNumberFromInt32(A->data.num,B);
}
void mp_set_decimal_from_boolean(mp_number *A, int B) {
  decNumberFromInt32(A->data.num,B);
}
void mp_set_decimal_from_scaled(mp_number *A, int B) {
  decNumber c;
  decNumberFromInt32(&c, 65536);
  decNumberFromInt32(A->data.num,B);
  decNumberDivide(A->data.num,A->data.num,&c, &set);
}
void mp_set_decimal_from_double(mp_number *A, double B) {
  char buf[40];
  char *c;
  snprintf(buf,40,"%-32.16lf",B);
  c = buf;
  while (*c++) {
    if (*c == ' ') {
      *c = '\0';
      break;
    }
  }
  decNumberFromString(A->data.num, buf, &set);
}
void mp_set_decimal_from_addition(mp_number *A, mp_number B, mp_number C) {
  decNumberAdd(A->data.num,B.data.num,C.data.num, &set);
}
void mp_set_decimal_from_substraction (mp_number *A, mp_number B, mp_number C) {
  decNumberSubtract(A->data.num,B.data.num,C.data.num, &set);
}
void mp_set_decimal_from_div(mp_number *A, mp_number B, mp_number C) {
  decNumberDivide(A->data.num,B.data.num,C.data.num, &set);
}
void mp_set_decimal_from_mul(mp_number *A, mp_number B, mp_number C) {
  decNumberMultiply(A->data.num,B.data.num,C.data.num, &set);
}
void mp_set_decimal_from_int_div(mp_number *A, mp_number B, int C) {
  decNumber c;
  decNumberFromInt32(&c, C);
  decNumberDivide(A->data.num,B.data.num,&c, &set);
}
void mp_set_decimal_from_int_mul(mp_number *A, mp_number B, int C) {
  decNumber c;
  decNumberFromInt32(&c, C);
  decNumberMultiply(A->data.num,B.data.num,&c, &set);
}
void mp_set_decimal_from_of_the_way(MP mp, mp_number *A, mp_number t, mp_number B, mp_number C) {
  decNumber c;
  decNumber r1;
  decNumberSubtract(&c,B.data.num, C.data.num, &set);
  mp_decimal_take_fraction(mp, &r1, &c, t.data.num);
  decNumberSubtract(A->data.num, B.data.num, &r1, &set);
}
void mp_number_negate(mp_number *A) {
  decNumber c;
  decNumberCopy(&c, A->data.num);
  decNumberCopyNegate(A->data.num, &c);
}
void mp_number_add(mp_number *A, mp_number B) {
  decNumberAdd(A->data.num,A->data.num,B.data.num, &set);
}
void mp_number_substract(mp_number *A, mp_number B) {
  decNumberSubtract(A->data.num,A->data.num,B.data.num, &set);
}
void mp_number_half(mp_number *A) {
  decNumber c;
  decNumberFromInt32(&c, 2);
  decNumberDivide(A->data.num,A->data.num, &c, &set);
}
void mp_number_halfp(mp_number *A) {
  decNumber c;
  decNumberFromInt32(&c, 2);
  decNumberDivide(A->data.num,A->data.num, &c, &set);
}
void mp_number_double(mp_number *A) {
  decNumber c;
  decNumberFromInt32(&c, 2);
  decNumberMultiply(A->data.num,A->data.num, &c, &set);
}
void mp_number_add_scaled(mp_number *A, int B) { /* also for negative B */
  decNumber b,c;
  decNumberFromInt32(&c, 65536);
  decNumberFromInt32(&b, B);
  decNumberDivide(&b,&b, &c, &set);
  decNumberAdd(A->data.num,A->data.num, &b, &set);
}
void mp_number_multiply_int(mp_number *A, int B) {
  decNumber b;
  decNumberFromInt32(&b, B);
  decNumberMultiply(A->data.num,A->data.num, &b, &set);
}
void mp_number_divide_int(mp_number *A, int B) {
  decNumber b;
  decNumberFromInt32(&b, B);
  decNumberDivide(A->data.num,A->data.num,&b, &set);
}
void mp_decimal_abs(mp_number *A) {   
  decNumberAbs(A->data.num, A->data.num, &set);
}
void mp_number_clone(mp_number *A, mp_number B) {
  decNumberCopy(A->data.num, B.data.num);
}
void mp_number_swap(mp_number *A, mp_number *B) {
  decNumber swap_tmp;
  decNumberCopy(&swap_tmp,   A->data.num);
  decNumberCopy(A->data.num, B->data.num);
  decNumberCopy(B->data.num, &swap_tmp);
}
void mp_number_fraction_to_scaled (mp_number *A) {
    decNumber fmul;
    decNumberFromInt32(&fmul, fraction_multiplier);
    A->type = mp_scaled_type;
    decNumberDivide(A->data.num, A->data.num, &fmul, &set);
}
void mp_number_angle_to_scaled (mp_number *A) {
    decNumber fmul, arounded, dec_half;
    decNumberFromInt32(&fmul, angle_multiplier);
    decNumberFromString(&dec_half, "0.5", &set);
    A->type = mp_scaled_type;
    decNumberCopy(&arounded,A->data.num);
    decNumberAdd(&arounded, &arounded, &dec_half, &set);
    decNumberToIntegralValue(&arounded, &arounded, &set);
    decNumberDivide(A->data.num, &arounded, &fmul, &set);
}
void mp_number_scaled_to_fraction (mp_number *A) {
    decNumber fmul;
    decNumberFromInt32(&fmul, fraction_multiplier);
    A->type = mp_fraction_type;
    decNumberMultiply(A->data.num, A->data.num, &fmul, &set);
}
void mp_number_scaled_to_angle (mp_number *A) {
    decNumber fmul;
    decNumberFromInt32(&fmul, angle_multiplier);
    A->type = mp_angle_type;
    decNumberMultiply(A->data.num, A->data.num, &fmul, &set);
}


@ Query functions

@d odd(A)   ((A)%2==1)

@c
int mp_number_to_scaled(mp_number A) {
  int32_t result;
  set.status = 0;
  result = decNumberToInt32(A.data.num, &set);
  if (set.status == DEC_Invalid_operation) {
     set.status = 0;
     //mp->arith_error = 1;
     return 0; // whatever
  } else {
     return result * 65536;
  }
}
int mp_number_to_int(mp_number A) {
  int32_t result;
  set.status = 0;
  result = decNumberToInt32(A.data.num, &set);
  if (set.status == DEC_Invalid_operation) {
     set.status = 0;
     // mp->arith_error = 1;
     return 0; // whatever
  } else {
     return result;
  }
}
int mp_number_to_boolean(mp_number A) {
  uint32_t result;
  set.status = 0;
  result = decNumberToUInt32(A.data.num, &set);
  if (set.status == DEC_Invalid_operation) {
     set.status = 0;
     // mp->arith_error = 1;
     return 0; // whatever
  } else {
     return (result ? 1 : 0);
  }
}
double mp_number_to_double(mp_number A) {
  char *buffer = malloc(set.digits + 14);
  double res = 0.0;
  assert (buffer);
  decNumberToString(A.data.num, buffer);
  if (sscanf(buffer, "%lf", &res)) {
     free(buffer);
     return res;
  } else {
     free(buffer);
     //mp->arith_error = 1;
     return 0.0; // whatever
  }
}
int mp_number_odd(mp_number A) {
  return odd(mp_number_to_int(A));
}
int mp_number_equal(mp_number A, mp_number B) {
  decNumber res;
  decNumberCompare(&res,A.data.num,B.data.num, &set);
  return decNumberIsZero(&res);
}
int mp_number_greater(mp_number A, mp_number B) {
  decNumber res;
  decNumberCompare(&res,A.data.num,B.data.num, &set);
  return !decNumberIsNegative(&res);
}
int mp_number_less(mp_number A, mp_number B) {
  decNumber res;
  decNumberCompare(&res,A.data.num,B.data.num, &set);
  return decNumberIsNegative(&res);
}
int mp_number_nonequalabs(mp_number A, mp_number B) {
  decNumber res, a, b;
  decNumberCopyAbs(&a, A.data.num);
  decNumberCopyAbs(&b, B.data.num);
  decNumberCompare(&res, &a, &b, &set);
  return !decNumberIsZero(&res);
}

@ Fixed-point arithmetic is done on {\sl scaled integers\/} that are multiples
of $2^{-16}$. In other words, a binary point is assumed to be sixteen bit
positions from the right end of a binary computer word.

@d unity   1.0
@d two 2.0
@d three 3.0
@d half_unit  0.5
@d three_quarter_unit 0.75

@d EL_GORDO   (DBL_MAX/2.0-1.0) /* the largest value that \MP\ likes. */
@d one_third_EL_GORDO (EL_GORDO/3.0)

@ One of \MP's most common operations is the calculation of
$\lfloor{a+b\over2}\rfloor$,
the midpoint of two given integers |a| and~|b|. The most decent way to do
this is to write `|(a+b)/2|'; but on many machines it is more efficient 
to calculate `|(a+b)>>1|'.

Therefore the midpoint operation will always be denoted by `|half(a+b)|'
in this program. If \MP\ is being implemented with languages that permit
binary shifting, the |half| macro should be changed to make this operation
as efficient as possible.  Since some systems have shift operators that can
only be trusted to work on positive numbers, there is also a macro |halfp|
that is used only when the quantity being halved is known to be positive
or zero.

@ Here is a procedure analogous to |print_int|.  The current version
is fairly stupid, and it is not round-trip safe, but this is good
enough for a beta test.

@c
char * mp_decimal_number_tostring (MP mp, mp_number n) {
  char *buffer = malloc(set.digits + 14);
  assert (buffer);
  decNumberToString(n.data.num, buffer);
  return buffer;
}


@ @c
void mp_decimal_print_number (MP mp, mp_number n) {
  char *str = mp_decimal_number_tostring(mp, n);
  mp_print (mp, str);
  free (str);
}




@ Addition is not always checked to make sure that it doesn't overflow,
but in places where overflow isn't too unlikely the |slow_add| routine
is used.

@c
void mp_decimal_slow_add (MP mp, mp_number *ret, mp_number A, mp_number B) {
  decNumberAdd(ret->data.num,A.data.num,B.data.num, &set);
}

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

@c
void mp_decimal_make_fraction (MP mp, decNumber *ret, decNumber *p, decNumber *q) {
  decNumber frac;
  decNumberFromInt32(&frac,fraction_multiplier);
  decNumberDivide(ret, p, q, &set);
  decNumberMultiply(ret, ret, &frac, &set);
}
void mp_decimal_number_make_fraction (MP mp, mp_number *ret, mp_number p, mp_number q) {
  mp_decimal_make_fraction (mp, ret->data.num, p.data.num, q.data.num);
}

@ @<Declarations@>=
void mp_decimal_make_fraction (MP mp, decNumber *ret, decNumber *p, decNumber *q);

@ The dual of |make_fraction| is |take_fraction|, which multiplies a
given integer~|q| by a fraction~|f|. When the operands are positive, it
computes $p=\lfloor qf/2^{28}+{1\over2}\rfloor$, a symmetric function
of |q| and~|f|.

This routine is even more ``inner loopy'' than |make_fraction|;
the present implementation consumes almost 20\pct! of \MP's computation
time during typical jobs, so a machine-language substitute is advisable.
@^inner loop@> @^system dependencies@>

@c
void mp_decimal_take_fraction (MP mp, decNumber *ret, decNumber *p, decNumber *q) {
  decNumber f;
  decNumberFromInt32(&f, fraction_multiplier);
  decNumberMultiply(ret, p, q, &set);
  decNumberDivide(ret, ret, &f, &set);
}
void mp_decimal_number_take_fraction (MP mp, mp_number *ret, mp_number p, mp_number q) {
  mp_decimal_take_fraction (mp, ret->data.num, p.data.num, q.data.num);
}

@ @<Declarations@>=
void mp_decimal_take_fraction (MP mp, decNumber *ret, decNumber *p, decNumber *q);

@ When we want to multiply something by a |scaled| quantity, we use a scheme
analogous to |take_fraction| but with a different scaling.
Given positive operands, |take_scaled|
computes the quantity $p=\lfloor qf/2^{16}+{1\over2}\rfloor$.

Once again it is a good idea to use a machine-language replacement if
possible; otherwise |take_scaled| will use more than 2\pct! of the running time
when the Computer Modern fonts are being generated.
@^inner loop@>

@c
void mp_decimal_number_take_scaled (MP mp, mp_number *ret, mp_number p_orig, mp_number q_orig) {
  decNumberMultiply(ret->data.num, p_orig.data.num, q_orig.data.num, &set);
}


@ For completeness, there's also |make_scaled|, which computes a
quotient as a |scaled| number instead of as a |fraction|.
In other words, the result is $\lfloor2^{16}p/q+{1\over2}\rfloor$, if the
operands are positive. \ (This procedure is not used especially often,
so it is not part of \MP's inner loop.)

@c
void mp_decimal_number_make_scaled (MP mp, mp_number *ret, mp_number p_orig, mp_number q_orig) {
  decNumberDivide(ret->data.num, p_orig.data.num, q_orig.data.num, &set);
}

@ 
@d halfp(A) (integer)((unsigned)(A) >> 1)

@* Scanning numbers in the input

The definitions below are temporarily here

@d set_cur_cmd(A) mp->cur_mod_->type=(A)
@d set_cur_mod(A) mp->cur_mod_->data.n.data.dval=(A)

@<Declarations...@>=
static void mp_wrapup_numeric_token(MP mp, unsigned char *start, unsigned char *stop);

@ @c
void mp_wrapup_numeric_token(MP mp, unsigned char *start, unsigned char *stop) {
  double result;
  char *end = (char *)stop;
  errno = 0;
  result = strtod ((char *)start, &end);
  if (errno == 0) {
    set_cur_mod(result);
    if (result >= warning_limit) {
      if (internal_value (mp_warning_check).data.dval > 0 &&
          (mp->scanner_status != tex_flushing)) {
        char msg[256];
        const char *hlp[] = {"Continue and I'll try to cope",
               "with that big value; but it might be dangerous.",
               "(Set warningcheck:=0 to suppress this message.)",
               NULL };
        mp_snprintf (msg, 256, "Number is too large (%g)", result);
@.Number is too large@>;
        mp_error (mp, msg, hlp, true);
      }
    }
  } else if (mp->scanner_status != tex_flushing) {
    const char *hlp[] = {"I could not handle this number specification",
                         "probably because it is out of range. Error:",
                         "",
                          NULL };   
    hlp[2] = strerror(errno);
    mp_error (mp, "Enormous number has been reduced.", hlp, false);
@.Enormous number...@>;
    set_cur_mod(EL_GORDO);
  }
  set_cur_cmd((mp_variable_type)mp_numeric_token);
}

@ @c
static void find_exponent (MP mp)  {
  if (mp->buffer[mp->cur_input.loc_field] == 'e' || 
      mp->buffer[mp->cur_input.loc_field] == 'E') {
     mp->cur_input.loc_field++;
     if (!(mp->buffer[mp->cur_input.loc_field] == '+' || 
        mp->buffer[mp->cur_input.loc_field] == '-' ||
	mp->char_class[mp->buffer[mp->cur_input.loc_field]] == digit_class)) {
       mp->cur_input.loc_field--;
       return;
     }     
     if (mp->buffer[mp->cur_input.loc_field] == '+' || 
        mp->buffer[mp->cur_input.loc_field] == '-') {
        mp->cur_input.loc_field++;
     }
     while (mp->char_class[mp->buffer[mp->cur_input.loc_field]] == digit_class) {
       mp->cur_input.loc_field++;
     }
  }
}
void mp_decimal_scan_fractional_token (MP mp, int n) { /* n: scaled */
  unsigned char *start = &mp->buffer[mp->cur_input.loc_field -1];
  unsigned char *stop;
  while (mp->char_class[mp->buffer[mp->cur_input.loc_field]] == digit_class) {
     mp->cur_input.loc_field++;
  }
  find_exponent(mp);
  stop = &mp->buffer[mp->cur_input.loc_field-1];
  mp_wrapup_numeric_token (mp, start, stop);
}


@ Input format is the same as for the C language, so we just collect valid
bytes in the buffer, then call |strtod()|

@c
void mp_decimal_scan_numeric_token (MP mp, int n) { /* n: scaled */
  unsigned char *start = &mp->buffer[mp->cur_input.loc_field -1];
  unsigned char *stop;
  while (mp->char_class[mp->buffer[mp->cur_input.loc_field]] == digit_class) {
     mp->cur_input.loc_field++;
  }
  if (mp->buffer[mp->cur_input.loc_field] == '.' && 
      mp->buffer[mp->cur_input.loc_field+1] != '.') {
     mp->cur_input.loc_field++;
     while (mp->char_class[mp->buffer[mp->cur_input.loc_field]] == digit_class) {
       mp->cur_input.loc_field++;
     }
  } 
  find_exponent(mp);
  stop = &mp->buffer[mp->cur_input.loc_field-1];
  mp_wrapup_numeric_token (mp, start, stop);
}

@ The |scaled| quantities in \MP\ programs are generally supposed to be
less than $2^{12}$ in absolute value, so \MP\ does much of its internal
arithmetic with 28~significant bits of precision. A |fraction| denotes
a scaled integer whose binary point is assumed to be 28 bit positions
from the right.

@d fraction_half (0.5*fraction_multiplier)
@d fraction_one (1.0*fraction_multiplier)
@d fraction_two (2.0*fraction_multiplier)
@d fraction_three (3.0*fraction_multiplier)
@d fraction_four (4.0*fraction_multiplier)

@ Here is a typical example of how the routines above can be used.
It computes the function
$${1\over3\tau}f(\theta,\phi)=
{\tau^{-1}\bigl(2+\sqrt2\,(\sin\theta-{1\over16}\sin\phi)
 (\sin\phi-{1\over16}\sin\theta)(\cos\theta-\cos\phi)\bigr)\over
3\,\bigl(1+{1\over2}(\sqrt5-1)\cos\theta+{1\over2}(3-\sqrt5\,)\cos\phi\bigr)},$$
where $\tau$ is a |scaled| ``tension'' parameter. This is \MP's magic
fudge factor for placing the first control point of a curve that starts
at an angle $\theta$ and ends at an angle $\phi$ from the straight path.
(Actually, if the stated quantity exceeds 4, \MP\ reduces it to~4.)

The trigonometric quantity to be multiplied by $\sqrt2$ is less than $\sqrt2$.
(It's a sum of eight terms whose absolute values can be bounded using
relations such as $\sin\theta\cos\theta\L{1\over2}$.) Thus the numerator
is positive; and since the tension $\tau$ is constrained to be at least
$3\over4$, the numerator is less than $16\over3$. The denominator is
nonnegative and at most~6.  

The angles $\theta$ and $\phi$ are given implicitly in terms of |fraction|
arguments |st|, |ct|, |sf|, and |cf|, representing $\sin\theta$, $\cos\theta$,
$\sin\phi$, and $\cos\phi$, respectively.

@c
void mp_decimal_velocity (MP mp, mp_number *ret, mp_number st, mp_number ct, mp_number sf,
                  mp_number cf, mp_number t) {
  decNumber acc, num, denom;      /* registers for intermediate calculations */
  decNumber r1, r2;
  decNumber arg1, arg2;
  decNumber i16, fone, fhalf, ftwo, i3, i1;
  decNumberFromInt32(&i16, 16);
  decNumberFromInt32(&i3, 3);
  decNumberFromInt32(&i1, 1);
  decNumberFromInt32(&fone, fraction_one);
  decNumberFromInt32(&fhalf, fraction_half);
  decNumberFromInt32(&ftwo, fraction_two);
  decNumberDivide(&arg1,sf.data.num, &i16, &set);
  decNumberSubtract(&arg1,st.data.num,&arg1, &set);
  decNumberDivide(&arg2,st.data.num, &i16, &set);
  decNumberSubtract(&arg2,sf.data.num,&arg1, &set);
  mp_decimal_take_fraction (mp, &acc, &arg1, &arg2);
  decNumberSubtract(&arg1, ct.data.num, cf.data.num, &set);
  mp_decimal_take_fraction (mp, &acc, &acc, &arg1);
  decNumberFromInt32(&arg1, 2);
  decNumberSquareRoot(&arg1, &arg1, &set);
  decNumberMultiply(&arg1, &arg1, &fone, &set);
  mp_decimal_take_fraction (mp, &r1, &acc, &arg1);
  decNumberAdd(&num, &ftwo, &r1, &set);
  
  decNumberFromInt32(&arg1, 5);
  decNumberSquareRoot(&arg1, &arg1, &set);
  decNumberSubtract(&arg1,&arg1, &i1, &set);
  decNumberMultiply(&arg1,&arg1,&fhalf, &set);
  decNumberMultiply(&arg1,&arg1,&i3, &set);

  decNumberFromInt32(&arg2, 5);
  decNumberSquareRoot(&arg2, &arg2, &set);
  decNumberSubtract(&arg2,&i3, &arg2, &set);
  decNumberMultiply(&arg2,&arg2,&fhalf, &set);
  decNumberMultiply(&arg2,&arg2,&i3, &set);
  mp_decimal_take_fraction (mp, &r1, ct.data.num, &arg1) ;
  mp_decimal_take_fraction (mp, &r2, cf.data.num, &arg2);

  decNumberFromInt32(&denom, fraction_three);
  decNumberAdd(&denom, &denom, &r1, &set);
  decNumberAdd(&denom, &denom, &r2, &set);

  decNumberFromInt32(&r1, unity);
  decNumberCompare(&arg1, t.data.num, &r1, &set);
  if (!decNumberIsZero(&arg1)) {
    //  num = mp_decimal_make_scaled (mp, num, t.data.dval);
    decNumberDivide(&num, &num, t.data.num, &set);
  }
  decNumberFromInt32(&r1, 4);
  decNumberCopy(&r2, &num);
  decNumberDivide(&r2, &r2, &r1, &set);
  decNumberCompare(&arg1, &denom,&r2, &set);
  if (decNumberIsNegative(&arg1)) { // num/4 >= denom => denom < num/4
    decNumberFromInt32(ret->data.num,fraction_four);
  } else {
    mp_decimal_make_fraction (mp, ret->data.num, &num, &denom);
  }
}


@ The following somewhat different subroutine tests rigorously if $ab$ is
greater than, equal to, or less than~$cd$,
given integers $(a,b,c,d)$. In most cases a quick decision is reached.
The result is $+1$, 0, or~$-1$ in the three respective cases.

@c
void mp_ab_vs_cd (MP mp, mp_number *ret, mp_number a_orig, mp_number b_orig, mp_number c_orig, mp_number d_orig) {
  integer q, r; /* temporary registers */
  integer a, b, c, d;
  (void)mp;
  a = a_orig.data.dval;
  b = b_orig.data.dval;
  c = c_orig.data.dval;
  d = d_orig.data.dval;
  @<Reduce to the case that |a,c>=0|, |b,d>0|@>;
  while (1) {
    q = a / d;
    r = c / b;
    if (q != r) {
      ret->data.dval = (q > r ? 1 : -1);
      return;
    }
    q = a % d;
    r = c % b;
    if (r == 0) {
      ret->data.dval = (q ? 1 : 0);
      return;
    }
    if (q == 0) {
      ret->data.dval = -1;
      return;
    }
    a = b;
    b = q;
    c = d;
    d = r;
  }                             /* now |a>d>0| and |c>b>0| */
}


@ @<Reduce to the case that |a...@>=
if (a < 0) {
  a = -a;
  b = -b;
}
if (c < 0) {
  c = -c;
  d = -d;
}
if (d <= 0) {
  if (b >= 0) {
    if ((a == 0 || b == 0) && (c == 0 || d == 0)) 
      ret->data.dval = 0;
    else
      ret->data.dval = 1;
    return;
  }
  if (d == 0) {
    ret->data.dval = (a == 0 ? 0 : -1);
    return;
  }
  q = a;
  a = c;
  c = q;
  q = -b;
  b = -d;
  d = q;
} else if (b <= 0) {
  if (b < 0 && a > 0) {
    ret->data.dval  = -1;
    return;
  }
  ret->data.dval = (c == 0 ? 0 : -1);
  return;
}

@ Now here's a subroutine that's handy for all sorts of path computations:
Given a quadratic polynomial $B(a,b,c;t)$, the |crossing_point| function
returns the unique |fraction| value |t| between 0 and~1 at which
$B(a,b,c;t)$ changes from positive to negative, or returns
|t=fraction_one+1| if no such value exists. If |a<0| (so that $B(a,b,c;t)$
is already negative at |t=0|), |crossing_point| returns the value zero.

The general bisection method is quite simple when $n=2$, hence
|crossing_point| does not take much time. At each stage in the
recursion we have a subinterval defined by |l| and~|j| such that
$B(a,b,c;2^{-l}(j+t))=B(x_0,x_1,x_2;t)$, and we want to ``zero in'' on
the subinterval where $x_0\G0$ and $\min(x_1,x_2)<0$.

It is convenient for purposes of calculation to combine the values
of |l| and~|j| in a single variable $d=2^l+j$, because the operation
of bisection then corresponds simply to doubling $d$ and possibly
adding~1. Furthermore it proves to be convenient to modify
our previous conventions for bisection slightly, maintaining the
variables $X_0=2^lx_0$, $X_1=2^l(x_0-x_1)$, and $X_2=2^l(x_1-x_2)$.
With these variables the conditions $x_0\ge0$ and $\min(x_1,x_2)<0$ are
equivalent to $\max(X_1,X_1+X_2)>X_0\ge0$.

The following code maintains the invariant relations
$0\L|x0|<\max(|x1|,|x1|+|x2|)$,
$\vert|x1|\vert<2^{30}$, $\vert|x2|\vert<2^{30}$;
it has been constructed in such a way that no arithmetic overflow
will occur if the inputs satisfy
$a<2^{30}$, $\vert a-b\vert<2^{30}$, and $\vert b-c\vert<2^{30}$.

@d no_crossing   { ret->data.dval = fraction_one + 1; return; }
@d one_crossing  { ret->data.dval = fraction_one; return; }
@d zero_crossing { ret->data.dval = 0; return; }

@c
static void mp_decimal_crossing_point (MP mp, mp_number *ret, mp_number aa, mp_number bb, mp_number cc) {
  double a,b,c;
  double d;    /* recursive counter */
  double x, xx, x0, x1, x2;    /* temporary registers for bisection */
  a = aa.data.dval;
  b = bb.data.dval;
  c = cc.data.dval;
  if (a < 0)
    zero_crossing;
  if (c >= 0) {
    if (b >= 0) {
      if (c > 0) {
        no_crossing;
      } else if ((a == 0) && (b == 0)) {
        no_crossing;
      } else {
        one_crossing;
      }
    }
    if (a == 0)
      zero_crossing;
  } else if (a == 0) {
    if (b <= 0)
      zero_crossing;
  }

  /* Use bisection to find the crossing point... */
  d = epsilon;
  x0 = a;
  x1 = a - b;
  x2 = b - c;
  do {
    /* not sure why the error correction has to be >= 1E-12 */
    x = (x1 + x2) / 2 + 1E-12;
    if (x1 - x0 > x0) {
      x2 = x;
      x0 += x0;
      d += d;
    } else {
      xx = x1 + x - x0;
      if (xx > x0) {
        x2 = x;
        x0 += x0;
        d += d;
      } else {
        x0 = x0 - xx;
        if (x <= x0) {
          if (x + x2 <= x0)
            no_crossing;
        }
        x1 = x;
        d = d + d + epsilon;
      }
    }
  } while (d < fraction_one);
  ret->data.dval = (d - fraction_one); 
}
 

@ We conclude this set of elementary routines with some simple rounding
and truncation operations.


@ |round_unscaled| rounds a |scaled| and converts it to |int|
@c
int mp_round_unscaled(mp_number x_orig) {
  int x = (int)ROUND(x_orig.data.dval);
  return x;
}

@ |number_floor| floors a number

@c
void mp_number_floor (mp_number *i) {
  i->data.dval = floor(i->data.dval);
}

@ |fraction_to_scaled| rounds a |fraction| and converts it to |scaled|
@c
void mp_decimal_fraction_to_round_scaled (mp_number *x_orig) {
  double x = x_orig->data.dval;
  x_orig->type = mp_scaled_type;
  x_orig->data.dval = x/fraction_multiplier;
}



@* Algebraic and transcendental functions.
\MP\ computes all of the necessary special functions from scratch, without
relying on |real| arithmetic or system subroutines for sines, cosines, etc.

@ 

@c
void mp_decimal_square_rt (MP mp, mp_number *ret, mp_number x_orig) { /* return, x: scaled */
  double x;
  x = x_orig.data.dval;
  if (x <= 0) {
    @<Handle square root of zero or negative argument@>;
  } else {
    ret->data.dval = sqrt(x);
  }
}


@ @<Handle square root of zero...@>=
{  
  if (x < 0) {
    char msg[256];
    const char *hlp[] = {
           "Since I don't take square roots of negative numbers,",
           "I'm zeroing this one. Proceed, with fingers crossed.",
           NULL };
    char *xstr = mp_decimal_number_tostring (mp, x_orig);
    mp_snprintf(msg, 256, "Square root of %s has been replaced by 0", xstr);
    free(xstr);
@.Square root...replaced by 0@>;
    mp_error (mp, msg, hlp, true);
  }
  ret->data.dval = 0;
  return;
}


@ Pythagorean addition $\psqrt{a^2+b^2}$ is implemented by a quick hack

@c
void mp_decimal_pyth_add (MP mp, mp_number *ret, mp_number a_orig, mp_number b_orig) {
  double a, b; /* a,b : scaled */
  a = fabs (a_orig.data.dval);
  b = fabs (b_orig.data.dval);
  errno = 0;
  ret->data.dval = sqrt(a*a + b*b);
  if (errno) {
    mp->arith_error = true;
    ret->data.dval = EL_GORDO;
  }
}


@ Here is a similar algorithm for $\psqrt{a^2-b^2}$. Same quick hack, also.

@c
void mp_decimal_pyth_sub (MP mp, mp_number *ret, mp_number a_orig, mp_number b_orig) {
  double a, b;
  a = fabs (a_orig.data.dval);
  b = fabs (b_orig.data.dval);
  if (a <= b) {
    @<Handle erroneous |pyth_sub| and set |a:=0|@>;
  } else {
    a = sqrt(a*a - b*b);
  }
  ret->data.dval = a;
}


@ @<Handle erroneous |pyth_sub| and set |a:=0|@>=
{
  if (a < b) {
    char msg[256];
    const char *hlp[] = {
         "Since I don't take square roots of negative numbers,",
         "I'm zeroing this one. Proceed, with fingers crossed.",
         NULL };
    char *astr = mp_decimal_number_tostring (mp, a_orig);
    char *bstr = mp_decimal_number_tostring (mp, b_orig);
    mp_snprintf (msg, 256, "Pythagorean subtraction %s+-+%s has been replaced by 0", astr, bstr);
    free(astr);
    free(bstr);
@.Pythagorean...@>;
    mp_error (mp, msg, hlp, true);
  }
  a = 0;
}


@ The subroutines for logarithm and exponential involve two tables.
The first is simple: |two_to_the[k]| equals $2^k$. 

@d two_to_the(A) (1<<(unsigned)(A))

@ Here is the routine that calculates $2^8$ times the natural logarithm
of a |scaled| quantity; it is an integer approximation to $2^{24}\ln(x/2^{16})$,
when |x| is a given positive integer.

@c
void mp_decimal_m_log (MP mp, mp_number *ret, mp_number x_orig) {
  if (x_orig.data.dval <= 0) {
    @<Handle non-positive logarithm@>;
  } else {
    ret->data.dval = log (x_orig.data.dval)*256.0;
  }
}

@ @<Handle non-positive logarithm@>=
{
  char msg[256];
  const char *hlp[] = { 
         "Since I don't take logs of non-positive numbers,",
         "I'm zeroing this one. Proceed, with fingers crossed.",
          NULL };
  char *xstr = mp_decimal_number_tostring (mp, x_orig);
  mp_snprintf (msg, 256, "Logarithm of %s has been replaced by 0", xstr);
  free (xstr);
@.Logarithm...replaced by 0@>;
  mp_error (mp, msg, hlp, true);
  ret->data.dval = 0;
}


@ Conversely, the exponential routine calculates $\exp(x/2^8)$,
when |x| is |scaled|. 

@c
void mp_decimal_m_exp (MP mp, mp_number *ret, mp_number x_orig) {
  errno = 0;  
  ret->data.dval = exp(x_orig.data.dval/256.0);
  if (errno) {
    if (x_orig.data.dval > 0) {
      mp->arith_error = true;
      ret->data.dval = EL_GORDO;
    } else {
      ret->data.dval = 0;
    }
  }
}


@ Given integers |x| and |y|, not both zero, the |n_arg| function
returns the |angle| whose tangent points in the direction $(x,y)$.

@c
void mp_decimal_n_arg (MP mp, mp_number *ret, mp_number x_orig, mp_number y_orig) {
  if (x_orig.data.dval == 0.0 && y_orig.data.dval == 0.0) {
    @<Handle undefined arg@>;
  } else {
    ret->type = mp_angle_type;
    ret->data.dval = atan2 (y_orig.data.dval, x_orig.data.dval) * (180.0 / PI)  * angle_multiplier;
    if (ret->data.dval == -0.0) 
      ret->data.dval = 0.0;
  }
}


@ @<Handle undefined arg@>=
{
  const char *hlp[] = {
         "The `angle' between two identical points is undefined.",
         "I'm zeroing this one. Proceed, with fingers crossed.",
         NULL };
  mp_error (mp, "angle(0,0) is taken as zero", hlp, true);
@.angle(0,0)...zero@>;
  ret->data.dval = 0;
}


@ Conversely, the |n_sin_cos| routine takes an |angle| and produces the sine
and cosine of that angle. The results of this routine are
stored in global integer variables |n_sin| and |n_cos|.

First, we need a decNumber function that calculates sines and cosines
using the Taylor series. This function is fairly optimized.

@d PRECALC_FACTORIALS_CACHESIZE 50

@c
static void sinecosine(decNumber *theangle, decNumber *c, decNumber *s)
{
    int n, i;
    decNumber p, pxa, fac, cc;
    decNumber n1, n2, p1;
    decNumberZero(c);
    decNumberZero(s);
    for (n=0;n<(set.digits/2);n++)
    {
        decNumberFromInt32(&p1, n);
        decNumberFromInt32(&n1, 2*n);
        decNumberPower(&p,  &minusone, &p1, &set);
        decNumberPower(&pxa, theangle, &n1, &set);

        if (2*n<last_cached_factorial) {
	  decNumberCopy(&fac,factorials[2*n]);
	} else {
     	  decNumberCopy(&fac,factorials[last_cached_factorial]);
	  for (i = last_cached_factorial+1; i <= 2*n; i++) {
	    decNumberFromInt32(&cc, i);
	    decNumberMultiply (&fac, &fac, &cc, &set);
	    if (i<PRECALC_FACTORIALS_CACHESIZE) {
	      factorials[i] = malloc(sizeof(decNumber));
	      decNumberCopy(factorials[i],&fac);
	      last_cached_factorial = i;
	    }  
	  }
	}

        decNumberDivide   (&pxa, &pxa, &fac, &set);
        decNumberMultiply (&pxa, &pxa, &p,   &set);
        decNumberAdd      (s,    s,    &pxa, &set);

        decNumberFromInt32(&n2, 2*n+1);
        decNumberMultiply (&fac, &fac, &n2,  &set); // fac = fac * (2*n+1)
        decNumberPower(&pxa, theangle, &n2, &set);
        decNumberDivide   (&pxa, &pxa, &fac, &set);
        decNumberMultiply (&pxa, &pxa, &p,   &set);
        decNumberAdd      (c,    c,    &pxa, &set);
	// printf("\niteration %2d: %-42s %-42s",n,tostring(c), tostring(s));
    }
}

@ Calculate sines and cosines.
@c
void mp_decimal_sin_cos (MP mp, mp_number z_orig, mp_number *n_cos, mp_number *n_sin) {
  mp_number rad;
  math_data *math = (math_data *)(mp->math);
  new_number (rad);
  decNumberDivide(rad.data.num, z_orig.data.num, &angle_multiplier_decNumber, &set);
  decNumberMultiply(rad.data.num, rad.data.num, &PI_decNumber, &set);
  decNumberDivide(rad.data.num, rad.data.num, math->one_eighty_deg_t.data.num, &set);
  sinecosine(rad.data.num, n_cos->data.num, n_sin->data.num); 
  free_number (rad);
  decNumberMultiply(n_cos->data.num,n_cos->data.num,&fraction_multiplier_decNumber, &set);
  decNumberMultiply(n_sin->data.num,n_sin->data.num,&fraction_multiplier_decNumber, &set);
}

@ To initialize the |randoms| table, we call the following routine.

@c
void mp_init_randoms (MP mp, int seed) {
  int j, jj, k;    /* more or less random integers */
  int i;        /* index into |randoms| */
  j =  abs (seed);
  while (j >= fraction_one) {
    j = j/2;
  }
  k = 1;
  for (i = 0; i <= 54; i++) {
    jj = k;
    k = j - k;
    j = jj;
    if (k<0)
      k += fraction_one;
    mp->randoms[(i * 21) % 55].data.dval = j;
  }
  mp_new_randoms (mp);
  mp_new_randoms (mp);
  mp_new_randoms (mp);          /* ``warm up'' the array */
}

@ @c
static double modulus(double left, double right);
double modulus(double left, double right) {
    double quota = left / right;
    double frac,tmp;
    frac = modf(quota,&tmp);
    /* frac contains what's beyond the '.' */
    frac *= right;
    return frac;
}
void mp_decimal_number_modulo (mp_number *a, mp_number b) {
   a->data.dval = modulus (a->data.dval, b.data.dval);
}