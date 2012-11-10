# 1 "cairo-device.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "cairo-device.c"
# 36 "cairo-device.c"
# 1 "cairoint.h" 1
# 50 "cairoint.h"
# 1 "../config.h" 1
# 51 "cairoint.h" 2






# 1 "/usr/include/assert.h" 1 3 4
# 37 "/usr/include/assert.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 324 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/predefs.h" 1 3 4
# 325 "/usr/include/features.h" 2 3 4
# 357 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 378 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 379 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 358 "/usr/include/features.h" 2 3 4
# 389 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 5 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4




# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 390 "/usr/include/features.h" 2 3 4
# 38 "/usr/include/assert.h" 2 3 4
# 68 "/usr/include/assert.h" 3 4



extern void __assert_fail (__const char *__assertion, __const char *__file,
      unsigned int __line, __const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, __const char *__file,
      unsigned int __line,
      __const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



# 58 "cairoint.h" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 33 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 212 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 3 4
typedef int wchar_t;
# 34 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 43 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 38 "/usr/include/endian.h" 2 3 4
# 61 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 62 "/usr/include/endian.h" 2 3 4
# 66 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 44 "/usr/include/stdlib.h" 2 3 4
# 68 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 96 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 140 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (__const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (__const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (__const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (__const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 236 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/xlocale.h" 1 3 4
# 28 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 237 "/usr/include/stdlib.h" 2 3 4



extern long int strtol_l (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4))) ;

extern unsigned long int strtoul_l (__const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4))) ;

__extension__
extern long long int strtoll_l (__const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4))) ;

__extension__
extern unsigned long long int strtoull_l (__const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 4))) ;

extern double strtod_l (__const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;

extern float strtof_l (__const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;

extern long double strtold_l (__const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 3))) ;
# 311 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (__const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 131 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 132 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 31 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;




typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 58 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 74 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 148 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 195 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef int int8_t __attribute__ ((__mode__ (__QI__)));
typedef int int16_t __attribute__ ((__mode__ (__HI__)));
typedef int int32_t __attribute__ ((__mode__ (__SI__)));
typedef int int64_t __attribute__ ((__mode__ (__DI__)));


typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 32 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 31 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4
# 55 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 65 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 97 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 107 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 119 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 132 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 221 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 64 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4

# 224 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 263 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;



typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 76 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    int __spins;
    __pthread_list_t __list;
# 101 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;
  } __data;
# 187 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 272 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 321 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/alloca.h" 1 3 4
# 25 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 26 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 498 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 528 "/usr/include/stdlib.h" 3 4
extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (__const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern char *__secure_getenv (__const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;





extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (__const char *__name, __const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (__const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 620 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 630 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 642 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 652 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 663 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 674 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 684 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 694 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 706 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;









extern int system (__const char *__command) ;






extern char *canonicalize_file_name (__const char *__name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 734 "/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;






typedef int (*__compar_fn_t) (__const void *, __const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (__const void *, __const void *, void *);





extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 808 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));







extern int mblen (__const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__)) ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (__const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 896 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *__const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;





extern void setkey (__const char *__key) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));



extern int unlockpt (int __fd) __attribute__ ((__nothrow__ , __leaf__));




extern char *ptsname (int __fd) __attribute__ ((__nothrow__ , __leaf__)) ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 964 "/usr/include/stdlib.h" 3 4

# 59 "cairoint.h" 2
# 1 "/usr/include/string.h" 1 3 4
# 29 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 35 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 95 "/usr/include/string.h" 3 4
extern void *memchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 109 "/usr/include/string.h" 3 4
extern void *rawmemchr (__const void *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 120 "/usr/include/string.h" 3 4
extern void *memrchr (__const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 165 "/usr/include/string.h" 3 4
extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (__const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 210 "/usr/include/string.h" 3 4

# 235 "/usr/include/string.h" 3 4
extern char *strchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 262 "/usr/include/string.h" 3 4
extern char *strrchr (__const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 276 "/usr/include/string.h" 3 4
extern char *strchrnul (__const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern size_t strcspn (__const char *__s, __const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 314 "/usr/include/string.h" 3 4
extern char *strpbrk (__const char *__s, __const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 342 "/usr/include/string.h" 3 4
extern char *strstr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 373 "/usr/include/string.h" 3 4
extern char *strcasestr (__const char *__haystack, __const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));







extern void *memmem (__const void *__haystack, size_t __haystacklen,
       __const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        __const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (__const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 438 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));





extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 489 "/usr/include/string.h" 3 4
extern char *index (__const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 517 "/usr/include/string.h" 3 4
extern char *rindex (__const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int ffsl (long int __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern int strcasecmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (__const char *__s1, __const char *__s2,
    __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (__const char *__s1, __const char *__s2,
     size_t __n, __locale_t __loc)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (__const char *__s1, __const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 606 "/usr/include/string.h" 3 4
extern char *basename (__const char *__filename) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 646 "/usr/include/string.h" 3 4

# 60 "cairoint.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 102 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 61 "cairoint.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 150 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 62 "cairoint.h" 2




# 1 "/usr/include/math.h" 1 3 4
# 30 "/usr/include/math.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/huge_val.h" 1 3 4
# 35 "/usr/include/math.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h" 1 3 4
# 37 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h" 1 3 4
# 38 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/inf.h" 1 3 4
# 41 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/nan.h" 1 3 4
# 44 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 2 3 4




typedef float float_t;
typedef double double_t;
# 48 "/usr/include/math.h" 2 3 4
# 71 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern void sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void __sincos (double __x, double *__sinx, double *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));







extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));




extern double exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp10 (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double pow10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow10 (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));






extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern double nan (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));






extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));








extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 72 "/usr/include/math.h" 2 3 4
# 94 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern void
 sincosf
# 82 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
 (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void
 __sincosf
# 82 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
 (float __x, float *__sinx, float *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));







extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));




extern float exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp10f (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float pow10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __pow10f (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern float nanf (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));






extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));








extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 95 "/usr/include/math.h" 2 3 4
# 146 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 53 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern void
 sincosl
# 82 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
 (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__)); extern void
 __sincosl
# 82 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
 (long double __x, long double *__sinx, long double *__cosx) __attribute__ ((__nothrow__ , __leaf__))
                                                           ;





extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));







extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__nonnull__ (2)));




extern long double exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double pow10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __pow10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));








extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));






extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));








extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern long double nanl (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (__const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));








extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 147 "/usr/include/math.h" 2 3 4
# 162 "/usr/include/math.h" 3 4
extern int signgam;
# 203 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN,

    FP_INFINITE,

    FP_ZERO,

    FP_SUBNORMAL,

    FP_NORMAL

  };
# 296 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 321 "/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 483 "/usr/include/math.h" 3 4

# 67 "cairoint.h" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 1 3 4
# 34 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/syslimits.h" 1 3 4






# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 1 3 4
# 169 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 145 "/usr/include/limits.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 1 3 4
# 157 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 1 3 4
# 39 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 40 "/usr/include/x86_64-linux-gnu/bits/local_lim.h" 2 3 4
# 158 "/usr/include/x86_64-linux-gnu/bits/posix1_lim.h" 2 3 4
# 146 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/posix2_lim.h" 1 3 4
# 150 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 1 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/xopen_lim.h" 2 3 4
# 154 "/usr/include/limits.h" 2 3 4
# 170 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 2 3 4
# 8 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/syslimits.h" 2 3 4
# 35 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed/limits.h" 2 3 4
# 68 "cairoint.h" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 30 "/usr/include/stdio.h" 3 4




# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 35 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 65 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 75 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 83 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
# 33 "/usr/include/libio.h" 2 3 4
# 172 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 182 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 205 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 273 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 321 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 330 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 366 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);







extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 462 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 492 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 76 "/usr/include/stdio.h" 2 3 4
# 109 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;
# 165 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 166 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (__const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (__const char *__old, __const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) ;
# 206 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 228 "/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 253 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 263 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);









extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 296 "/usr/include/stdio.h" 3 4


extern FILE *fopen64 (__const char *__restrict __filename,
        __const char *__restrict __modes) ;
extern FILE *freopen64 (__const char *__restrict __filename,
   __const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, __const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     __const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, __const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         __const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       __const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
# 418 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 469 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 528 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 556 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 567 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 600 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;

# 646 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 662 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 723 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (__const char *__restrict __s,
      FILE *__restrict __stream);
# 734 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 770 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 789 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
# 812 "/usr/include/stdio.h" 3 4



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, __const fpos64_t *__pos);




extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (__const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];


extern int _sys_nerr;
extern __const char *__const _sys_errlist[];
# 851 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 870 "/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      __const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       __const char *__restrict __format,
       __gnuc_va_list __args)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 940 "/usr/include/stdio.h" 3 4

# 69 "cairoint.h" 2

# 1 "cairo.h" 1
# 41 "cairo.h"
# 1 "cairo-version.h" 1
# 42 "cairo.h" 2
# 1 "cairo-features.h" 1
# 43 "cairo.h" 2
# 1 "cairo-deprecated.h" 1
# 44 "cairo.h" 2
# 61 "cairo.h"

# 85 "cairo.h"
 int
cairo_version (void);

 const char*
cairo_version_string (void);
# 107 "cairo.h"
typedef int cairo_bool_t;
# 124 "cairo.h"
typedef struct _cairo cairo_t;
# 153 "cairo.h"
typedef struct _cairo_surface cairo_surface_t;
# 171 "cairo.h"
typedef struct _cairo_device cairo_device_t;
# 192 "cairo.h"
typedef struct _cairo_matrix {
    double xx; double yx;
    double xy; double yy;
    double x0; double y0;
} cairo_matrix_t;
# 220 "cairo.h"
typedef struct _cairo_pattern cairo_pattern_t;
# 232 "cairo.h"
typedef void (*cairo_destroy_func_t) (void *data);
# 246 "cairo.h"
typedef struct _cairo_user_data_key {
    int unused;
} cairo_user_data_key_t;
# 308 "cairo.h"
typedef enum _cairo_status {
    CAIRO_STATUS_SUCCESS = 0,

    CAIRO_STATUS_NO_MEMORY,
    CAIRO_STATUS_INVALID_RESTORE,
    CAIRO_STATUS_INVALID_POP_GROUP,
    CAIRO_STATUS_NO_CURRENT_POINT,
    CAIRO_STATUS_INVALID_MATRIX,
    CAIRO_STATUS_INVALID_STATUS,
    CAIRO_STATUS_NULL_POINTER,
    CAIRO_STATUS_INVALID_STRING,
    CAIRO_STATUS_INVALID_PATH_DATA,
    CAIRO_STATUS_READ_ERROR,
    CAIRO_STATUS_WRITE_ERROR,
    CAIRO_STATUS_SURFACE_FINISHED,
    CAIRO_STATUS_SURFACE_TYPE_MISMATCH,
    CAIRO_STATUS_PATTERN_TYPE_MISMATCH,
    CAIRO_STATUS_INVALID_CONTENT,
    CAIRO_STATUS_INVALID_FORMAT,
    CAIRO_STATUS_INVALID_VISUAL,
    CAIRO_STATUS_FILE_NOT_FOUND,
    CAIRO_STATUS_INVALID_DASH,
    CAIRO_STATUS_INVALID_DSC_COMMENT,
    CAIRO_STATUS_INVALID_INDEX,
    CAIRO_STATUS_CLIP_NOT_REPRESENTABLE,
    CAIRO_STATUS_TEMP_FILE_ERROR,
    CAIRO_STATUS_INVALID_STRIDE,
    CAIRO_STATUS_FONT_TYPE_MISMATCH,
    CAIRO_STATUS_USER_FONT_IMMUTABLE,
    CAIRO_STATUS_USER_FONT_ERROR,
    CAIRO_STATUS_NEGATIVE_COUNT,
    CAIRO_STATUS_INVALID_CLUSTERS,
    CAIRO_STATUS_INVALID_SLANT,
    CAIRO_STATUS_INVALID_WEIGHT,
    CAIRO_STATUS_INVALID_SIZE,
    CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED,
    CAIRO_STATUS_DEVICE_TYPE_MISMATCH,
    CAIRO_STATUS_DEVICE_ERROR,
    CAIRO_STATUS_INVALID_MESH_CONSTRUCTION,
    CAIRO_STATUS_DEVICE_FINISHED,

    CAIRO_STATUS_LAST_STATUS
} cairo_status_t;
# 368 "cairo.h"
typedef enum _cairo_content {
    CAIRO_CONTENT_COLOR = 0x1000,
    CAIRO_CONTENT_ALPHA = 0x2000,
    CAIRO_CONTENT_COLOR_ALPHA = 0x3000
} cairo_content_t;
# 405 "cairo.h"
typedef enum _cairo_format {
    CAIRO_FORMAT_INVALID = -1,
    CAIRO_FORMAT_ARGB32 = 0,
    CAIRO_FORMAT_RGB24 = 1,
    CAIRO_FORMAT_A8 = 2,
    CAIRO_FORMAT_A1 = 3,
    CAIRO_FORMAT_RGB16_565 = 4,
    CAIRO_FORMAT_RGB30 = 5
} cairo_format_t;
# 434 "cairo.h"
typedef cairo_status_t (*cairo_write_func_t) (void *closure,
           const unsigned char *data,
           unsigned int length);
# 456 "cairo.h"
typedef cairo_status_t (*cairo_read_func_t) (void *closure,
          unsigned char *data,
          unsigned int length);
# 472 "cairo.h"
typedef struct _cairo_rectangle_int {
    int x, y;
    int width, height;
} cairo_rectangle_int_t;



 cairo_t *
cairo_create (cairo_surface_t *target);

 cairo_t *
cairo_reference (cairo_t *cr);

 void
cairo_destroy (cairo_t *cr);

 unsigned int
cairo_get_reference_count (cairo_t *cr);

 void *
cairo_get_user_data (cairo_t *cr,
       const cairo_user_data_key_t *key);

 cairo_status_t
cairo_set_user_data (cairo_t *cr,
       const cairo_user_data_key_t *key,
       void *user_data,
       cairo_destroy_func_t destroy);

 void
cairo_save (cairo_t *cr);

 void
cairo_restore (cairo_t *cr);

 void
cairo_push_group (cairo_t *cr);

 void
cairo_push_group_with_content (cairo_t *cr, cairo_content_t content);

 cairo_pattern_t *
cairo_pop_group (cairo_t *cr);

 void
cairo_pop_group_to_source (cairo_t *cr);
# 602 "cairo.h"
typedef enum _cairo_operator {
    CAIRO_OPERATOR_CLEAR,

    CAIRO_OPERATOR_SOURCE,
    CAIRO_OPERATOR_OVER,
    CAIRO_OPERATOR_IN,
    CAIRO_OPERATOR_OUT,
    CAIRO_OPERATOR_ATOP,

    CAIRO_OPERATOR_DEST,
    CAIRO_OPERATOR_DEST_OVER,
    CAIRO_OPERATOR_DEST_IN,
    CAIRO_OPERATOR_DEST_OUT,
    CAIRO_OPERATOR_DEST_ATOP,

    CAIRO_OPERATOR_XOR,
    CAIRO_OPERATOR_ADD,
    CAIRO_OPERATOR_SATURATE,

    CAIRO_OPERATOR_MULTIPLY,
    CAIRO_OPERATOR_SCREEN,
    CAIRO_OPERATOR_OVERLAY,
    CAIRO_OPERATOR_DARKEN,
    CAIRO_OPERATOR_LIGHTEN,
    CAIRO_OPERATOR_COLOR_DODGE,
    CAIRO_OPERATOR_COLOR_BURN,
    CAIRO_OPERATOR_HARD_LIGHT,
    CAIRO_OPERATOR_SOFT_LIGHT,
    CAIRO_OPERATOR_DIFFERENCE,
    CAIRO_OPERATOR_EXCLUSION,
    CAIRO_OPERATOR_HSL_HUE,
    CAIRO_OPERATOR_HSL_SATURATION,
    CAIRO_OPERATOR_HSL_COLOR,
    CAIRO_OPERATOR_HSL_LUMINOSITY
} cairo_operator_t;

 void
cairo_set_operator (cairo_t *cr, cairo_operator_t op);

 void
cairo_set_source (cairo_t *cr, cairo_pattern_t *source);

 void
cairo_set_source_rgb (cairo_t *cr, double red, double green, double blue);

 void
cairo_set_source_rgba (cairo_t *cr,
         double red, double green, double blue,
         double alpha);

 void
cairo_set_source_surface (cairo_t *cr,
     cairo_surface_t *surface,
     double x,
     double y);

 void
cairo_set_tolerance (cairo_t *cr, double tolerance);
# 698 "cairo.h"
typedef enum _cairo_antialias {
    CAIRO_ANTIALIAS_DEFAULT,


    CAIRO_ANTIALIAS_NONE,
    CAIRO_ANTIALIAS_GRAY,
    CAIRO_ANTIALIAS_SUBPIXEL,


    CAIRO_ANTIALIAS_FAST,
    CAIRO_ANTIALIAS_GOOD,
    CAIRO_ANTIALIAS_BEST
} cairo_antialias_t;

 void
cairo_set_antialias (cairo_t *cr, cairo_antialias_t antialias);
# 742 "cairo.h"
typedef enum _cairo_fill_rule {
    CAIRO_FILL_RULE_WINDING,
    CAIRO_FILL_RULE_EVEN_ODD
} cairo_fill_rule_t;

 void
cairo_set_fill_rule (cairo_t *cr, cairo_fill_rule_t fill_rule);

 void
cairo_set_line_width (cairo_t *cr, double width);
# 765 "cairo.h"
typedef enum _cairo_line_cap {
    CAIRO_LINE_CAP_BUTT,
    CAIRO_LINE_CAP_ROUND,
    CAIRO_LINE_CAP_SQUARE
} cairo_line_cap_t;

 void
cairo_set_line_cap (cairo_t *cr, cairo_line_cap_t line_cap);
# 789 "cairo.h"
typedef enum _cairo_line_join {
    CAIRO_LINE_JOIN_MITER,
    CAIRO_LINE_JOIN_ROUND,
    CAIRO_LINE_JOIN_BEVEL
} cairo_line_join_t;

 void
cairo_set_line_join (cairo_t *cr, cairo_line_join_t line_join);

 void
cairo_set_dash (cairo_t *cr,
  const double *dashes,
  int num_dashes,
  double offset);

 void
cairo_set_miter_limit (cairo_t *cr, double limit);

 void
cairo_translate (cairo_t *cr, double tx, double ty);

 void
cairo_scale (cairo_t *cr, double sx, double sy);

 void
cairo_rotate (cairo_t *cr, double angle);

 void
cairo_transform (cairo_t *cr,
   const cairo_matrix_t *matrix);

 void
cairo_set_matrix (cairo_t *cr,
    const cairo_matrix_t *matrix);

 void
cairo_identity_matrix (cairo_t *cr);

 void
cairo_user_to_device (cairo_t *cr, double *x, double *y);

 void
cairo_user_to_device_distance (cairo_t *cr, double *dx, double *dy);

 void
cairo_device_to_user (cairo_t *cr, double *x, double *y);

 void
cairo_device_to_user_distance (cairo_t *cr, double *dx, double *dy);


 void
cairo_new_path (cairo_t *cr);

 void
cairo_move_to (cairo_t *cr, double x, double y);

 void
cairo_new_sub_path (cairo_t *cr);

 void
cairo_line_to (cairo_t *cr, double x, double y);

 void
cairo_curve_to (cairo_t *cr,
  double x1, double y1,
  double x2, double y2,
  double x3, double y3);

 void
cairo_arc (cairo_t *cr,
    double xc, double yc,
    double radius,
    double angle1, double angle2);

 void
cairo_arc_negative (cairo_t *cr,
      double xc, double yc,
      double radius,
      double angle1, double angle2);
# 878 "cairo.h"
 void
cairo_rel_move_to (cairo_t *cr, double dx, double dy);

 void
cairo_rel_line_to (cairo_t *cr, double dx, double dy);

 void
cairo_rel_curve_to (cairo_t *cr,
      double dx1, double dy1,
      double dx2, double dy2,
      double dx3, double dy3);

 void
cairo_rectangle (cairo_t *cr,
   double x, double y,
   double width, double height);






 void
cairo_close_path (cairo_t *cr);

 void
cairo_path_extents (cairo_t *cr,
      double *x1, double *y1,
      double *x2, double *y2);


 void
cairo_paint (cairo_t *cr);

 void
cairo_paint_with_alpha (cairo_t *cr,
   double alpha);

 void
cairo_mask (cairo_t *cr,
     cairo_pattern_t *pattern);

 void
cairo_mask_surface (cairo_t *cr,
      cairo_surface_t *surface,
      double surface_x,
      double surface_y);

 void
cairo_stroke (cairo_t *cr);

 void
cairo_stroke_preserve (cairo_t *cr);

 void
cairo_fill (cairo_t *cr);

 void
cairo_fill_preserve (cairo_t *cr);

 void
cairo_copy_page (cairo_t *cr);

 void
cairo_show_page (cairo_t *cr);


 cairo_bool_t
cairo_in_stroke (cairo_t *cr, double x, double y);

 cairo_bool_t
cairo_in_fill (cairo_t *cr, double x, double y);

 cairo_bool_t
cairo_in_clip (cairo_t *cr, double x, double y);


 void
cairo_stroke_extents (cairo_t *cr,
        double *x1, double *y1,
        double *x2, double *y2);

 void
cairo_fill_extents (cairo_t *cr,
      double *x1, double *y1,
      double *x2, double *y2);


 void
cairo_reset_clip (cairo_t *cr);

 void
cairo_clip (cairo_t *cr);

 void
cairo_clip_preserve (cairo_t *cr);

 void
cairo_clip_extents (cairo_t *cr,
      double *x1, double *y1,
      double *x2, double *y2);
# 991 "cairo.h"
typedef struct _cairo_rectangle {
    double x, y, width, height;
} cairo_rectangle_t;
# 1006 "cairo.h"
typedef struct _cairo_rectangle_list {
    cairo_status_t status;
    cairo_rectangle_t *rectangles;
    int num_rectangles;
} cairo_rectangle_list_t;

 cairo_rectangle_list_t *
cairo_copy_clip_rectangle_list (cairo_t *cr);

 void
cairo_rectangle_list_destroy (cairo_rectangle_list_t *rectangle_list);
# 1037 "cairo.h"
typedef struct _cairo_scaled_font cairo_scaled_font_t;
# 1058 "cairo.h"
typedef struct _cairo_font_face cairo_font_face_t;
# 1086 "cairo.h"
typedef struct {
    unsigned long index;
    double x;
    double y;
} cairo_glyph_t;

 cairo_glyph_t *
cairo_glyph_allocate (int num_glyphs);

 void
cairo_glyph_free (cairo_glyph_t *glyphs);
# 1118 "cairo.h"
typedef struct {
    int num_bytes;
    int num_glyphs;
} cairo_text_cluster_t;

 cairo_text_cluster_t *
cairo_text_cluster_allocate (int num_clusters);

 void
cairo_text_cluster_free (cairo_text_cluster_t *clusters);
# 1138 "cairo.h"
typedef enum _cairo_text_cluster_flags {
    CAIRO_TEXT_CLUSTER_FLAG_BACKWARD = 0x00000001
} cairo_text_cluster_flags_t;
# 1171 "cairo.h"
typedef struct {
    double x_bearing;
    double y_bearing;
    double width;
    double height;
    double x_advance;
    double y_advance;
} cairo_text_extents_t;
# 1223 "cairo.h"
typedef struct {
    double ascent;
    double descent;
    double height;
    double max_x_advance;
    double max_y_advance;
} cairo_font_extents_t;
# 1241 "cairo.h"
typedef enum _cairo_font_slant {
    CAIRO_FONT_SLANT_NORMAL,
    CAIRO_FONT_SLANT_ITALIC,
    CAIRO_FONT_SLANT_OBLIQUE
} cairo_font_slant_t;
# 1256 "cairo.h"
typedef enum _cairo_font_weight {
    CAIRO_FONT_WEIGHT_NORMAL,
    CAIRO_FONT_WEIGHT_BOLD
} cairo_font_weight_t;
# 1280 "cairo.h"
typedef enum _cairo_subpixel_order {
    CAIRO_SUBPIXEL_ORDER_DEFAULT,
    CAIRO_SUBPIXEL_ORDER_RGB,
    CAIRO_SUBPIXEL_ORDER_BGR,
    CAIRO_SUBPIXEL_ORDER_VRGB,
    CAIRO_SUBPIXEL_ORDER_VBGR
} cairo_subpixel_order_t;
# 1312 "cairo.h"
typedef enum _cairo_hint_style {
    CAIRO_HINT_STYLE_DEFAULT,
    CAIRO_HINT_STYLE_NONE,
    CAIRO_HINT_STYLE_SLIGHT,
    CAIRO_HINT_STYLE_MEDIUM,
    CAIRO_HINT_STYLE_FULL
} cairo_hint_style_t;
# 1335 "cairo.h"
typedef enum _cairo_hint_metrics {
    CAIRO_HINT_METRICS_DEFAULT,
    CAIRO_HINT_METRICS_OFF,
    CAIRO_HINT_METRICS_ON
} cairo_hint_metrics_t;
# 1363 "cairo.h"
typedef struct _cairo_font_options cairo_font_options_t;

 cairo_font_options_t *
cairo_font_options_create (void);

 cairo_font_options_t *
cairo_font_options_copy (const cairo_font_options_t *original);

 void
cairo_font_options_destroy (cairo_font_options_t *options);

 cairo_status_t
cairo_font_options_status (cairo_font_options_t *options);

 void
cairo_font_options_merge (cairo_font_options_t *options,
     const cairo_font_options_t *other);
 cairo_bool_t
cairo_font_options_equal (const cairo_font_options_t *options,
     const cairo_font_options_t *other);

 unsigned long
cairo_font_options_hash (const cairo_font_options_t *options);

 void
cairo_font_options_set_antialias (cairo_font_options_t *options,
      cairo_antialias_t antialias);
 cairo_antialias_t
cairo_font_options_get_antialias (const cairo_font_options_t *options);

 void
cairo_font_options_set_subpixel_order (cairo_font_options_t *options,
           cairo_subpixel_order_t subpixel_order);
 cairo_subpixel_order_t
cairo_font_options_get_subpixel_order (const cairo_font_options_t *options);

 void
cairo_font_options_set_hint_style (cairo_font_options_t *options,
       cairo_hint_style_t hint_style);
 cairo_hint_style_t
cairo_font_options_get_hint_style (const cairo_font_options_t *options);

 void
cairo_font_options_set_hint_metrics (cairo_font_options_t *options,
         cairo_hint_metrics_t hint_metrics);
 cairo_hint_metrics_t
cairo_font_options_get_hint_metrics (const cairo_font_options_t *options);




 void
cairo_select_font_face (cairo_t *cr,
   const char *family,
   cairo_font_slant_t slant,
   cairo_font_weight_t weight);

 void
cairo_set_font_size (cairo_t *cr, double size);

 void
cairo_set_font_matrix (cairo_t *cr,
         const cairo_matrix_t *matrix);

 void
cairo_get_font_matrix (cairo_t *cr,
         cairo_matrix_t *matrix);

 void
cairo_set_font_options (cairo_t *cr,
   const cairo_font_options_t *options);

 void
cairo_get_font_options (cairo_t *cr,
   cairo_font_options_t *options);

 void
cairo_set_font_face (cairo_t *cr, cairo_font_face_t *font_face);

 cairo_font_face_t *
cairo_get_font_face (cairo_t *cr);

 void
cairo_set_scaled_font (cairo_t *cr,
         const cairo_scaled_font_t *scaled_font);

 cairo_scaled_font_t *
cairo_get_scaled_font (cairo_t *cr);

 void
cairo_show_text (cairo_t *cr, const char *utf8);

 void
cairo_show_glyphs (cairo_t *cr, const cairo_glyph_t *glyphs, int num_glyphs);

 void
cairo_show_text_glyphs (cairo_t *cr,
   const char *utf8,
   int utf8_len,
   const cairo_glyph_t *glyphs,
   int num_glyphs,
   const cairo_text_cluster_t *clusters,
   int num_clusters,
   cairo_text_cluster_flags_t cluster_flags);

 void
cairo_text_path (cairo_t *cr, const char *utf8);

 void
cairo_glyph_path (cairo_t *cr, const cairo_glyph_t *glyphs, int num_glyphs);

 void
cairo_text_extents (cairo_t *cr,
      const char *utf8,
      cairo_text_extents_t *extents);

 void
cairo_glyph_extents (cairo_t *cr,
       const cairo_glyph_t *glyphs,
       int num_glyphs,
       cairo_text_extents_t *extents);

 void
cairo_font_extents (cairo_t *cr,
      cairo_font_extents_t *extents);



 cairo_font_face_t *
cairo_font_face_reference (cairo_font_face_t *font_face);

 void
cairo_font_face_destroy (cairo_font_face_t *font_face);

 unsigned int
cairo_font_face_get_reference_count (cairo_font_face_t *font_face);

 cairo_status_t
cairo_font_face_status (cairo_font_face_t *font_face);
# 1543 "cairo.h"
typedef enum _cairo_font_type {
    CAIRO_FONT_TYPE_TOY,
    CAIRO_FONT_TYPE_FT,
    CAIRO_FONT_TYPE_WIN32,
    CAIRO_FONT_TYPE_QUARTZ,
    CAIRO_FONT_TYPE_USER
} cairo_font_type_t;

 cairo_font_type_t
cairo_font_face_get_type (cairo_font_face_t *font_face);

 void *
cairo_font_face_get_user_data (cairo_font_face_t *font_face,
          const cairo_user_data_key_t *key);

 cairo_status_t
cairo_font_face_set_user_data (cairo_font_face_t *font_face,
          const cairo_user_data_key_t *key,
          void *user_data,
          cairo_destroy_func_t destroy);



 cairo_scaled_font_t *
cairo_scaled_font_create (cairo_font_face_t *font_face,
     const cairo_matrix_t *font_matrix,
     const cairo_matrix_t *ctm,
     const cairo_font_options_t *options);

 cairo_scaled_font_t *
cairo_scaled_font_reference (cairo_scaled_font_t *scaled_font);

 void
cairo_scaled_font_destroy (cairo_scaled_font_t *scaled_font);

 unsigned int
cairo_scaled_font_get_reference_count (cairo_scaled_font_t *scaled_font);

 cairo_status_t
cairo_scaled_font_status (cairo_scaled_font_t *scaled_font);

 cairo_font_type_t
cairo_scaled_font_get_type (cairo_scaled_font_t *scaled_font);

 void *
cairo_scaled_font_get_user_data (cairo_scaled_font_t *scaled_font,
     const cairo_user_data_key_t *key);

 cairo_status_t
cairo_scaled_font_set_user_data (cairo_scaled_font_t *scaled_font,
     const cairo_user_data_key_t *key,
     void *user_data,
     cairo_destroy_func_t destroy);

 void
cairo_scaled_font_extents (cairo_scaled_font_t *scaled_font,
      cairo_font_extents_t *extents);

 void
cairo_scaled_font_text_extents (cairo_scaled_font_t *scaled_font,
    const char *utf8,
    cairo_text_extents_t *extents);

 void
cairo_scaled_font_glyph_extents (cairo_scaled_font_t *scaled_font,
     const cairo_glyph_t *glyphs,
     int num_glyphs,
     cairo_text_extents_t *extents);

 cairo_status_t
cairo_scaled_font_text_to_glyphs (cairo_scaled_font_t *scaled_font,
      double x,
      double y,
      const char *utf8,
      int utf8_len,
      cairo_glyph_t **glyphs,
      int *num_glyphs,
      cairo_text_cluster_t **clusters,
      int *num_clusters,
      cairo_text_cluster_flags_t *cluster_flags);

 cairo_font_face_t *
cairo_scaled_font_get_font_face (cairo_scaled_font_t *scaled_font);

 void
cairo_scaled_font_get_font_matrix (cairo_scaled_font_t *scaled_font,
       cairo_matrix_t *font_matrix);

 void
cairo_scaled_font_get_ctm (cairo_scaled_font_t *scaled_font,
      cairo_matrix_t *ctm);

 void
cairo_scaled_font_get_scale_matrix (cairo_scaled_font_t *scaled_font,
        cairo_matrix_t *scale_matrix);

 void
cairo_scaled_font_get_font_options (cairo_scaled_font_t *scaled_font,
        cairo_font_options_t *options);




 cairo_font_face_t *
cairo_toy_font_face_create (const char *family,
       cairo_font_slant_t slant,
       cairo_font_weight_t weight);

 const char *
cairo_toy_font_face_get_family (cairo_font_face_t *font_face);

 cairo_font_slant_t
cairo_toy_font_face_get_slant (cairo_font_face_t *font_face);

 cairo_font_weight_t
cairo_toy_font_face_get_weight (cairo_font_face_t *font_face);




 cairo_font_face_t *
cairo_user_font_face_create (void);
# 1700 "cairo.h"
typedef cairo_status_t (*cairo_user_scaled_font_init_func_t) (cairo_scaled_font_t *scaled_font,
             cairo_t *cr,
             cairo_font_extents_t *extents);
# 1747 "cairo.h"
typedef cairo_status_t (*cairo_user_scaled_font_render_glyph_func_t) (cairo_scaled_font_t *scaled_font,
              unsigned long glyph,
              cairo_t *cr,
              cairo_text_extents_t *extents);
# 1817 "cairo.h"
typedef cairo_status_t (*cairo_user_scaled_font_text_to_glyphs_func_t) (cairo_scaled_font_t *scaled_font,
         const char *utf8,
         int utf8_len,
         cairo_glyph_t **glyphs,
         int *num_glyphs,
         cairo_text_cluster_t **clusters,
         int *num_clusters,
         cairo_text_cluster_flags_t *cluster_flags);
# 1864 "cairo.h"
typedef cairo_status_t (*cairo_user_scaled_font_unicode_to_glyph_func_t) (cairo_scaled_font_t *scaled_font,
           unsigned long unicode,
           unsigned long *glyph_index);



 void
cairo_user_font_face_set_init_func (cairo_font_face_t *font_face,
        cairo_user_scaled_font_init_func_t init_func);

 void
cairo_user_font_face_set_render_glyph_func (cairo_font_face_t *font_face,
         cairo_user_scaled_font_render_glyph_func_t render_glyph_func);

 void
cairo_user_font_face_set_text_to_glyphs_func (cairo_font_face_t *font_face,
           cairo_user_scaled_font_text_to_glyphs_func_t text_to_glyphs_func);

 void
cairo_user_font_face_set_unicode_to_glyph_func (cairo_font_face_t *font_face,
             cairo_user_scaled_font_unicode_to_glyph_func_t unicode_to_glyph_func);



 cairo_user_scaled_font_init_func_t
cairo_user_font_face_get_init_func (cairo_font_face_t *font_face);

 cairo_user_scaled_font_render_glyph_func_t
cairo_user_font_face_get_render_glyph_func (cairo_font_face_t *font_face);

 cairo_user_scaled_font_text_to_glyphs_func_t
cairo_user_font_face_get_text_to_glyphs_func (cairo_font_face_t *font_face);

 cairo_user_scaled_font_unicode_to_glyph_func_t
cairo_user_font_face_get_unicode_to_glyph_func (cairo_font_face_t *font_face);




 cairo_operator_t
cairo_get_operator (cairo_t *cr);

 cairo_pattern_t *
cairo_get_source (cairo_t *cr);

 double
cairo_get_tolerance (cairo_t *cr);

 cairo_antialias_t
cairo_get_antialias (cairo_t *cr);

 cairo_bool_t
cairo_has_current_point (cairo_t *cr);

 void
cairo_get_current_point (cairo_t *cr, double *x, double *y);

 cairo_fill_rule_t
cairo_get_fill_rule (cairo_t *cr);

 double
cairo_get_line_width (cairo_t *cr);

 cairo_line_cap_t
cairo_get_line_cap (cairo_t *cr);

 cairo_line_join_t
cairo_get_line_join (cairo_t *cr);

 double
cairo_get_miter_limit (cairo_t *cr);

 int
cairo_get_dash_count (cairo_t *cr);

 void
cairo_get_dash (cairo_t *cr, double *dashes, double *offset);

 void
cairo_get_matrix (cairo_t *cr, cairo_matrix_t *matrix);

 cairo_surface_t *
cairo_get_target (cairo_t *cr);

 cairo_surface_t *
cairo_get_group_target (cairo_t *cr);
# 1964 "cairo.h"
typedef enum _cairo_path_data_type {
    CAIRO_PATH_MOVE_TO,
    CAIRO_PATH_LINE_TO,
    CAIRO_PATH_CURVE_TO,
    CAIRO_PATH_CLOSE_PATH
} cairo_path_data_type_t;
# 2039 "cairo.h"
typedef union _cairo_path_data_t cairo_path_data_t;
union _cairo_path_data_t {
    struct {
 cairo_path_data_type_t type;
 int length;
    } header;
    struct {
 double x, y;
    } point;
};
# 2071 "cairo.h"
typedef struct cairo_path {
    cairo_status_t status;
    cairo_path_data_t *data;
    int num_data;
} cairo_path_t;

 cairo_path_t *
cairo_copy_path (cairo_t *cr);

 cairo_path_t *
cairo_copy_path_flat (cairo_t *cr);

 void
cairo_append_path (cairo_t *cr,
     const cairo_path_t *path);

 void
cairo_path_destroy (cairo_path_t *path);



 cairo_status_t
cairo_status (cairo_t *cr);

 const char *
cairo_status_to_string (cairo_status_t status);



 cairo_device_t *
cairo_device_reference (cairo_device_t *device);
# 2134 "cairo.h"
typedef enum _cairo_device_type {
    CAIRO_DEVICE_TYPE_DRM,
    CAIRO_DEVICE_TYPE_GL,
    CAIRO_DEVICE_TYPE_SCRIPT,
    CAIRO_DEVICE_TYPE_XCB,
    CAIRO_DEVICE_TYPE_XLIB,
    CAIRO_DEVICE_TYPE_XML,
    CAIRO_DEVICE_TYPE_COGL,
    CAIRO_DEVICE_TYPE_WIN32,

    CAIRO_DEVICE_TYPE_INVALID = -1
} cairo_device_type_t;

 cairo_device_type_t
cairo_device_get_type (cairo_device_t *device);

 cairo_status_t
cairo_device_status (cairo_device_t *device);

 cairo_status_t
cairo_device_acquire (cairo_device_t *device);

 void
cairo_device_release (cairo_device_t *device);

 void
cairo_device_flush (cairo_device_t *device);

 void
cairo_device_finish (cairo_device_t *device);

 void
cairo_device_destroy (cairo_device_t *device);

 unsigned int
cairo_device_get_reference_count (cairo_device_t *device);

 void *
cairo_device_get_user_data (cairo_device_t *device,
       const cairo_user_data_key_t *key);

 cairo_status_t
cairo_device_set_user_data (cairo_device_t *device,
       const cairo_user_data_key_t *key,
       void *user_data,
       cairo_destroy_func_t destroy);




 cairo_surface_t *
cairo_surface_create_similar (cairo_surface_t *other,
         cairo_content_t content,
         int width,
         int height);

 cairo_surface_t *
cairo_surface_create_similar_image (cairo_surface_t *other,
        cairo_format_t format,
        int width,
        int height);

 cairo_surface_t *
cairo_surface_map_to_image (cairo_surface_t *surface,
       const cairo_rectangle_int_t *extents);

 void
cairo_surface_unmap_image (cairo_surface_t *surface,
      cairo_surface_t *image);

 cairo_surface_t *
cairo_surface_create_for_rectangle (cairo_surface_t *target,
                                    double x,
                                    double y,
                                    double width,
                                    double height);

typedef enum {
 CAIRO_SURFACE_OBSERVER_NORMAL = 0,
 CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS = 0x1
} cairo_surface_observer_mode_t;

 cairo_surface_t *
cairo_surface_create_observer (cairo_surface_t *target,
          cairo_surface_observer_mode_t mode);

typedef void (*cairo_surface_observer_callback_t) (cairo_surface_t *observer,
         cairo_surface_t *target,
         void *data);

 cairo_status_t
cairo_surface_observer_add_paint_callback (cairo_surface_t *abstract_surface,
        cairo_surface_observer_callback_t func,
        void *data);

 cairo_status_t
cairo_surface_observer_add_mask_callback (cairo_surface_t *abstract_surface,
       cairo_surface_observer_callback_t func,
       void *data);

 cairo_status_t
cairo_surface_observer_add_fill_callback (cairo_surface_t *abstract_surface,
       cairo_surface_observer_callback_t func,
       void *data);

 cairo_status_t
cairo_surface_observer_add_stroke_callback (cairo_surface_t *abstract_surface,
         cairo_surface_observer_callback_t func,
         void *data);

 cairo_status_t
cairo_surface_observer_add_glyphs_callback (cairo_surface_t *abstract_surface,
         cairo_surface_observer_callback_t func,
         void *data);

 cairo_status_t
cairo_surface_observer_add_flush_callback (cairo_surface_t *abstract_surface,
        cairo_surface_observer_callback_t func,
        void *data);

 cairo_status_t
cairo_surface_observer_add_finish_callback (cairo_surface_t *abstract_surface,
         cairo_surface_observer_callback_t func,
         void *data);

 cairo_status_t
cairo_surface_observer_print (cairo_surface_t *surface,
         cairo_write_func_t write_func,
         void *closure);
 double
cairo_surface_observer_elapsed (cairo_surface_t *surface);

 cairo_status_t
cairo_device_observer_print (cairo_device_t *device,
        cairo_write_func_t write_func,
        void *closure);

 double
cairo_device_observer_elapsed (cairo_device_t *device);

 double
cairo_device_observer_paint_elapsed (cairo_device_t *device);

 double
cairo_device_observer_mask_elapsed (cairo_device_t *device);

 double
cairo_device_observer_fill_elapsed (cairo_device_t *device);

 double
cairo_device_observer_stroke_elapsed (cairo_device_t *device);

 double
cairo_device_observer_glyphs_elapsed (cairo_device_t *device);

 cairo_surface_t *
cairo_surface_reference (cairo_surface_t *surface);

 void
cairo_surface_finish (cairo_surface_t *surface);

 void
cairo_surface_destroy (cairo_surface_t *surface);

 cairo_device_t *
cairo_surface_get_device (cairo_surface_t *surface);

 unsigned int
cairo_surface_get_reference_count (cairo_surface_t *surface);

 cairo_status_t
cairo_surface_status (cairo_surface_t *surface);
# 2360 "cairo.h"
typedef enum _cairo_surface_type {
    CAIRO_SURFACE_TYPE_IMAGE,
    CAIRO_SURFACE_TYPE_PDF,
    CAIRO_SURFACE_TYPE_PS,
    CAIRO_SURFACE_TYPE_XLIB,
    CAIRO_SURFACE_TYPE_XCB,
    CAIRO_SURFACE_TYPE_GLITZ,
    CAIRO_SURFACE_TYPE_QUARTZ,
    CAIRO_SURFACE_TYPE_WIN32,
    CAIRO_SURFACE_TYPE_BEOS,
    CAIRO_SURFACE_TYPE_DIRECTFB,
    CAIRO_SURFACE_TYPE_SVG,
    CAIRO_SURFACE_TYPE_OS2,
    CAIRO_SURFACE_TYPE_WIN32_PRINTING,
    CAIRO_SURFACE_TYPE_QUARTZ_IMAGE,
    CAIRO_SURFACE_TYPE_SCRIPT,
    CAIRO_SURFACE_TYPE_QT,
    CAIRO_SURFACE_TYPE_RECORDING,
    CAIRO_SURFACE_TYPE_VG,
    CAIRO_SURFACE_TYPE_GL,
    CAIRO_SURFACE_TYPE_DRM,
    CAIRO_SURFACE_TYPE_TEE,
    CAIRO_SURFACE_TYPE_XML,
    CAIRO_SURFACE_TYPE_SKIA,
    CAIRO_SURFACE_TYPE_SUBSURFACE,
    CAIRO_SURFACE_TYPE_COGL
} cairo_surface_type_t;

 cairo_surface_type_t
cairo_surface_get_type (cairo_surface_t *surface);

 cairo_content_t
cairo_surface_get_content (cairo_surface_t *surface);



 cairo_status_t
cairo_surface_write_to_png (cairo_surface_t *surface,
       const char *filename);

 cairo_status_t
cairo_surface_write_to_png_stream (cairo_surface_t *surface,
       cairo_write_func_t write_func,
       void *closure);



 void *
cairo_surface_get_user_data (cairo_surface_t *surface,
        const cairo_user_data_key_t *key);

 cairo_status_t
cairo_surface_set_user_data (cairo_surface_t *surface,
        const cairo_user_data_key_t *key,
        void *user_data,
        cairo_destroy_func_t destroy);







 void
cairo_surface_get_mime_data (cairo_surface_t *surface,
                             const char *mime_type,
                             const unsigned char **data,
                             unsigned long *length);

 cairo_status_t
cairo_surface_set_mime_data (cairo_surface_t *surface,
                             const char *mime_type,
                             const unsigned char *data,
                             unsigned long length,
        cairo_destroy_func_t destroy,
        void *closure);

 cairo_bool_t
cairo_surface_supports_mime_type (cairo_surface_t *surface,
      const char *mime_type);

 void
cairo_surface_get_font_options (cairo_surface_t *surface,
    cairo_font_options_t *options);

 void
cairo_surface_flush (cairo_surface_t *surface);

 void
cairo_surface_mark_dirty (cairo_surface_t *surface);

 void
cairo_surface_mark_dirty_rectangle (cairo_surface_t *surface,
        int x,
        int y,
        int width,
        int height);

 void
cairo_surface_set_device_offset (cairo_surface_t *surface,
     double x_offset,
     double y_offset);

 void
cairo_surface_get_device_offset (cairo_surface_t *surface,
     double *x_offset,
     double *y_offset);

 void
cairo_surface_set_fallback_resolution (cairo_surface_t *surface,
           double x_pixels_per_inch,
           double y_pixels_per_inch);

 void
cairo_surface_get_fallback_resolution (cairo_surface_t *surface,
           double *x_pixels_per_inch,
           double *y_pixels_per_inch);

 void
cairo_surface_copy_page (cairo_surface_t *surface);

 void
cairo_surface_show_page (cairo_surface_t *surface);

 cairo_bool_t
cairo_surface_has_show_text_glyphs (cairo_surface_t *surface);



 cairo_surface_t *
cairo_image_surface_create (cairo_format_t format,
       int width,
       int height);

 int
cairo_format_stride_for_width (cairo_format_t format,
          int width);

 cairo_surface_t *
cairo_image_surface_create_for_data (unsigned char *data,
         cairo_format_t format,
         int width,
         int height,
         int stride);

 unsigned char *
cairo_image_surface_get_data (cairo_surface_t *surface);

 cairo_format_t
cairo_image_surface_get_format (cairo_surface_t *surface);

 int
cairo_image_surface_get_width (cairo_surface_t *surface);

 int
cairo_image_surface_get_height (cairo_surface_t *surface);

 int
cairo_image_surface_get_stride (cairo_surface_t *surface);



 cairo_surface_t *
cairo_image_surface_create_from_png (const char *filename);

 cairo_surface_t *
cairo_image_surface_create_from_png_stream (cairo_read_func_t read_func,
         void *closure);





 cairo_surface_t *
cairo_recording_surface_create (cairo_content_t content,
                                const cairo_rectangle_t *extents);

 void
cairo_recording_surface_ink_extents (cairo_surface_t *surface,
                                     double *x0,
                                     double *y0,
                                     double *width,
                                     double *height);

 cairo_bool_t
cairo_recording_surface_get_extents (cairo_surface_t *surface,
         cairo_rectangle_t *extents);
# 2574 "cairo.h"
typedef cairo_surface_t *
(*cairo_raster_source_acquire_func_t) (cairo_pattern_t *pattern,
           void *callback_data,
           cairo_surface_t *target,
           const cairo_rectangle_int_t *extents);
# 2593 "cairo.h"
typedef void
(*cairo_raster_source_release_func_t) (cairo_pattern_t *pattern,
           void *callback_data,
           cairo_surface_t *surface);
# 2614 "cairo.h"
typedef cairo_status_t
(*cairo_raster_source_snapshot_func_t) (cairo_pattern_t *pattern,
     void *callback_data);
# 2632 "cairo.h"
typedef cairo_status_t
(*cairo_raster_source_copy_func_t) (cairo_pattern_t *pattern,
        void *callback_data,
        const cairo_pattern_t *other);
# 2647 "cairo.h"
typedef void
(*cairo_raster_source_finish_func_t) (cairo_pattern_t *pattern,
          void *callback_data);

 cairo_pattern_t *
cairo_pattern_create_raster_source (void *user_data,
        cairo_content_t content,
        int width, int height);

 void
cairo_raster_source_pattern_set_callback_data (cairo_pattern_t *pattern,
            void *data);

 void *
cairo_raster_source_pattern_get_callback_data (cairo_pattern_t *pattern);

 void
cairo_raster_source_pattern_set_acquire (cairo_pattern_t *pattern,
      cairo_raster_source_acquire_func_t acquire,
      cairo_raster_source_release_func_t release);

 void
cairo_raster_source_pattern_get_acquire (cairo_pattern_t *pattern,
      cairo_raster_source_acquire_func_t *acquire,
      cairo_raster_source_release_func_t *release);
 void
cairo_raster_source_pattern_set_snapshot (cairo_pattern_t *pattern,
       cairo_raster_source_snapshot_func_t snapshot);

 cairo_raster_source_snapshot_func_t
cairo_raster_source_pattern_get_snapshot (cairo_pattern_t *pattern);

 void
cairo_raster_source_pattern_set_copy (cairo_pattern_t *pattern,
          cairo_raster_source_copy_func_t copy);

 cairo_raster_source_copy_func_t
cairo_raster_source_pattern_get_copy (cairo_pattern_t *pattern);

 void
cairo_raster_source_pattern_set_finish (cairo_pattern_t *pattern,
     cairo_raster_source_finish_func_t finish);

 cairo_raster_source_finish_func_t
cairo_raster_source_pattern_get_finish (cairo_pattern_t *pattern);



 cairo_pattern_t *
cairo_pattern_create_rgb (double red, double green, double blue);

 cairo_pattern_t *
cairo_pattern_create_rgba (double red, double green, double blue,
      double alpha);

 cairo_pattern_t *
cairo_pattern_create_for_surface (cairo_surface_t *surface);

 cairo_pattern_t *
cairo_pattern_create_linear (double x0, double y0,
        double x1, double y1);

 cairo_pattern_t *
cairo_pattern_create_radial (double cx0, double cy0, double radius0,
        double cx1, double cy1, double radius1);

 cairo_pattern_t *
cairo_pattern_create_mesh (void);

 cairo_pattern_t *
cairo_pattern_reference (cairo_pattern_t *pattern);

 void
cairo_pattern_destroy (cairo_pattern_t *pattern);

 unsigned int
cairo_pattern_get_reference_count (cairo_pattern_t *pattern);

 cairo_status_t
cairo_pattern_status (cairo_pattern_t *pattern);

 void *
cairo_pattern_get_user_data (cairo_pattern_t *pattern,
        const cairo_user_data_key_t *key);

 cairo_status_t
cairo_pattern_set_user_data (cairo_pattern_t *pattern,
        const cairo_user_data_key_t *key,
        void *user_data,
        cairo_destroy_func_t destroy);
# 2770 "cairo.h"
typedef enum _cairo_pattern_type {
    CAIRO_PATTERN_TYPE_SOLID,
    CAIRO_PATTERN_TYPE_SURFACE,
    CAIRO_PATTERN_TYPE_LINEAR,
    CAIRO_PATTERN_TYPE_RADIAL,
    CAIRO_PATTERN_TYPE_MESH,
    CAIRO_PATTERN_TYPE_RASTER_SOURCE
} cairo_pattern_type_t;

 cairo_pattern_type_t
cairo_pattern_get_type (cairo_pattern_t *pattern);

 void
cairo_pattern_add_color_stop_rgb (cairo_pattern_t *pattern,
      double offset,
      double red, double green, double blue);

 void
cairo_pattern_add_color_stop_rgba (cairo_pattern_t *pattern,
       double offset,
       double red, double green, double blue,
       double alpha);

 void
cairo_mesh_pattern_begin_patch (cairo_pattern_t *pattern);

 void
cairo_mesh_pattern_end_patch (cairo_pattern_t *pattern);

 void
cairo_mesh_pattern_curve_to (cairo_pattern_t *pattern,
        double x1, double y1,
        double x2, double y2,
        double x3, double y3);

 void
cairo_mesh_pattern_line_to (cairo_pattern_t *pattern,
       double x, double y);

 void
cairo_mesh_pattern_move_to (cairo_pattern_t *pattern,
       double x, double y);

 void
cairo_mesh_pattern_set_control_point (cairo_pattern_t *pattern,
          unsigned int point_num,
          double x, double y);

 void
cairo_mesh_pattern_set_corner_color_rgb (cairo_pattern_t *pattern,
      unsigned int corner_num,
      double red, double green, double blue);

 void
cairo_mesh_pattern_set_corner_color_rgba (cairo_pattern_t *pattern,
       unsigned int corner_num,
       double red, double green, double blue,
       double alpha);

 void
cairo_pattern_set_matrix (cairo_pattern_t *pattern,
     const cairo_matrix_t *matrix);

 void
cairo_pattern_get_matrix (cairo_pattern_t *pattern,
     cairo_matrix_t *matrix);
# 2862 "cairo.h"
typedef enum _cairo_extend {
    CAIRO_EXTEND_NONE,
    CAIRO_EXTEND_REPEAT,
    CAIRO_EXTEND_REFLECT,
    CAIRO_EXTEND_PAD
} cairo_extend_t;

 void
cairo_pattern_set_extend (cairo_pattern_t *pattern, cairo_extend_t extend);

 cairo_extend_t
cairo_pattern_get_extend (cairo_pattern_t *pattern);
# 2895 "cairo.h"
typedef enum _cairo_filter {
    CAIRO_FILTER_FAST,
    CAIRO_FILTER_GOOD,
    CAIRO_FILTER_BEST,
    CAIRO_FILTER_NEAREST,
    CAIRO_FILTER_BILINEAR,
    CAIRO_FILTER_GAUSSIAN
} cairo_filter_t;

 void
cairo_pattern_set_filter (cairo_pattern_t *pattern, cairo_filter_t filter);

 cairo_filter_t
cairo_pattern_get_filter (cairo_pattern_t *pattern);

 cairo_status_t
cairo_pattern_get_rgba (cairo_pattern_t *pattern,
   double *red, double *green,
   double *blue, double *alpha);

 cairo_status_t
cairo_pattern_get_surface (cairo_pattern_t *pattern,
      cairo_surface_t **surface);


 cairo_status_t
cairo_pattern_get_color_stop_rgba (cairo_pattern_t *pattern,
       int index, double *offset,
       double *red, double *green,
       double *blue, double *alpha);

 cairo_status_t
cairo_pattern_get_color_stop_count (cairo_pattern_t *pattern,
        int *count);

 cairo_status_t
cairo_pattern_get_linear_points (cairo_pattern_t *pattern,
     double *x0, double *y0,
     double *x1, double *y1);

 cairo_status_t
cairo_pattern_get_radial_circles (cairo_pattern_t *pattern,
      double *x0, double *y0, double *r0,
      double *x1, double *y1, double *r1);

 cairo_status_t
cairo_mesh_pattern_get_patch_count (cairo_pattern_t *pattern,
        unsigned int *count);

 cairo_path_t *
cairo_mesh_pattern_get_path (cairo_pattern_t *pattern,
        unsigned int patch_num);

 cairo_status_t
cairo_mesh_pattern_get_corner_color_rgba (cairo_pattern_t *pattern,
       unsigned int patch_num,
       unsigned int corner_num,
       double *red, double *green,
       double *blue, double *alpha);

 cairo_status_t
cairo_mesh_pattern_get_control_point (cairo_pattern_t *pattern,
          unsigned int patch_num,
          unsigned int point_num,
          double *x, double *y);



 void
cairo_matrix_init (cairo_matrix_t *matrix,
     double xx, double yx,
     double xy, double yy,
     double x0, double y0);

 void
cairo_matrix_init_identity (cairo_matrix_t *matrix);

 void
cairo_matrix_init_translate (cairo_matrix_t *matrix,
        double tx, double ty);

 void
cairo_matrix_init_scale (cairo_matrix_t *matrix,
    double sx, double sy);

 void
cairo_matrix_init_rotate (cairo_matrix_t *matrix,
     double radians);

 void
cairo_matrix_translate (cairo_matrix_t *matrix, double tx, double ty);

 void
cairo_matrix_scale (cairo_matrix_t *matrix, double sx, double sy);

 void
cairo_matrix_rotate (cairo_matrix_t *matrix, double radians);

 cairo_status_t
cairo_matrix_invert (cairo_matrix_t *matrix);

 void
cairo_matrix_multiply (cairo_matrix_t *result,
         const cairo_matrix_t *a,
         const cairo_matrix_t *b);

 void
cairo_matrix_transform_distance (const cairo_matrix_t *matrix,
     double *dx, double *dy);

 void
cairo_matrix_transform_point (const cairo_matrix_t *matrix,
         double *x, double *y);
# 3024 "cairo.h"
typedef struct _cairo_region cairo_region_t;

typedef enum _cairo_region_overlap {
    CAIRO_REGION_OVERLAP_IN,
    CAIRO_REGION_OVERLAP_OUT,
    CAIRO_REGION_OVERLAP_PART
} cairo_region_overlap_t;

 cairo_region_t *
cairo_region_create (void);

 cairo_region_t *
cairo_region_create_rectangle (const cairo_rectangle_int_t *rectangle);

 cairo_region_t *
cairo_region_create_rectangles (const cairo_rectangle_int_t *rects,
    int count);

 cairo_region_t *
cairo_region_copy (const cairo_region_t *original);

 cairo_region_t *
cairo_region_reference (cairo_region_t *region);

 void
cairo_region_destroy (cairo_region_t *region);

 cairo_bool_t
cairo_region_equal (const cairo_region_t *a, const cairo_region_t *b);

 cairo_status_t
cairo_region_status (const cairo_region_t *region);

 void
cairo_region_get_extents (const cairo_region_t *region,
     cairo_rectangle_int_t *extents);

 int
cairo_region_num_rectangles (const cairo_region_t *region);

 void
cairo_region_get_rectangle (const cairo_region_t *region,
       int nth,
       cairo_rectangle_int_t *rectangle);

 cairo_bool_t
cairo_region_is_empty (const cairo_region_t *region);

 cairo_region_overlap_t
cairo_region_contains_rectangle (const cairo_region_t *region,
     const cairo_rectangle_int_t *rectangle);

 cairo_bool_t
cairo_region_contains_point (const cairo_region_t *region, int x, int y);

 void
cairo_region_translate (cairo_region_t *region, int dx, int dy);

 cairo_status_t
cairo_region_subtract (cairo_region_t *dst, const cairo_region_t *other);

 cairo_status_t
cairo_region_subtract_rectangle (cairo_region_t *dst,
     const cairo_rectangle_int_t *rectangle);

 cairo_status_t
cairo_region_intersect (cairo_region_t *dst, const cairo_region_t *other);

 cairo_status_t
cairo_region_intersect_rectangle (cairo_region_t *dst,
      const cairo_rectangle_int_t *rectangle);

 cairo_status_t
cairo_region_union (cairo_region_t *dst, const cairo_region_t *other);

 cairo_status_t
cairo_region_union_rectangle (cairo_region_t *dst,
         const cairo_rectangle_int_t *rectangle);

 cairo_status_t
cairo_region_xor (cairo_region_t *dst, const cairo_region_t *other);

 cairo_status_t
cairo_region_xor_rectangle (cairo_region_t *dst,
       const cairo_rectangle_int_t *rectangle);


 void
cairo_debug_reset_static_data (void);



# 71 "cairoint.h" 2
# 1 "/usr/include/pixman-1/pixman.h" 1
# 72 "/usr/include/pixman-1/pixman.h"
# 1 "/usr/include/pixman-1/pixman-version.h" 1
# 73 "/usr/include/pixman-1/pixman.h" 2
# 82 "/usr/include/pixman-1/pixman.h"

# 105 "/usr/include/pixman-1/pixman.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdint.h" 1 3 4


# 1 "/usr/include/stdint.h" 1 3 4
# 27 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 49 "/usr/include/stdint.h" 3 4
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 66 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 91 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 104 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 120 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 135 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 4 "/usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdint.h" 2 3 4
# 106 "/usr/include/pixman-1/pixman.h" 2







typedef int pixman_bool_t;




typedef int64_t pixman_fixed_32_32_t;
typedef pixman_fixed_32_32_t pixman_fixed_48_16_t;
typedef uint32_t pixman_fixed_1_31_t;
typedef uint32_t pixman_fixed_1_16_t;
typedef int32_t pixman_fixed_16_16_t;
typedef pixman_fixed_16_16_t pixman_fixed_t;
# 144 "/usr/include/pixman-1/pixman.h"
typedef struct pixman_color pixman_color_t;
typedef struct pixman_point_fixed pixman_point_fixed_t;
typedef struct pixman_line_fixed pixman_line_fixed_t;
typedef struct pixman_vector pixman_vector_t;
typedef struct pixman_transform pixman_transform_t;

struct pixman_color
{
    uint16_t red;
    uint16_t green;
    uint16_t blue;
    uint16_t alpha;
};

struct pixman_point_fixed
{
    pixman_fixed_t x;
    pixman_fixed_t y;
};

struct pixman_line_fixed
{
    pixman_point_fixed_t p1, p2;
};





struct pixman_vector
{
    pixman_fixed_t vector[3];
};

struct pixman_transform
{
    pixman_fixed_t matrix[3][3];
};


struct pixman_box16;
typedef union pixman_image pixman_image_t;

void pixman_transform_init_identity (struct pixman_transform *matrix);
pixman_bool_t pixman_transform_point_3d (const struct pixman_transform *transform,
       struct pixman_vector *vector);
pixman_bool_t pixman_transform_point (const struct pixman_transform *transform,
       struct pixman_vector *vector);
pixman_bool_t pixman_transform_multiply (struct pixman_transform *dst,
       const struct pixman_transform *l,
       const struct pixman_transform *r);
void pixman_transform_init_scale (struct pixman_transform *t,
       pixman_fixed_t sx,
       pixman_fixed_t sy);
pixman_bool_t pixman_transform_scale (struct pixman_transform *forward,
       struct pixman_transform *reverse,
       pixman_fixed_t sx,
       pixman_fixed_t sy);
void pixman_transform_init_rotate (struct pixman_transform *t,
       pixman_fixed_t cos,
       pixman_fixed_t sin);
pixman_bool_t pixman_transform_rotate (struct pixman_transform *forward,
       struct pixman_transform *reverse,
       pixman_fixed_t c,
       pixman_fixed_t s);
void pixman_transform_init_translate (struct pixman_transform *t,
       pixman_fixed_t tx,
       pixman_fixed_t ty);
pixman_bool_t pixman_transform_translate (struct pixman_transform *forward,
       struct pixman_transform *reverse,
       pixman_fixed_t tx,
       pixman_fixed_t ty);
pixman_bool_t pixman_transform_bounds (const struct pixman_transform *matrix,
       struct pixman_box16 *b);
pixman_bool_t pixman_transform_invert (struct pixman_transform *dst,
       const struct pixman_transform *src);
pixman_bool_t pixman_transform_is_identity (const struct pixman_transform *t);
pixman_bool_t pixman_transform_is_scale (const struct pixman_transform *t);
pixman_bool_t pixman_transform_is_int_translate (const struct pixman_transform *t);
pixman_bool_t pixman_transform_is_inverse (const struct pixman_transform *a,
       const struct pixman_transform *b);




struct pixman_f_vector
{
    double v[3];
};

struct pixman_f_transform
{
    double m[3][3];
};

pixman_bool_t pixman_transform_from_pixman_f_transform (struct pixman_transform *t,
       const struct pixman_f_transform *ft);
void pixman_f_transform_from_pixman_transform (struct pixman_f_transform *ft,
       const struct pixman_transform *t);
pixman_bool_t pixman_f_transform_invert (struct pixman_f_transform *dst,
       const struct pixman_f_transform *src);
pixman_bool_t pixman_f_transform_point (const struct pixman_f_transform *t,
       struct pixman_f_vector *v);
void pixman_f_transform_point_3d (const struct pixman_f_transform *t,
       struct pixman_f_vector *v);
void pixman_f_transform_multiply (struct pixman_f_transform *dst,
       const struct pixman_f_transform *l,
       const struct pixman_f_transform *r);
void pixman_f_transform_init_scale (struct pixman_f_transform *t,
       double sx,
       double sy);
pixman_bool_t pixman_f_transform_scale (struct pixman_f_transform *forward,
       struct pixman_f_transform *reverse,
       double sx,
       double sy);
void pixman_f_transform_init_rotate (struct pixman_f_transform *t,
       double cos,
       double sin);
pixman_bool_t pixman_f_transform_rotate (struct pixman_f_transform *forward,
       struct pixman_f_transform *reverse,
       double c,
       double s);
void pixman_f_transform_init_translate (struct pixman_f_transform *t,
       double tx,
       double ty);
pixman_bool_t pixman_f_transform_translate (struct pixman_f_transform *forward,
       struct pixman_f_transform *reverse,
       double tx,
       double ty);
pixman_bool_t pixman_f_transform_bounds (const struct pixman_f_transform *t,
       struct pixman_box16 *b);
void pixman_f_transform_init_identity (struct pixman_f_transform *t);

typedef enum
{
    PIXMAN_REPEAT_NONE,
    PIXMAN_REPEAT_NORMAL,
    PIXMAN_REPEAT_PAD,
    PIXMAN_REPEAT_REFLECT
} pixman_repeat_t;

typedef enum
{
    PIXMAN_FILTER_FAST,
    PIXMAN_FILTER_GOOD,
    PIXMAN_FILTER_BEST,
    PIXMAN_FILTER_NEAREST,
    PIXMAN_FILTER_BILINEAR,
    PIXMAN_FILTER_CONVOLUTION
} pixman_filter_t;

typedef enum
{
    PIXMAN_OP_CLEAR = 0x00,
    PIXMAN_OP_SRC = 0x01,
    PIXMAN_OP_DST = 0x02,
    PIXMAN_OP_OVER = 0x03,
    PIXMAN_OP_OVER_REVERSE = 0x04,
    PIXMAN_OP_IN = 0x05,
    PIXMAN_OP_IN_REVERSE = 0x06,
    PIXMAN_OP_OUT = 0x07,
    PIXMAN_OP_OUT_REVERSE = 0x08,
    PIXMAN_OP_ATOP = 0x09,
    PIXMAN_OP_ATOP_REVERSE = 0x0a,
    PIXMAN_OP_XOR = 0x0b,
    PIXMAN_OP_ADD = 0x0c,
    PIXMAN_OP_SATURATE = 0x0d,

    PIXMAN_OP_DISJOINT_CLEAR = 0x10,
    PIXMAN_OP_DISJOINT_SRC = 0x11,
    PIXMAN_OP_DISJOINT_DST = 0x12,
    PIXMAN_OP_DISJOINT_OVER = 0x13,
    PIXMAN_OP_DISJOINT_OVER_REVERSE = 0x14,
    PIXMAN_OP_DISJOINT_IN = 0x15,
    PIXMAN_OP_DISJOINT_IN_REVERSE = 0x16,
    PIXMAN_OP_DISJOINT_OUT = 0x17,
    PIXMAN_OP_DISJOINT_OUT_REVERSE = 0x18,
    PIXMAN_OP_DISJOINT_ATOP = 0x19,
    PIXMAN_OP_DISJOINT_ATOP_REVERSE = 0x1a,
    PIXMAN_OP_DISJOINT_XOR = 0x1b,

    PIXMAN_OP_CONJOINT_CLEAR = 0x20,
    PIXMAN_OP_CONJOINT_SRC = 0x21,
    PIXMAN_OP_CONJOINT_DST = 0x22,
    PIXMAN_OP_CONJOINT_OVER = 0x23,
    PIXMAN_OP_CONJOINT_OVER_REVERSE = 0x24,
    PIXMAN_OP_CONJOINT_IN = 0x25,
    PIXMAN_OP_CONJOINT_IN_REVERSE = 0x26,
    PIXMAN_OP_CONJOINT_OUT = 0x27,
    PIXMAN_OP_CONJOINT_OUT_REVERSE = 0x28,
    PIXMAN_OP_CONJOINT_ATOP = 0x29,
    PIXMAN_OP_CONJOINT_ATOP_REVERSE = 0x2a,
    PIXMAN_OP_CONJOINT_XOR = 0x2b,

    PIXMAN_OP_MULTIPLY = 0x30,
    PIXMAN_OP_SCREEN = 0x31,
    PIXMAN_OP_OVERLAY = 0x32,
    PIXMAN_OP_DARKEN = 0x33,
    PIXMAN_OP_LIGHTEN = 0x34,
    PIXMAN_OP_COLOR_DODGE = 0x35,
    PIXMAN_OP_COLOR_BURN = 0x36,
    PIXMAN_OP_HARD_LIGHT = 0x37,
    PIXMAN_OP_SOFT_LIGHT = 0x38,
    PIXMAN_OP_DIFFERENCE = 0x39,
    PIXMAN_OP_EXCLUSION = 0x3a,
    PIXMAN_OP_HSL_HUE = 0x3b,
    PIXMAN_OP_HSL_SATURATION = 0x3c,
    PIXMAN_OP_HSL_COLOR = 0x3d,
    PIXMAN_OP_HSL_LUMINOSITY = 0x3e






} pixman_op_t;




typedef struct pixman_region16_data pixman_region16_data_t;
typedef struct pixman_box16 pixman_box16_t;
typedef struct pixman_rectangle16 pixman_rectangle16_t;
typedef struct pixman_region16 pixman_region16_t;

struct pixman_region16_data {
    long size;
    long numRects;

};

struct pixman_rectangle16
{
    int16_t x, y;
    uint16_t width, height;
};

struct pixman_box16
{
    int16_t x1, y1, x2, y2;
};

struct pixman_region16
{
    pixman_box16_t extents;
    pixman_region16_data_t *data;
};

typedef enum
{
    PIXMAN_REGION_OUT,
    PIXMAN_REGION_IN,
    PIXMAN_REGION_PART
} pixman_region_overlap_t;




void pixman_region_set_static_pointers (pixman_box16_t *empty_box,
     pixman_region16_data_t *empty_data,
     pixman_region16_data_t *broken_data);


void pixman_region_init (pixman_region16_t *region);
void pixman_region_init_rect (pixman_region16_t *region,
         int x,
         int y,
         unsigned int width,
         unsigned int height);
pixman_bool_t pixman_region_init_rects (pixman_region16_t *region,
         const pixman_box16_t *boxes,
         int count);
void pixman_region_init_with_extents (pixman_region16_t *region,
         pixman_box16_t *extents);
void pixman_region_init_from_image (pixman_region16_t *region,
         pixman_image_t *image);
void pixman_region_fini (pixman_region16_t *region);



void pixman_region_translate (pixman_region16_t *region,
         int x,
         int y);
pixman_bool_t pixman_region_copy (pixman_region16_t *dest,
         pixman_region16_t *source);
pixman_bool_t pixman_region_intersect (pixman_region16_t *new_reg,
         pixman_region16_t *reg1,
         pixman_region16_t *reg2);
pixman_bool_t pixman_region_union (pixman_region16_t *new_reg,
         pixman_region16_t *reg1,
         pixman_region16_t *reg2);
pixman_bool_t pixman_region_union_rect (pixman_region16_t *dest,
         pixman_region16_t *source,
         int x,
         int y,
         unsigned int width,
         unsigned int height);
pixman_bool_t pixman_region_intersect_rect (pixman_region16_t *dest,
         pixman_region16_t *source,
         int x,
         int y,
         unsigned int width,
         unsigned int height);
pixman_bool_t pixman_region_subtract (pixman_region16_t *reg_d,
         pixman_region16_t *reg_m,
         pixman_region16_t *reg_s);
pixman_bool_t pixman_region_inverse (pixman_region16_t *new_reg,
         pixman_region16_t *reg1,
         pixman_box16_t *inv_rect);
pixman_bool_t pixman_region_contains_point (pixman_region16_t *region,
         int x,
         int y,
         pixman_box16_t *box);
pixman_region_overlap_t pixman_region_contains_rectangle (pixman_region16_t *region,
         pixman_box16_t *prect);
pixman_bool_t pixman_region_not_empty (pixman_region16_t *region);
pixman_box16_t * pixman_region_extents (pixman_region16_t *region);
int pixman_region_n_rects (pixman_region16_t *region);
pixman_box16_t * pixman_region_rectangles (pixman_region16_t *region,
         int *n_rects);
pixman_bool_t pixman_region_equal (pixman_region16_t *region1,
         pixman_region16_t *region2);
pixman_bool_t pixman_region_selfcheck (pixman_region16_t *region);
void pixman_region_reset (pixman_region16_t *region,
         pixman_box16_t *box);



typedef struct pixman_region32_data pixman_region32_data_t;
typedef struct pixman_box32 pixman_box32_t;
typedef struct pixman_rectangle32 pixman_rectangle32_t;
typedef struct pixman_region32 pixman_region32_t;

struct pixman_region32_data {
    long size;
    long numRects;

};

struct pixman_rectangle32
{
    int32_t x, y;
    uint32_t width, height;
};

struct pixman_box32
{
    int32_t x1, y1, x2, y2;
};

struct pixman_region32
{
    pixman_box32_t extents;
    pixman_region32_data_t *data;
};


void pixman_region32_init (pixman_region32_t *region);
void pixman_region32_init_rect (pixman_region32_t *region,
           int x,
           int y,
           unsigned int width,
           unsigned int height);
pixman_bool_t pixman_region32_init_rects (pixman_region32_t *region,
           const pixman_box32_t *boxes,
           int count);
void pixman_region32_init_with_extents (pixman_region32_t *region,
           pixman_box32_t *extents);
void pixman_region32_init_from_image (pixman_region32_t *region,
           pixman_image_t *image);
void pixman_region32_fini (pixman_region32_t *region);



void pixman_region32_translate (pixman_region32_t *region,
           int x,
           int y);
pixman_bool_t pixman_region32_copy (pixman_region32_t *dest,
           pixman_region32_t *source);
pixman_bool_t pixman_region32_intersect (pixman_region32_t *new_reg,
           pixman_region32_t *reg1,
           pixman_region32_t *reg2);
pixman_bool_t pixman_region32_union (pixman_region32_t *new_reg,
           pixman_region32_t *reg1,
           pixman_region32_t *reg2);
pixman_bool_t pixman_region32_intersect_rect (pixman_region32_t *dest,
           pixman_region32_t *source,
           int x,
           int y,
           unsigned int width,
           unsigned int height);
pixman_bool_t pixman_region32_union_rect (pixman_region32_t *dest,
           pixman_region32_t *source,
           int x,
           int y,
           unsigned int width,
           unsigned int height);
pixman_bool_t pixman_region32_subtract (pixman_region32_t *reg_d,
           pixman_region32_t *reg_m,
           pixman_region32_t *reg_s);
pixman_bool_t pixman_region32_inverse (pixman_region32_t *new_reg,
           pixman_region32_t *reg1,
           pixman_box32_t *inv_rect);
pixman_bool_t pixman_region32_contains_point (pixman_region32_t *region,
           int x,
           int y,
           pixman_box32_t *box);
pixman_region_overlap_t pixman_region32_contains_rectangle (pixman_region32_t *region,
           pixman_box32_t *prect);
pixman_bool_t pixman_region32_not_empty (pixman_region32_t *region);
pixman_box32_t * pixman_region32_extents (pixman_region32_t *region);
int pixman_region32_n_rects (pixman_region32_t *region);
pixman_box32_t * pixman_region32_rectangles (pixman_region32_t *region,
           int *n_rects);
pixman_bool_t pixman_region32_equal (pixman_region32_t *region1,
           pixman_region32_t *region2);
pixman_bool_t pixman_region32_selfcheck (pixman_region32_t *region);
void pixman_region32_reset (pixman_region32_t *region,
           pixman_box32_t *box);



pixman_bool_t pixman_blt (uint32_t *src_bits,
      uint32_t *dst_bits,
      int src_stride,
      int dst_stride,
      int src_bpp,
      int dst_bpp,
      int src_x,
      int src_y,
      int dest_x,
      int dest_y,
      int width,
      int height);
pixman_bool_t pixman_fill (uint32_t *bits,
      int stride,
      int bpp,
      int x,
      int y,
      int width,
      int height,
      uint32_t _xor);

int pixman_version (void);
const char* pixman_version_string (void);




typedef struct pixman_indexed pixman_indexed_t;
typedef struct pixman_gradient_stop pixman_gradient_stop_t;

typedef uint32_t (* pixman_read_memory_func_t) (const void *src, int size);
typedef void (* pixman_write_memory_func_t) (void *dst, uint32_t value, int size);

typedef void (* pixman_image_destroy_func_t) (pixman_image_t *image, void *data);

struct pixman_gradient_stop {
    pixman_fixed_t x;
    pixman_color_t color;
};




typedef uint8_t pixman_index_type;


struct pixman_indexed
{
    pixman_bool_t color;
    uint32_t rgba[256];
    pixman_index_type ent[32768];
};
# 662 "/usr/include/pixman-1/pixman.h"
typedef enum {
    PIXMAN_a8r8g8b8 = (((32) << 24) | ((2) << 16) | ((8) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_x8r8g8b8 = (((32) << 24) | ((2) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_a8b8g8r8 = (((32) << 24) | ((3) << 16) | ((8) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_x8b8g8r8 = (((32) << 24) | ((3) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_b8g8r8a8 = (((32) << 24) | ((8) << 16) | ((8) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_b8g8r8x8 = (((32) << 24) | ((8) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_r8g8b8a8 = (((32) << 24) | ((9) << 16) | ((8) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_r8g8b8x8 = (((32) << 24) | ((9) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_x14r6g6b6 = (((32) << 24) | ((2) << 16) | ((0) << 12) | ((6) << 8) | ((6) << 4) | ((6))),
    PIXMAN_x2r10g10b10 = (((32) << 24) | ((2) << 16) | ((0) << 12) | ((10) << 8) | ((10) << 4) | ((10))),
    PIXMAN_a2r10g10b10 = (((32) << 24) | ((2) << 16) | ((2) << 12) | ((10) << 8) | ((10) << 4) | ((10))),
    PIXMAN_x2b10g10r10 = (((32) << 24) | ((3) << 16) | ((0) << 12) | ((10) << 8) | ((10) << 4) | ((10))),
    PIXMAN_a2b10g10r10 = (((32) << 24) | ((3) << 16) | ((2) << 12) | ((10) << 8) | ((10) << 4) | ((10))),


    PIXMAN_r8g8b8 = (((24) << 24) | ((2) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),
    PIXMAN_b8g8r8 = (((24) << 24) | ((3) << 16) | ((0) << 12) | ((8) << 8) | ((8) << 4) | ((8))),


    PIXMAN_r5g6b5 = (((16) << 24) | ((2) << 16) | ((0) << 12) | ((5) << 8) | ((6) << 4) | ((5))),
    PIXMAN_b5g6r5 = (((16) << 24) | ((3) << 16) | ((0) << 12) | ((5) << 8) | ((6) << 4) | ((5))),

    PIXMAN_a1r5g5b5 = (((16) << 24) | ((2) << 16) | ((1) << 12) | ((5) << 8) | ((5) << 4) | ((5))),
    PIXMAN_x1r5g5b5 = (((16) << 24) | ((2) << 16) | ((0) << 12) | ((5) << 8) | ((5) << 4) | ((5))),
    PIXMAN_a1b5g5r5 = (((16) << 24) | ((3) << 16) | ((1) << 12) | ((5) << 8) | ((5) << 4) | ((5))),
    PIXMAN_x1b5g5r5 = (((16) << 24) | ((3) << 16) | ((0) << 12) | ((5) << 8) | ((5) << 4) | ((5))),
    PIXMAN_a4r4g4b4 = (((16) << 24) | ((2) << 16) | ((4) << 12) | ((4) << 8) | ((4) << 4) | ((4))),
    PIXMAN_x4r4g4b4 = (((16) << 24) | ((2) << 16) | ((0) << 12) | ((4) << 8) | ((4) << 4) | ((4))),
    PIXMAN_a4b4g4r4 = (((16) << 24) | ((3) << 16) | ((4) << 12) | ((4) << 8) | ((4) << 4) | ((4))),
    PIXMAN_x4b4g4r4 = (((16) << 24) | ((3) << 16) | ((0) << 12) | ((4) << 8) | ((4) << 4) | ((4))),


    PIXMAN_a8 = (((8) << 24) | ((1) << 16) | ((8) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_r3g3b2 = (((8) << 24) | ((2) << 16) | ((0) << 12) | ((3) << 8) | ((3) << 4) | ((2))),
    PIXMAN_b2g3r3 = (((8) << 24) | ((3) << 16) | ((0) << 12) | ((3) << 8) | ((3) << 4) | ((2))),
    PIXMAN_a2r2g2b2 = (((8) << 24) | ((2) << 16) | ((2) << 12) | ((2) << 8) | ((2) << 4) | ((2))),
    PIXMAN_a2b2g2r2 = (((8) << 24) | ((3) << 16) | ((2) << 12) | ((2) << 8) | ((2) << 4) | ((2))),

    PIXMAN_c8 = (((8) << 24) | ((4) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_g8 = (((8) << 24) | ((5) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),

    PIXMAN_x4a4 = (((8) << 24) | ((1) << 16) | ((4) << 12) | ((0) << 8) | ((0) << 4) | ((0))),

    PIXMAN_x4c4 = (((8) << 24) | ((4) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_x4g4 = (((8) << 24) | ((5) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),


    PIXMAN_a4 = (((4) << 24) | ((1) << 16) | ((4) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_r1g2b1 = (((4) << 24) | ((2) << 16) | ((0) << 12) | ((1) << 8) | ((2) << 4) | ((1))),
    PIXMAN_b1g2r1 = (((4) << 24) | ((3) << 16) | ((0) << 12) | ((1) << 8) | ((2) << 4) | ((1))),
    PIXMAN_a1r1g1b1 = (((4) << 24) | ((2) << 16) | ((1) << 12) | ((1) << 8) | ((1) << 4) | ((1))),
    PIXMAN_a1b1g1r1 = (((4) << 24) | ((3) << 16) | ((1) << 12) | ((1) << 8) | ((1) << 4) | ((1))),

    PIXMAN_c4 = (((4) << 24) | ((4) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_g4 = (((4) << 24) | ((5) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),


    PIXMAN_a1 = (((1) << 24) | ((1) << 16) | ((1) << 12) | ((0) << 8) | ((0) << 4) | ((0))),

    PIXMAN_g1 = (((1) << 24) | ((5) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),


    PIXMAN_yuy2 = (((16) << 24) | ((6) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0))),
    PIXMAN_yv12 = (((12) << 24) | ((7) << 16) | ((0) << 12) | ((0) << 8) | ((0) << 4) | ((0)))
} pixman_format_code_t;


pixman_bool_t pixman_format_supported_destination (pixman_format_code_t format);
pixman_bool_t pixman_format_supported_source (pixman_format_code_t format);


pixman_image_t *pixman_image_create_solid_fill (pixman_color_t *color);
pixman_image_t *pixman_image_create_linear_gradient (pixman_point_fixed_t *p1,
            pixman_point_fixed_t *p2,
            const pixman_gradient_stop_t *stops,
            int n_stops);
pixman_image_t *pixman_image_create_radial_gradient (pixman_point_fixed_t *inner,
            pixman_point_fixed_t *outer,
            pixman_fixed_t inner_radius,
            pixman_fixed_t outer_radius,
            const pixman_gradient_stop_t *stops,
            int n_stops);
pixman_image_t *pixman_image_create_conical_gradient (pixman_point_fixed_t *center,
            pixman_fixed_t angle,
            const pixman_gradient_stop_t *stops,
            int n_stops);
pixman_image_t *pixman_image_create_bits (pixman_format_code_t format,
            int width,
            int height,
            uint32_t *bits,
            int rowstride_bytes);


pixman_image_t *pixman_image_ref (pixman_image_t *image);
pixman_bool_t pixman_image_unref (pixman_image_t *image);

void pixman_image_set_destroy_function (pixman_image_t *image,
            pixman_image_destroy_func_t function,
            void *data);
void * pixman_image_get_destroy_data (pixman_image_t *image);


pixman_bool_t pixman_image_set_clip_region (pixman_image_t *image,
            pixman_region16_t *region);
pixman_bool_t pixman_image_set_clip_region32 (pixman_image_t *image,
            pixman_region32_t *region);
void pixman_image_set_has_client_clip (pixman_image_t *image,
            pixman_bool_t clien_clip);
pixman_bool_t pixman_image_set_transform (pixman_image_t *image,
            const pixman_transform_t *transform);
void pixman_image_set_repeat (pixman_image_t *image,
            pixman_repeat_t repeat);
pixman_bool_t pixman_image_set_filter (pixman_image_t *image,
            pixman_filter_t filter,
            const pixman_fixed_t *filter_params,
            int n_filter_params);
void pixman_image_set_source_clipping (pixman_image_t *image,
            pixman_bool_t source_clipping);
void pixman_image_set_alpha_map (pixman_image_t *image,
            pixman_image_t *alpha_map,
            int16_t x,
            int16_t y);
void pixman_image_set_component_alpha (pixman_image_t *image,
            pixman_bool_t component_alpha);
pixman_bool_t pixman_image_get_component_alpha (pixman_image_t *image);
void pixman_image_set_accessors (pixman_image_t *image,
            pixman_read_memory_func_t read_func,
            pixman_write_memory_func_t write_func);
void pixman_image_set_indexed (pixman_image_t *image,
            const pixman_indexed_t *indexed);
uint32_t *pixman_image_get_data (pixman_image_t *image);
int pixman_image_get_width (pixman_image_t *image);
int pixman_image_get_height (pixman_image_t *image);
int pixman_image_get_stride (pixman_image_t *image);
int pixman_image_get_depth (pixman_image_t *image);
pixman_format_code_t pixman_image_get_format (pixman_image_t *image);
pixman_bool_t pixman_image_fill_rectangles (pixman_op_t op,
            pixman_image_t *image,
            pixman_color_t *color,
            int n_rects,
            const pixman_rectangle16_t *rects);
pixman_bool_t pixman_image_fill_boxes (pixman_op_t op,
                                                      pixman_image_t *dest,
                                                      pixman_color_t *color,
                                                      int n_boxes,
                                                      const pixman_box32_t *boxes);


pixman_bool_t pixman_compute_composite_region (pixman_region16_t *region,
            pixman_image_t *src_image,
            pixman_image_t *mask_image,
            pixman_image_t *dest_image,
            int16_t src_x,
            int16_t src_y,
            int16_t mask_x,
            int16_t mask_y,
            int16_t dest_x,
            int16_t dest_y,
            uint16_t width,
            uint16_t height);
void pixman_image_composite (pixman_op_t op,
            pixman_image_t *src,
            pixman_image_t *mask,
            pixman_image_t *dest,
            int16_t src_x,
            int16_t src_y,
            int16_t mask_x,
            int16_t mask_y,
            int16_t dest_x,
            int16_t dest_y,
            uint16_t width,
            uint16_t height);
void pixman_image_composite32 (pixman_op_t op,
            pixman_image_t *src,
            pixman_image_t *mask,
            pixman_image_t *dest,
            int32_t src_x,
            int32_t src_y,
            int32_t mask_x,
            int32_t mask_y,
            int32_t dest_x,
            int32_t dest_y,
            int32_t width,
            int32_t height);
# 866 "/usr/include/pixman-1/pixman.h"
void pixman_disable_out_of_bounds_workaround (void);




typedef struct pixman_edge pixman_edge_t;
typedef struct pixman_trapezoid pixman_trapezoid_t;
typedef struct pixman_trap pixman_trap_t;
typedef struct pixman_span_fix pixman_span_fix_t;
typedef struct pixman_triangle pixman_triangle_t;






struct pixman_edge
{
    pixman_fixed_t x;
    pixman_fixed_t e;
    pixman_fixed_t stepx;
    pixman_fixed_t signdx;
    pixman_fixed_t dy;
    pixman_fixed_t dx;

    pixman_fixed_t stepx_small;
    pixman_fixed_t stepx_big;
    pixman_fixed_t dx_small;
    pixman_fixed_t dx_big;
};

struct pixman_trapezoid
{
    pixman_fixed_t top, bottom;
    pixman_line_fixed_t left, right;
};

struct pixman_triangle
{
    pixman_point_fixed_t p1, p2, p3;
};







struct pixman_span_fix
{
    pixman_fixed_t l, r, y;
};

struct pixman_trap
{
    pixman_span_fix_t top, bot;
};

pixman_fixed_t pixman_sample_ceil_y (pixman_fixed_t y,
         int bpp);
pixman_fixed_t pixman_sample_floor_y (pixman_fixed_t y,
         int bpp);
void pixman_edge_step (pixman_edge_t *e,
         int n);
void pixman_edge_init (pixman_edge_t *e,
         int bpp,
         pixman_fixed_t y_start,
         pixman_fixed_t x_top,
         pixman_fixed_t y_top,
         pixman_fixed_t x_bot,
         pixman_fixed_t y_bot);
void pixman_line_fixed_edge_init (pixman_edge_t *e,
         int bpp,
         pixman_fixed_t y,
         const pixman_line_fixed_t *line,
         int x_off,
         int y_off);
void pixman_rasterize_edges (pixman_image_t *image,
         pixman_edge_t *l,
         pixman_edge_t *r,
         pixman_fixed_t t,
         pixman_fixed_t b);
void pixman_add_traps (pixman_image_t *image,
         int16_t x_off,
         int16_t y_off,
         int ntrap,
         pixman_trap_t *traps);
void pixman_add_trapezoids (pixman_image_t *image,
         int16_t x_off,
         int y_off,
         int ntraps,
         const pixman_trapezoid_t *traps);
void pixman_rasterize_trapezoid (pixman_image_t *image,
         const pixman_trapezoid_t *trap,
         int x_off,
         int y_off);
void pixman_composite_trapezoids (pixman_op_t op,
        pixman_image_t * src,
        pixman_image_t * dst,
        pixman_format_code_t mask_format,
        int x_src,
        int y_src,
        int x_dst,
        int y_dst,
        int n_traps,
        const pixman_trapezoid_t * traps);
void pixman_composite_triangles (pixman_op_t op,
       pixman_image_t * src,
       pixman_image_t * dst,
       pixman_format_code_t mask_format,
       int x_src,
       int y_src,
       int x_dst,
       int y_dst,
       int n_tris,
       const pixman_triangle_t * tris);
void pixman_add_triangles (pixman_image_t *image,
       int32_t x_off,
       int32_t y_off,
       int n_tris,
       const pixman_triangle_t *tris);


# 72 "cairoint.h" 2

# 1 "cairo-compiler-private.h" 1
# 44 "cairo-compiler-private.h"
# 1 "../config.h" 1
# 45 "cairo-compiler-private.h" 2
# 74 "cairoint.h" 2
# 1 "cairo-error-private.h" 1
# 43 "cairo-error-private.h"
# 1 "cairo-types-private.h" 1
# 43 "cairo-types-private.h"
# 1 "cairo-fixed-type-private.h" 1
# 40 "cairo-fixed-type-private.h"
# 1 "cairo-wideint-type-private.h" 1
# 43 "cairo-wideint-type-private.h"
# 1 "../config.h" 1
# 44 "cairo-wideint-type-private.h" 2
# 88 "cairo-wideint-type-private.h"
# 1 "/usr/include/byteswap.h" 1 3 4
# 23 "/usr/include/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 24 "/usr/include/byteswap.h" 2 3 4
# 89 "cairo-wideint-type-private.h" 2
# 112 "cairo-wideint-type-private.h"
typedef uint64_t cairo_uint64_t;
typedef int64_t cairo_int64_t;



typedef struct _cairo_uquorem64 {
    cairo_uint64_t quo;
    cairo_uint64_t rem;
} cairo_uquorem64_t;

typedef struct _cairo_quorem64 {
    cairo_int64_t quo;
    cairo_int64_t rem;
} cairo_quorem64_t;



typedef __uint128_t uint128_t;
typedef __int128_t int128_t;
# 142 "cairo-wideint-type-private.h"
typedef uint128_t cairo_uint128_t;
typedef int128_t cairo_int128_t;



typedef struct _cairo_uquorem128 {
    cairo_uint128_t quo;
    cairo_uint128_t rem;
} cairo_uquorem128_t;

typedef struct _cairo_quorem128 {
    cairo_int128_t quo;
    cairo_int128_t rem;
} cairo_quorem128_t;
# 41 "cairo-fixed-type-private.h" 2





typedef int32_t cairo_fixed_16_16_t;
typedef cairo_int64_t cairo_fixed_32_32_t;
typedef cairo_int64_t cairo_fixed_48_16_t;
typedef cairo_int128_t cairo_fixed_64_64_t;
typedef cairo_int128_t cairo_fixed_96_32_t;
# 65 "cairo-fixed-type-private.h"
typedef int32_t cairo_fixed_t;


typedef uint32_t cairo_fixed_unsigned_t;

typedef struct _cairo_point {
    cairo_fixed_t x;
    cairo_fixed_t y;
} cairo_point_t;
# 44 "cairo-types-private.h" 2
# 1 "cairo-list-private.h" 1
# 44 "cairo-list-private.h"
typedef struct _cairo_list {
    struct _cairo_list *next, *prev;
} cairo_list_t;
# 45 "cairo-types-private.h" 2
# 1 "cairo-reference-count-private.h" 1
# 40 "cairo-reference-count-private.h"
# 1 "cairo-atomic-private.h" 1
# 45 "cairo-atomic-private.h"
# 1 "../config.h" 1
# 46 "cairo-atomic-private.h" 2
# 54 "cairo-atomic-private.h"






typedef int cairo_atomic_int_t;
# 90 "cairo-atomic-private.h"
typedef long cairo_atomic_intptr_t;
# 210 "cairo-atomic-private.h"
static inline __attribute__((always_inline)) void *
_cairo_atomic_intptr_to_voidptr (cairo_atomic_intptr_t x)
{
  return (void *) x;
}

static inline __attribute__((always_inline)) cairo_atomic_int_t
_cairo_atomic_int_cmpxchg_return_old_fallback(cairo_atomic_int_t *x, cairo_atomic_int_t oldv, cairo_atomic_int_t newv)
{
    cairo_atomic_int_t curr;

    do {
        curr = (*x);
    } while (curr == oldv && !__sync_bool_compare_and_swap (x, oldv, newv));

    return curr;
}

static inline __attribute__((always_inline)) void *
_cairo_atomic_ptr_cmpxchg_return_old_fallback(void **x, void *oldv, void *newv)
{
    void *curr;

    do {
        curr = (*x);
    } while (curr == oldv && !__sync_bool_compare_and_swap ((cairo_atomic_intptr_t*)x, (cairo_atomic_intptr_t)oldv, (cairo_atomic_intptr_t)newv));

    return curr;
}
# 270 "cairo-atomic-private.h"

# 41 "cairo-reference-count-private.h" 2


typedef struct {
    cairo_atomic_int_t ref_count;
} cairo_reference_count_t;
# 46 "cairo-types-private.h" 2


# 57 "cairo-types-private.h"
typedef struct _cairo_array cairo_array_t;
typedef struct _cairo_backend cairo_backend_t;
typedef struct _cairo_boxes_t cairo_boxes_t;
typedef struct _cairo_cache cairo_cache_t;
typedef struct _cairo_composite_rectangles cairo_composite_rectangles_t;
typedef struct _cairo_clip cairo_clip_t;
typedef struct _cairo_clip_path cairo_clip_path_t;
typedef struct _cairo_color cairo_color_t;
typedef struct _cairo_color_stop cairo_color_stop_t;
typedef struct _cairo_contour cairo_contour_t;
typedef struct _cairo_contour_chain cairo_contour_chain_t;
typedef struct _cairo_contour_iter cairo_contour_iter_t;
typedef struct _cairo_damage cairo_damage_t;
typedef struct _cairo_device_backend cairo_device_backend_t;
typedef struct _cairo_font_face_backend cairo_font_face_backend_t;
typedef struct _cairo_gstate cairo_gstate_t;
typedef struct _cairo_gstate_backend cairo_gstate_backend_t;
typedef struct _cairo_glyph_text_info cairo_glyph_text_info_t;
typedef struct _cairo_hash_entry cairo_hash_entry_t;
typedef struct _cairo_hash_table cairo_hash_table_t;
typedef struct _cairo_image_surface cairo_image_surface_t;
typedef struct _cairo_mime_data cairo_mime_data_t;
typedef struct _cairo_observer cairo_observer_t;
typedef struct _cairo_output_stream cairo_output_stream_t;
typedef struct _cairo_paginated_surface_backend cairo_paginated_surface_backend_t;
typedef struct _cairo_path_fixed cairo_path_fixed_t;
typedef struct _cairo_rectangle_int16 cairo_glyph_size_t;
typedef struct _cairo_scaled_font_subsets cairo_scaled_font_subsets_t;
typedef struct _cairo_solid_pattern cairo_solid_pattern_t;
typedef struct _cairo_surface_attributes cairo_surface_attributes_t;
typedef struct _cairo_surface_backend cairo_surface_backend_t;
typedef struct _cairo_surface_observer cairo_surface_observer_t;
typedef struct _cairo_surface_snapshot cairo_surface_snapshot_t;
typedef struct _cairo_surface_subsurface cairo_surface_subsurface_t;
typedef struct _cairo_surface_wrapper cairo_surface_wrapper_t;
typedef struct _cairo_traps cairo_traps_t;
typedef struct _cairo_tristrip cairo_tristrip_t;
typedef struct _cairo_unscaled_font_backend cairo_unscaled_font_backend_t;
typedef struct _cairo_xlib_screen_info cairo_xlib_screen_info_t;

typedef cairo_array_t cairo_user_data_array_t;

typedef struct _cairo_scaled_font_private cairo_scaled_font_private_t;
typedef struct _cairo_scaled_font_backend cairo_scaled_font_backend_t;
typedef struct _cairo_scaled_glyph cairo_scaled_glyph_t;
typedef struct _cairo_scaled_glyph_private cairo_scaled_glyph_private_t;

typedef struct cairo_compositor cairo_compositor_t;
typedef struct cairo_fallback_compositor cairo_fallback_compositor_t;
typedef struct cairo_mask_compositor cairo_mask_compositor_t;
typedef struct cairo_traps_compositor cairo_traps_compositor_t;
typedef struct cairo_spans_compositor cairo_spans_compositor_t;

struct _cairo_observer {
    cairo_list_t link;
    void (*callback) (cairo_observer_t *self, void *arg);
};
# 149 "cairo-types-private.h"
struct _cairo_hash_entry {
    unsigned long hash;
};

struct _cairo_array {
    unsigned int size;
    unsigned int num_elements;
    unsigned int element_size;
    char *elements;
};
# 176 "cairo-types-private.h"
typedef enum _cairo_lcd_filter {
    CAIRO_LCD_FILTER_DEFAULT,
    CAIRO_LCD_FILTER_NONE,
    CAIRO_LCD_FILTER_INTRA_PIXEL,
    CAIRO_LCD_FILTER_FIR3,
    CAIRO_LCD_FILTER_FIR5
} cairo_lcd_filter_t;

typedef enum _cairo_round_glyph_positions {
    CAIRO_ROUND_GLYPH_POS_DEFAULT,
    CAIRO_ROUND_GLYPH_POS_ON,
    CAIRO_ROUND_GLYPH_POS_OFF
} cairo_round_glyph_positions_t;

struct _cairo_font_options {
    cairo_antialias_t antialias;
    cairo_subpixel_order_t subpixel_order;
    cairo_lcd_filter_t lcd_filter;
    cairo_hint_style_t hint_style;
    cairo_hint_metrics_t hint_metrics;
    cairo_round_glyph_positions_t round_glyph_positions;
};

struct _cairo_glyph_text_info {
    const char *utf8;
    int utf8_len;

    const cairo_text_cluster_t *clusters;
    int num_clusters;
    cairo_text_cluster_flags_t cluster_flags;
};
# 215 "cairo-types-private.h"
struct _cairo_color {
    double red;
    double green;
    double blue;
    double alpha;

    unsigned short red_short;
    unsigned short green_short;
    unsigned short blue_short;
    unsigned short alpha_short;
};

struct _cairo_color_stop {

    double red;
    double green;
    double blue;
    double alpha;


    uint16_t red_short;
    uint16_t green_short;
    uint16_t blue_short;
    uint16_t alpha_short;
};

typedef enum _cairo_paginated_mode {
    CAIRO_PAGINATED_MODE_ANALYZE,
    CAIRO_PAGINATED_MODE_RENDER,
    CAIRO_PAGINATED_MODE_FALLBACK
} cairo_paginated_mode_t;

typedef enum _cairo_internal_surface_type {
    CAIRO_INTERNAL_SURFACE_TYPE_SNAPSHOT = 0x1000,
    CAIRO_INTERNAL_SURFACE_TYPE_PAGINATED,
    CAIRO_INTERNAL_SURFACE_TYPE_ANALYSIS,
    CAIRO_INTERNAL_SURFACE_TYPE_OBSERVER,
    CAIRO_INTERNAL_SURFACE_TYPE_TEST_FALLBACK,
    CAIRO_INTERNAL_SURFACE_TYPE_TEST_PAGINATED,
    CAIRO_INTERNAL_SURFACE_TYPE_TEST_WRAPPING,
    CAIRO_INTERNAL_SURFACE_TYPE_NULL,
    CAIRO_INTERNAL_SURFACE_TYPE_TYPE3_GLYPH
} cairo_internal_surface_type_t;

typedef enum _cairo_internal_device_type {
    CAIRO_INTERNAL_DEVICE_TYPE_OBSERVER = 0x1000,
} cairo_device_surface_type_t;



typedef struct _cairo_slope {
    cairo_fixed_t dx;
    cairo_fixed_t dy;
} cairo_slope_t, cairo_distance_t;

typedef struct _cairo_point_double {
    double x;
    double y;
} cairo_point_double_t;

typedef struct _cairo_circle_double {
    cairo_point_double_t center;
    double radius;
} cairo_circle_double_t;

typedef struct _cairo_distance_double {
    double dx;
    double dy;
} cairo_distance_double_t;

typedef struct _cairo_box_double {
    cairo_point_double_t p1;
    cairo_point_double_t p2;
} cairo_box_double_t;

typedef struct _cairo_line {
    cairo_point_t p1;
    cairo_point_t p2;
} cairo_line_t, cairo_box_t;

typedef struct _cairo_trapezoid {
    cairo_fixed_t top, bottom;
    cairo_line_t left, right;
} cairo_trapezoid_t;

typedef struct _cairo_point_int {
    int x, y;
} cairo_point_int_t;




typedef enum _cairo_direction {
    CAIRO_DIRECTION_FORWARD,
    CAIRO_DIRECTION_REVERSE
} cairo_direction_t;

typedef struct _cairo_edge {
    cairo_line_t line;
    int top, bottom;
    int dir;
} cairo_edge_t;

typedef struct _cairo_polygon {
    cairo_status_t status;

    cairo_box_t extents;
    cairo_box_t limit;
    const cairo_box_t *limits;
    int num_limits;

    int num_edges;
    int edges_size;
    cairo_edge_t *edges;
    cairo_edge_t edges_embedded[32];
} cairo_polygon_t;

typedef __attribute__((__warn_unused_result__)) cairo_status_t
(*cairo_spline_add_point_func_t) (void *closure,
      const cairo_point_t *point,
      const cairo_slope_t *tangent);

typedef struct _cairo_spline_knots {
    cairo_point_t a, b, c, d;
} cairo_spline_knots_t;

typedef struct _cairo_spline {
    cairo_spline_add_point_func_t add_point_func;
    void *closure;

    cairo_spline_knots_t knots;

    cairo_slope_t initial_slope;
    cairo_slope_t final_slope;

    cairo_bool_t has_point;
    cairo_point_t last_point;
} cairo_spline_t;

typedef struct _cairo_pen_vertex {
    cairo_point_t point;

    cairo_slope_t slope_ccw;
    cairo_slope_t slope_cw;
} cairo_pen_vertex_t;

typedef struct _cairo_pen {
    double radius;
    double tolerance;

    int num_vertices;
    cairo_pen_vertex_t *vertices;
    cairo_pen_vertex_t vertices_embedded[32];
} cairo_pen_t;

typedef struct _cairo_stroke_style {
    double line_width;
    cairo_line_cap_t line_cap;
    cairo_line_join_t line_join;
    double miter_limit;
    double *dash;
    unsigned int num_dashes;
    double dash_offset;
} cairo_stroke_style_t;

typedef struct _cairo_format_masks {
    int bpp;
    unsigned long alpha_mask;
    unsigned long red_mask;
    unsigned long green_mask;
    unsigned long blue_mask;
} cairo_format_masks_t;

typedef enum {
    CAIRO_STOCK_WHITE,
    CAIRO_STOCK_BLACK,
    CAIRO_STOCK_TRANSPARENT,
    CAIRO_STOCK_NUM_COLORS,
} cairo_stock_t;

typedef enum _cairo_image_transparency {
    CAIRO_IMAGE_IS_OPAQUE,
    CAIRO_IMAGE_HAS_BILEVEL_ALPHA,
    CAIRO_IMAGE_HAS_ALPHA,
    CAIRO_IMAGE_UNKNOWN
} cairo_image_transparency_t;

typedef enum _cairo_image_color {
    CAIRO_IMAGE_IS_COLOR,
    CAIRO_IMAGE_IS_GRAYSCALE,
    CAIRO_IMAGE_IS_MONOCHROME,
    CAIRO_IMAGE_UNKNOWN_COLOR
} cairo_image_color_t;


struct _cairo_mime_data {
    cairo_reference_count_t ref_count;
    unsigned char *data;
    unsigned long length;
    cairo_destroy_func_t destroy;
    void *closure;
};





typedef struct _cairo_unscaled_font {
    cairo_hash_entry_t hash_entry;
    cairo_reference_count_t ref_count;
    const cairo_unscaled_font_backend_t *backend;
} cairo_unscaled_font_t;

# 44 "cairo-error-private.h" 2

# 1 "/usr/include/assert.h" 1 3 4
# 46 "cairo-error-private.h" 2







enum _cairo_int_status {
    CAIRO_INT_STATUS_SUCCESS = 0,

    CAIRO_INT_STATUS_NO_MEMORY,
    CAIRO_INT_STATUS_INVALID_RESTORE,
    CAIRO_INT_STATUS_INVALID_POP_GROUP,
    CAIRO_INT_STATUS_NO_CURRENT_POINT,
    CAIRO_INT_STATUS_INVALID_MATRIX,
    CAIRO_INT_STATUS_INVALID_STATUS,
    CAIRO_INT_STATUS_NULL_POINTER,
    CAIRO_INT_STATUS_INVALID_STRING,
    CAIRO_INT_STATUS_INVALID_PATH_DATA,
    CAIRO_INT_STATUS_READ_ERROR,
    CAIRO_INT_STATUS_WRITE_ERROR,
    CAIRO_INT_STATUS_SURFACE_FINISHED,
    CAIRO_INT_STATUS_SURFACE_TYPE_MISMATCH,
    CAIRO_INT_STATUS_PATTERN_TYPE_MISMATCH,
    CAIRO_INT_STATUS_INVALID_CONTENT,
    CAIRO_INT_STATUS_INVALID_FORMAT,
    CAIRO_INT_STATUS_INVALID_VISUAL,
    CAIRO_INT_STATUS_FILE_NOT_FOUND,
    CAIRO_INT_STATUS_INVALID_DASH,
    CAIRO_INT_STATUS_INVALID_DSC_COMMENT,
    CAIRO_INT_STATUS_INVALID_INDEX,
    CAIRO_INT_STATUS_CLIP_NOT_REPRESENTABLE,
    CAIRO_INT_STATUS_TEMP_FILE_ERROR,
    CAIRO_INT_STATUS_INVALID_STRIDE,
    CAIRO_INT_STATUS_FONT_TYPE_MISMATCH,
    CAIRO_INT_STATUS_USER_FONT_IMMUTABLE,
    CAIRO_INT_STATUS_USER_FONT_ERROR,
    CAIRO_INT_STATUS_NEGATIVE_COUNT,
    CAIRO_INT_STATUS_INVALID_CLUSTERS,
    CAIRO_INT_STATUS_INVALID_SLANT,
    CAIRO_INT_STATUS_INVALID_WEIGHT,
    CAIRO_INT_STATUS_INVALID_SIZE,
    CAIRO_INT_STATUS_USER_FONT_NOT_IMPLEMENTED,
    CAIRO_INT_STATUS_DEVICE_TYPE_MISMATCH,
    CAIRO_INT_STATUS_DEVICE_ERROR,
    CAIRO_INT_STATUS_INVALID_MESH_CONSTRUCTION,
    CAIRO_INT_STATUS_DEVICE_FINISHED,

    CAIRO_INT_STATUS_LAST_STATUS,

    CAIRO_INT_STATUS_UNSUPPORTED = 100,
    CAIRO_INT_STATUS_DEGENERATE,
    CAIRO_INT_STATUS_NOTHING_TO_DO,
    CAIRO_INT_STATUS_FLATTEN_TRANSPARENCY,
    CAIRO_INT_STATUS_IMAGE_FALLBACK,
    CAIRO_INT_STATUS_ANALYZE_RECORDING_SURFACE_PATTERN,
};

typedef enum _cairo_int_status cairo_int_status_t;







__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_error (cairo_status_t status);








# 75 "cairoint.h" 2
# 96 "cairoint.h"

# 181 "cairoint.h"
static inline int __attribute__((const))
_cairo_popcount (uint32_t mask)
{

    return __builtin_popcount (mask);







}

static inline __attribute__((always_inline)) cairo_bool_t
_cairo_is_little_endian (void)
{
    static const int i = 1;
    return *((char *) &i) == 0x01;
}
# 217 "cairoint.h"
static inline uint16_t __attribute__((const))
cpu_to_be16(uint16_t v)
{
    return (v << 8) | (v >> 8);
}

static inline uint16_t __attribute__((const))
be16_to_cpu(uint16_t v)
{
    return cpu_to_be16 (v);
}

static inline uint32_t __attribute__((const))
cpu_to_be32(uint32_t v)
{
    return (cpu_to_be16 (v) << 16) | cpu_to_be16 (v >> 16);
}

static inline uint32_t __attribute__((const))
be32_to_cpu(uint32_t v)
{
    return cpu_to_be32 (v);
}







static inline int __attribute__((const))
_cairo_isspace (int c)
{
    return (c == 0x20 || (c >= 0x09 && c <= 0x0d));
}

static inline int __attribute__((const))
_cairo_isdigit (int c)
{
    return (c >= '0' && c <= '9');
}


# 1 "cairo-cache-private.h" 1
# 86 "cairo-cache-private.h"
typedef struct _cairo_cache_entry {
    unsigned long hash;
    unsigned long size;
} cairo_cache_entry_t;

typedef cairo_bool_t (*cairo_cache_predicate_func_t) (const void *entry);

struct _cairo_cache {
    cairo_hash_table_t *hash_table;

    cairo_cache_predicate_func_t predicate;
    cairo_destroy_func_t entry_destroy;

    unsigned long max_size;
    unsigned long size;

    int freeze_count;
};

typedef cairo_bool_t
(*cairo_cache_keys_equal_func_t) (const void *key_a, const void *key_b);

typedef void
(*cairo_cache_callback_func_t) (void *entry,
    void *closure);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_cache_init (cairo_cache_t *cache,
            cairo_cache_keys_equal_func_t keys_equal,
     cairo_cache_predicate_func_t predicate,
     cairo_destroy_func_t entry_destroy,
     unsigned long max_size);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_cache_fini (cairo_cache_t *cache);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_cache_freeze (cairo_cache_t *cache);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_cache_thaw (cairo_cache_t *cache);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void *
_cairo_cache_lookup (cairo_cache_t *cache,
       cairo_cache_entry_t *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_cache_insert (cairo_cache_t *cache,
       cairo_cache_entry_t *entry);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_cache_remove (cairo_cache_t *cache,
       cairo_cache_entry_t *entry);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_cache_foreach (cairo_cache_t *cache,
        cairo_cache_callback_func_t cache_callback,
        void *closure);
# 261 "cairoint.h" 2

# 1 "cairo-spans-private.h" 1
# 38 "cairo-spans-private.h"
typedef struct _cairo_half_open_span {
    int32_t x;
    uint8_t coverage;
    uint8_t inverse;
} cairo_half_open_span_t;



typedef struct _cairo_span_renderer cairo_span_renderer_t;
struct _cairo_span_renderer {

    cairo_status_t status;


    cairo_destroy_func_t destroy;



    __attribute__((__warn_unused_result__)) cairo_status_t
    (*render_rows) (void *abstract_renderer,
      int y, int height,
      const cairo_half_open_span_t *coverages,
      unsigned num_coverages);




    cairo_status_t (*finish) (void *abstract_renderer);
};


typedef struct _cairo_scan_converter cairo_scan_converter_t;
struct _cairo_scan_converter {

    cairo_destroy_func_t destroy;




    cairo_status_t (*generate) (void *abstract_converter,
    cairo_span_renderer_t *renderer);


    cairo_status_t status;
};



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scan_converter_t *
_cairo_tor_scan_converter_create (int xmin,
      int ymin,
      int xmax,
      int ymax,
      cairo_fill_rule_t fill_rule,
      cairo_antialias_t antialias);
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_tor_scan_converter_add_polygon (void *converter,
           const cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scan_converter_t *
_cairo_tor22_scan_converter_create (int xmin,
        int ymin,
        int xmax,
        int ymax,
        cairo_fill_rule_t fill_rule,
        cairo_antialias_t antialias);
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_tor22_scan_converter_add_polygon (void *converter,
      const cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scan_converter_t *
_cairo_mono_scan_converter_create (int xmin,
       int ymin,
       int xmax,
       int ymax,
       cairo_fill_rule_t fill_rule);
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_mono_scan_converter_add_polygon (void *converter,
     const cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scan_converter_t *
_cairo_clip_tor_scan_converter_create (cairo_clip_t *clip,
           cairo_polygon_t *polygon,
           cairo_fill_rule_t fill_rule,
           cairo_antialias_t antialias);

typedef struct _cairo_rectangular_scan_converter {
    cairo_scan_converter_t base;

    cairo_box_t extents;

    struct _cairo_rectangular_scan_converter_chunk {
 struct _cairo_rectangular_scan_converter_chunk *next;
 void *base;
 int count;
 int size;
    } chunks, *tail;
    char buf[(512 * sizeof (int))];
    int num_rectangles;
} cairo_rectangular_scan_converter_t;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_rectangular_scan_converter_init (cairo_rectangular_scan_converter_t *self,
     const cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_rectangular_scan_converter_add_box (cairo_rectangular_scan_converter_t *self,
        const cairo_box_t *box,
        int dir);

typedef struct _cairo_botor_scan_converter {
    cairo_scan_converter_t base;

    cairo_box_t extents;
    cairo_fill_rule_t fill_rule;

    int xmin, xmax;

    struct _cairo_botor_scan_converter_chunk {
 struct _cairo_botor_scan_converter_chunk *next;
 void *base;
 int count;
 int size;
    } chunks, *tail;
    char buf[(512 * sizeof (int))];
    int num_edges;
} cairo_botor_scan_converter_t;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_botor_scan_converter_init (cairo_botor_scan_converter_t *self,
      const cairo_box_t *extents,
      cairo_fill_rule_t fill_rule);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scan_converter_t *
_cairo_scan_converter_create_in_error (cairo_status_t error);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scan_converter_status (void *abstract_converter);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scan_converter_set_error (void *abstract_converter,
     cairo_status_t error);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_span_renderer_t *
_cairo_span_renderer_create_in_error (cairo_status_t error);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_span_renderer_status (void *abstract_renderer);




__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_span_renderer_set_error (void *abstract_renderer,
    cairo_status_t error);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_composite_polygon (cairo_surface_t *surface,
      cairo_operator_t op,
      const cairo_pattern_t *pattern,
      cairo_fill_rule_t fill_rule,
      cairo_antialias_t antialias,
      const cairo_composite_rectangles_t *rects,
      cairo_polygon_t *polygon,
      cairo_region_t *clip_region);
# 263 "cairoint.h" 2
# 1 "cairo-surface-private.h" 1
# 46 "cairo-surface-private.h"
# 1 "cairo-clip-private.h" 1
# 42 "cairo-clip-private.h"
# 1 "cairo-boxes-private.h" 1
# 43 "cairo-boxes-private.h"
struct _cairo_boxes_t {
    cairo_status_t status;

    cairo_box_t limit;
    const cairo_box_t *limits;
    int num_limits;

    int num_boxes;

    unsigned int is_pixel_aligned;

    struct _cairo_boxes_chunk {
 struct _cairo_boxes_chunk *next;
 cairo_box_t *base;
 int count;
 int size;
    } chunks, *tail;
    cairo_box_t boxes_embedded[32];
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_init (cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_init_with_clip (cairo_boxes_t *boxes,
        cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_init_for_array (cairo_boxes_t *boxes,
        cairo_box_t *array,
        int num_boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_init_from_rectangle (cairo_boxes_t *boxes,
      int x, int y, int w, int h);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_limit (cairo_boxes_t *boxes,
      const cairo_box_t *limits,
      int num_limits);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_boxes_add (cairo_boxes_t *boxes,
    cairo_antialias_t antialias,
    const cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_extents (const cairo_boxes_t *boxes,
        cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_box_t *
_cairo_boxes_to_array (const cairo_boxes_t *boxes,
         int *num_boxes,
         cairo_bool_t force_allocation);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_boxes_intersect (const cairo_boxes_t *a,
   const cairo_boxes_t *b,
   cairo_boxes_t *out);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_clear (cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) cairo_bool_t
_cairo_boxes_for_each_box (cairo_boxes_t *boxes,
      cairo_bool_t (*func) (cairo_box_t *box, void *data),
      void *data);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_rasterise_polygon_to_boxes (cairo_polygon_t *polygon,
       cairo_fill_rule_t fill_rule,
       cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_fini (cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_print_boxes (FILE *stream,
     const cairo_boxes_t *boxes);
# 43 "cairo-clip-private.h" 2



# 1 "cairo-path-fixed-private.h" 1
# 48 "cairo-path-fixed-private.h"
enum cairo_path_op {
    CAIRO_PATH_OP_MOVE_TO = 0,
    CAIRO_PATH_OP_LINE_TO = 1,
    CAIRO_PATH_OP_CURVE_TO = 2,
    CAIRO_PATH_OP_CLOSE_PATH = 3
};


typedef char cairo_path_op_t;





typedef struct _cairo_path_buf {
    cairo_list_t link;
    unsigned int num_ops;
    unsigned int size_ops;
    unsigned int num_points;
    unsigned int size_points;

    cairo_path_op_t *op;
    cairo_point_t *points;
} cairo_path_buf_t;

typedef struct _cairo_path_buf_fixed {
    cairo_path_buf_t base;

    cairo_path_op_t op[((512 - sizeof (cairo_path_buf_t)) / (2 * sizeof (cairo_point_t) + sizeof (cairo_path_op_t)))];
    cairo_point_t points[2 * ((512 - sizeof (cairo_path_buf_t)) / (2 * sizeof (cairo_point_t) + sizeof (cairo_path_op_t)))];
} cairo_path_buf_fixed_t;
# 87 "cairo-path-fixed-private.h"
struct _cairo_path_fixed {
    cairo_point_t last_move_point;
    cairo_point_t current_point;
    unsigned int has_current_point : 1;
    unsigned int needs_move_to : 1;
    unsigned int has_extents : 1;
    unsigned int has_curve_to : 1;
    unsigned int stroke_is_rectilinear : 1;
    unsigned int fill_is_rectilinear : 1;
    unsigned int fill_maybe_region : 1;
    unsigned int fill_is_empty : 1;

    cairo_box_t extents;

    cairo_path_buf_fixed_t buf;
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_translate (cairo_path_fixed_t *path,
        cairo_fixed_t offx,
        cairo_fixed_t offy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_append (cairo_path_fixed_t *path,
     const cairo_path_fixed_t *other,
     cairo_fixed_t tx,
     cairo_fixed_t ty);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) unsigned long
_cairo_path_fixed_hash (const cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) unsigned long
_cairo_path_fixed_size (const cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_equal (const cairo_path_fixed_t *a,
    const cairo_path_fixed_t *b);

typedef struct _cairo_path_fixed_iter {
    const cairo_path_buf_t *first;
    const cairo_path_buf_t *buf;
    unsigned int n_op;
    unsigned int n_point;
} cairo_path_fixed_iter_t;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_iter_init (cairo_path_fixed_iter_t *iter,
        const cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_iter_is_fill_box (cairo_path_fixed_iter_t *_iter,
        cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_iter_at_end (const cairo_path_fixed_iter_t *iter);

static inline cairo_bool_t
_cairo_path_fixed_fill_is_empty (const cairo_path_fixed_t *path)
{
    return path->fill_is_empty;
}

static inline cairo_bool_t
_cairo_path_fixed_fill_is_rectilinear (const cairo_path_fixed_t *path)
{
    if (! path->fill_is_rectilinear)
 return 0;

    if (! path->has_current_point || path->needs_move_to)
 return 1;


    return path->current_point.x == path->last_move_point.x ||
    path->current_point.y == path->last_move_point.y;
}

static inline cairo_bool_t
_cairo_path_fixed_stroke_is_rectilinear (const cairo_path_fixed_t *path)
{
    return path->stroke_is_rectilinear;
}

static inline cairo_bool_t
_cairo_path_fixed_fill_maybe_region (const cairo_path_fixed_t *path)
{
    if (! path->fill_maybe_region)
 return 0;

    if (! path->has_current_point || path->needs_move_to)
 return 1;




    return path->current_point.x == path->last_move_point.x ||
    path->current_point.y == path->last_move_point.y;
}

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_is_stroke_box (const cairo_path_fixed_t *path,
     cairo_box_t *box);
# 47 "cairo-clip-private.h" 2


extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_rectangle_list_t _cairo_rectangles_nil;

struct _cairo_clip_path {
    cairo_reference_count_t ref_count;
    cairo_path_fixed_t path;
    cairo_fill_rule_t fill_rule;
    double tolerance;
    cairo_antialias_t antialias;
    cairo_clip_path_t *prev;
};

struct _cairo_clip {
    cairo_rectangle_int_t extents;
    cairo_clip_path_t *path;

    cairo_box_t *boxes;
    int num_boxes;

    cairo_region_t *region;
    cairo_bool_t is_region;

    cairo_box_t embedded_box;
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_create (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_path_t *
_cairo_clip_path_reference (cairo_clip_path_t *clip_path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_clip_path_destroy (cairo_clip_path_t *clip_path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_clip_destroy (cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern const cairo_clip_t __cairo_clip_all;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_copy (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_copy_region (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_copy_path (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_translate (cairo_clip_t *clip, int tx, int ty);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_transform (cairo_clip_t *clip, const cairo_matrix_t *m);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_copy_with_translation (const cairo_clip_t *clip, int tx, int ty);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_equal (const cairo_clip_t *clip_a,
     const cairo_clip_t *clip_b);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_rectangle (cairo_clip_t *clip,
     const cairo_rectangle_int_t *rectangle);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_clip (cairo_clip_t *clip,
       const cairo_clip_t *other);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_box (cairo_clip_t *clip,
      const cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_boxes (cairo_clip_t *clip,
        const cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_rectilinear_path (cairo_clip_t *clip,
     const cairo_path_fixed_t *path,
     cairo_fill_rule_t fill_rule,
     cairo_antialias_t antialias);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_intersect_path (cairo_clip_t *clip,
       const cairo_path_fixed_t *path,
       cairo_fill_rule_t fill_rule,
       double tolerance,
       cairo_antialias_t antialias);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) const cairo_rectangle_int_t *
_cairo_clip_get_extents (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_clip_get_surface (const cairo_clip_t *clip, cairo_surface_t *dst, int *tx, int *ty);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_clip_get_image (const cairo_clip_t *clip,
         cairo_surface_t *target,
         const cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_clip_combine_with_surface (const cairo_clip_t *clip,
      cairo_surface_t *dst,
      int dst_x, int dst_y);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_from_boxes (const cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_region_t *
_cairo_clip_get_region (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_is_region (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_reduce_to_rectangle (const cairo_clip_t *clip,
     const cairo_rectangle_int_t *r);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_clip_t *
_cairo_clip_reduce_for_composite (const cairo_clip_t *clip,
      cairo_composite_rectangles_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_contains_rectangle (const cairo_clip_t *clip,
    const cairo_rectangle_int_t *rect);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_contains_box (const cairo_clip_t *clip,
     const cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_contains_extents (const cairo_clip_t *clip,
         const cairo_composite_rectangles_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_rectangle_list_t*
_cairo_clip_copy_rectangle_list (cairo_clip_t *clip, cairo_gstate_t *gstate);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_rectangle_list_t *
_cairo_rectangle_list_create_in_error (cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_clip_is_polygon (const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_clip_get_polygon (const cairo_clip_t *clip,
    cairo_polygon_t *polygon,
    cairo_fill_rule_t *fill_rule,
    cairo_antialias_t *antialias);
# 47 "cairo-surface-private.h" 2
# 1 "cairo-surface-backend-private.h" 1
# 44 "cairo-surface-backend-private.h"


struct _cairo_surface_backend {
    cairo_surface_type_t type;

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*finish) (void *surface);

    cairo_t *
    (*create_context) (void *surface);

    cairo_surface_t *
    (*create_similar) (void *surface,
     cairo_content_t content,
     int width,
     int height);
    cairo_surface_t *
    (*create_similar_image) (void *surface,
     cairo_format_t format,
     int width,
     int height);

    cairo_image_surface_t *
    (*map_to_image) (void *surface,
     const cairo_rectangle_int_t *extents);
    cairo_int_status_t
    (*unmap_image) (void *surface,
     cairo_image_surface_t *image);

    cairo_surface_t *
    (*source) (void *abstract_surface,
     cairo_rectangle_int_t *extents);

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*acquire_source_image) (void *abstract_surface,
     cairo_image_surface_t **image_out,
     void **image_extra);

    __attribute__((__warn_unused_result__)) void
    (*release_source_image) (void *abstract_surface,
     cairo_image_surface_t *image_out,
     void *image_extra);

    cairo_surface_t *
    (*snapshot) (void *surface);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*copy_page) (void *surface);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*show_page) (void *surface);
# 104 "cairo-surface-backend-private.h"
    cairo_bool_t
    (*get_extents) (void *surface,
     cairo_rectangle_int_t *extents);

    void
    (*get_font_options) (void *surface,
     cairo_font_options_t *options);

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*flush) (void *surface,
     unsigned flags);

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*mark_dirty_rectangle) (void *surface,
     int x,
     int y,
     int width,
     int height);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*paint) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const cairo_clip_t *clip);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*mask) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const cairo_pattern_t *mask,
     const cairo_clip_t *clip);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*stroke) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const cairo_path_fixed_t *path,
     const cairo_stroke_style_t *style,
     const cairo_matrix_t *ctm,
     const cairo_matrix_t *ctm_inverse,
     double tolerance,
     cairo_antialias_t antialias,
     const cairo_clip_t *clip);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*fill) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const cairo_path_fixed_t *path,
     cairo_fill_rule_t fill_rule,
     double tolerance,
     cairo_antialias_t antialias,
     const cairo_clip_t *clip);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*fill_stroke) (void *surface,
     cairo_operator_t fill_op,
     const cairo_pattern_t *fill_source,
     cairo_fill_rule_t fill_rule,
     double fill_tolerance,
     cairo_antialias_t fill_antialias,
     const cairo_path_fixed_t*path,
     cairo_operator_t stroke_op,
     const cairo_pattern_t *stroke_source,
     const cairo_stroke_style_t *stroke_style,
     const cairo_matrix_t *stroke_ctm,
     const cairo_matrix_t *stroke_ctm_inverse,
     double stroke_tolerance,
     cairo_antialias_t stroke_antialias,
     const cairo_clip_t *clip);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*show_glyphs) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     cairo_glyph_t *glyphs,
     int num_glyphs,
     cairo_scaled_font_t *scaled_font,
     const cairo_clip_t *clip);

    cairo_bool_t
    (*has_show_text_glyphs) (void *surface);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*show_text_glyphs) (void *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const char *utf8,
     int utf8_len,
     cairo_glyph_t *glyphs,
     int num_glyphs,
     const cairo_text_cluster_t *clusters,
     int num_clusters,
     cairo_text_cluster_flags_t cluster_flags,
     cairo_scaled_font_t *scaled_font,
     const cairo_clip_t *clip);

    const char **
    (*get_supported_mime_types) (void *surface);
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_default_acquire_source_image (void *surface,
          cairo_image_surface_t **image_out,
          void **image_extra);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_default_release_source_image (void *surface,
          cairo_image_surface_t *image,
          void *image_extra);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_default_source (void *surface,
          cairo_rectangle_int_t *extents);


# 48 "cairo-surface-private.h" 2

typedef void (*cairo_surface_func_t) (cairo_surface_t *);

struct _cairo_surface {
    const cairo_surface_backend_t *backend;
    cairo_device_t *device;




    cairo_surface_type_t type;

    cairo_content_t content;

    cairo_reference_count_t ref_count;
    cairo_status_t status;
    unsigned int unique_id;
    unsigned int serial;
    cairo_damage_t *damage;

    unsigned _finishing : 1;
    unsigned finished : 1;
    unsigned is_clear : 1;
    unsigned has_font_options : 1;
    unsigned owns_device : 1;

    cairo_user_data_array_t user_data;
    cairo_user_data_array_t mime_data;

    cairo_matrix_t device_transform;
    cairo_matrix_t device_transform_inverse;
    cairo_list_t device_transform_observers;


    double x_resolution;
    double y_resolution;





    double x_fallback_resolution;
    double y_fallback_resolution;


    cairo_surface_t *snapshot_of;
    cairo_surface_func_t snapshot_detach;

    cairo_list_t snapshots;

    cairo_list_t snapshot;






    cairo_font_options_t font_options;
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_create_in_error (cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_int_surface_create_in_error (cairo_int_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_get_source (cairo_surface_t *surface,
      cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_flush (cairo_surface_t *surface, unsigned flags);
# 264 "cairoint.h" 2

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_box_from_doubles (cairo_box_t *box,
    double *x1, double *y1,
    double *x2, double *y2);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_box_to_doubles (const cairo_box_t *box,
         double *x1, double *y1,
         double *x2, double *y2);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_box_from_rectangle (cairo_box_t *box,
      const cairo_rectangle_int_t *rectangle);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_box_round_to_rectangle (const cairo_box_t *box,
          cairo_rectangle_int_t *rectangle);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_box_add_curve_to (cairo_box_t *extents,
    const cairo_point_t *a,
    const cairo_point_t *b,
    const cairo_point_t *c,
    const cairo_point_t *d);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_boxes_get_extents (const cairo_box_t *boxes,
     int num_boxes,
     cairo_box_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern const cairo_rectangle_int_t _cairo_empty_rectangle;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern const cairo_rectangle_int_t _cairo_unbounded_rectangle;

static inline void
_cairo_unbounded_rectangle_init (cairo_rectangle_int_t *rect)
{
    *rect = _cairo_unbounded_rectangle;
}

__attribute__((__visibility__("hidden"))) cairo_bool_t
_cairo_rectangle_intersect (cairo_rectangle_int_t *dst,
       const cairo_rectangle_int_t *src);

static inline cairo_bool_t
_cairo_rectangle_intersects (const cairo_rectangle_int_t *dst,
        const cairo_rectangle_int_t *src)
{
    return !(src->x >= dst->x + (int) dst->width ||
      src->x + (int) src->width <= dst->x ||
      src->y >= dst->y + (int) dst->height ||
      src->y + (int) src->height <= dst->y);
}

static inline cairo_bool_t
_cairo_rectangle_contains_rectangle (const cairo_rectangle_int_t *a,
         const cairo_rectangle_int_t *b)
{
    return (a->x <= b->x &&
     a->x + (int) a->width >= b->x + (int) b->width &&
     a->y <= b->y &&
     a->y + (int) a->height >= b->y + (int) b->height);
}

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_rectangle_int_from_double (cairo_rectangle_int_t *recti,
      const cairo_rectangle_t *rectf);




__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_rectangle_union (cairo_rectangle_int_t *dst,
   const cairo_rectangle_int_t *src);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_box_intersects_line_segment (cairo_box_t *box,
                             cairo_line_t *line) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_spline_intersects (const cairo_point_t *a,
     const cairo_point_t *b,
     const cairo_point_t *c,
     const cairo_point_t *d,
     const cairo_box_t *box) __attribute__((pure));

typedef struct {
    const cairo_user_data_key_t *key;
    void *user_data;
    cairo_destroy_func_t destroy;
} cairo_user_data_slot_t;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_user_data_array_init (cairo_user_data_array_t *array);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_user_data_array_fini (cairo_user_data_array_t *array);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void *
_cairo_user_data_array_get_data (cairo_user_data_array_t *array,
     const cairo_user_data_key_t *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_user_data_array_set_data (cairo_user_data_array_t *array,
     const cairo_user_data_key_t *key,
     void *user_data,
     cairo_destroy_func_t destroy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_user_data_array_copy (cairo_user_data_array_t *dst,
        const cairo_user_data_array_t *src);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_user_data_array_foreach (cairo_user_data_array_t *array,
    void (*func) (const void *key,
           void *elt,
           void *closure),
    void *closure);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) unsigned long
_cairo_hash_string (const char *c);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) unsigned long
_cairo_hash_bytes (unsigned long hash,
     const void *bytes,
     unsigned int length);




# 1 "cairo-scaled-font-private.h" 1
# 45 "cairo-scaled-font-private.h"
# 1 "cairo-mutex-type-private.h" 1
# 45 "cairo-mutex-type-private.h"
# 1 "cairo-mutex-impl-private.h" 1
# 47 "cairo-mutex-impl-private.h"
# 1 "../config.h" 1
# 48 "cairo-mutex-impl-private.h" 2
# 163 "cairo-mutex-impl-private.h"
  typedef int cairo_mutex_impl_t;
# 173 "cairo-mutex-impl-private.h"
  typedef int cairo_recursive_mutex_impl_t;
# 46 "cairo-mutex-type-private.h" 2
# 161 "cairo-mutex-type-private.h"
typedef cairo_mutex_impl_t cairo_mutex_t;
typedef cairo_recursive_mutex_impl_t cairo_recursive_mutex_t;
# 46 "cairo-scaled-font-private.h" 2




typedef struct _cairo_scaled_glyph_page cairo_scaled_glyph_page_t;

struct _cairo_scaled_font {
# 83 "cairo-scaled-font-private.h"
    cairo_hash_entry_t hash_entry;


    cairo_status_t status;
    cairo_reference_count_t ref_count;
    cairo_user_data_array_t user_data;

    cairo_font_face_t *original_font_face;


    cairo_font_face_t *font_face;
    cairo_matrix_t font_matrix;
    cairo_matrix_t ctm;
    cairo_font_options_t options;

    unsigned int placeholder : 1;
    unsigned int holdover : 1;
    unsigned int finished : 1;


    cairo_matrix_t scale;
    cairo_matrix_t scale_inverse;
    double max_scale;
    cairo_font_extents_t extents;
    cairo_font_extents_t fs_extents;


    cairo_mutex_t mutex;

    cairo_hash_table_t *glyphs;
    cairo_list_t glyph_pages;
    cairo_bool_t cache_frozen;
    cairo_bool_t global_cache_frozen;

    cairo_list_t dev_privates;


    const cairo_scaled_font_backend_t *backend;
    cairo_list_t link;
};

struct _cairo_scaled_font_private {
    cairo_list_t link;
    const void *key;
    void (*destroy) (cairo_scaled_font_private_t *,
       cairo_scaled_font_t *);
};

struct _cairo_scaled_glyph {
    cairo_hash_entry_t hash_entry;

    cairo_text_extents_t metrics;
    cairo_text_extents_t fs_metrics;
    cairo_box_t bbox;
    int16_t x_advance;
    int16_t y_advance;

    unsigned int has_info;
    cairo_image_surface_t *surface;
    cairo_path_fixed_t *path;
    cairo_surface_t *recording_surface;

    const void *dev_private_key;
    void *dev_private;
    cairo_list_t dev_privates;
};

struct _cairo_scaled_glyph_private {
    cairo_list_t link;
    const void *key;
    void (*destroy) (cairo_scaled_glyph_private_t *,
       cairo_scaled_glyph_t *,
       cairo_scaled_font_t *);
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scaled_font_private_t *
_cairo_scaled_font_find_private (cairo_scaled_font_t *scaled_font,
     const void *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_attach_private (cairo_scaled_font_t *scaled_font,
       cairo_scaled_font_private_t *priv,
       const void *key,
       void (*destroy) (cairo_scaled_font_private_t *,
          cairo_scaled_font_t *));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scaled_glyph_private_t *
_cairo_scaled_glyph_find_private (cairo_scaled_glyph_t *scaled_glyph,
     const void *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_glyph_attach_private (cairo_scaled_glyph_t *scaled_glyph,
       cairo_scaled_glyph_private_t *priv,
       const void *key,
       void (*destroy) (cairo_scaled_glyph_private_t *,
          cairo_scaled_glyph_t *,
          cairo_scaled_font_t *));


# 397 "cairoint.h" 2

struct _cairo_font_face {

    cairo_hash_entry_t hash_entry;
    cairo_status_t status;
    cairo_reference_count_t ref_count;
    cairo_user_data_array_t user_data;
    const cairo_font_face_backend_t *backend;
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_default_context_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_toy_font_face_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_ft_font_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_win32_font_reset_static_data (void);
# 426 "cairoint.h"
struct _cairo_unscaled_font_backend {
    void (*destroy) (void *unscaled_font);
};





typedef struct _cairo_toy_font_face {
    cairo_font_face_t base;
    const char *family;
    cairo_bool_t owns_family;
    cairo_font_slant_t slant;
    cairo_font_weight_t weight;

    cairo_font_face_t *impl_face;
} cairo_toy_font_face_t;

typedef enum _cairo_scaled_glyph_info {
    CAIRO_SCALED_GLYPH_INFO_METRICS = (1 << 0),
    CAIRO_SCALED_GLYPH_INFO_SURFACE = (1 << 1),
    CAIRO_SCALED_GLYPH_INFO_PATH = (1 << 2),
    CAIRO_SCALED_GLYPH_INFO_RECORDING_SURFACE = (1 << 3)
} cairo_scaled_glyph_info_t;

typedef struct _cairo_scaled_font_subset {
    cairo_scaled_font_t *scaled_font;
    unsigned int font_id;
    unsigned int subset_id;




    unsigned long *glyphs;
    char **utf8;
    char **glyph_names;
    int *to_latin_char;
    unsigned long *latin_to_subset_glyph_index;
    unsigned int num_glyphs;
    cairo_bool_t is_composite;
    cairo_bool_t is_scaled;
    cairo_bool_t is_latin;
} cairo_scaled_font_subset_t;

struct _cairo_scaled_font_backend {
    cairo_font_type_t type;

    void
    (*fini) (void *scaled_font);

    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*scaled_glyph_init) (void *scaled_font,
     cairo_scaled_glyph_t *scaled_glyph,
     cairo_scaled_glyph_info_t info);





    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*text_to_glyphs) (void *scaled_font,
         double x,
         double y,
         const char *utf8,
         int utf8_len,
         cairo_glyph_t **glyphs,
         int *num_glyphs,
         cairo_text_cluster_t **clusters,
         int *num_clusters,
         cairo_text_cluster_flags_t *cluster_flags);

    unsigned long
    (*ucs4_to_index) (void *scaled_font,
     uint32_t ucs4);
# 519 "cairoint.h"
    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*load_truetype_table)(void *scaled_font,
                           unsigned long tag,
                           long offset,
                           unsigned char *buffer,
                           unsigned long *length);



    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*index_to_ucs4)(void *scaled_font,
       unsigned long index,
                     uint32_t *ucs4);

    __attribute__((__warn_unused_result__)) cairo_bool_t
    (*is_synthetic)(void *scaled_font);
# 548 "cairoint.h"
    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*index_to_glyph_name)(void *scaled_font,
      char **glyph_names,
      int num_glyph_names,
      unsigned long glyph_index,
      unsigned long *glyph_array_index);
# 569 "cairoint.h"
    __attribute__((__warn_unused_result__)) cairo_int_status_t
    (*load_type1_data) (void *scaled_font,
                           long offset,
                           unsigned char *buffer,
                           unsigned long *length);
};

struct _cairo_font_face_backend {
    cairo_font_type_t type;

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*create_for_toy) (cairo_toy_font_face_t *toy_face,
   cairo_font_face_t **font_face);




    void
    (*destroy) (void *font_face);

    __attribute__((__warn_unused_result__)) cairo_status_t
    (*scaled_font_create) (void *font_face,
      const cairo_matrix_t *font_matrix,
      const cairo_matrix_t *ctm,
      const cairo_font_options_t *options,
      cairo_scaled_font_t **scaled_font);

    cairo_font_face_t *
    (*get_implementation) (void *font_face,
      const cairo_matrix_t *font_matrix,
      const cairo_matrix_t *ctm,
      const cairo_font_options_t *options);
};

extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) struct _cairo_font_face_backend _cairo_user_font_face_backend;
# 628 "cairoint.h"
extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_solid_pattern_t _cairo_pattern_clear;
extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_solid_pattern_t _cairo_pattern_black;
extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_solid_pattern_t _cairo_pattern_white;

struct _cairo_surface_attributes {
    cairo_matrix_t matrix;
    cairo_extend_t extend;
    cairo_filter_t filter;
    cairo_bool_t has_component_alpha;
    int x_offset;
    int y_offset;
    void *extra;
};
# 684 "cairoint.h"
typedef struct _cairo_stroke_face {
    cairo_point_t ccw;
    cairo_point_t point;
    cairo_point_t cw;
    cairo_slope_t dev_vector;
    cairo_point_double_t dev_slope;
    cairo_point_double_t usr_vector;
    double length;
} cairo_stroke_face_t;



static inline double __attribute__((const))
_cairo_restrict_value (double value, double min, double max)
{
    if (value < min)
 return min;
    else if (value > max)
 return max;
    else
 return value;
}




static inline double __attribute__((const))
_cairo_round (double r)
{
    return floor (r + .5);
}





static inline int __attribute__((const))
_cairo_lround (double r)
{
    return _cairo_round (r);
}


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) uint16_t
_cairo_half_from_float (float f) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_operator_bounded_by_mask (cairo_operator_t op) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_operator_bounded_by_source (cairo_operator_t op) __attribute__((const));

enum {
    CAIRO_OPERATOR_BOUND_BY_MASK = 1 << 1,
    CAIRO_OPERATOR_BOUND_BY_SOURCE = 1 << 2,
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) uint32_t
_cairo_operator_bounded_by_either (cairo_operator_t op) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) const cairo_color_t *
_cairo_stock_color (cairo_stock_t stock) __attribute__((pure));





__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) uint16_t
_cairo_color_double_to_short (double d) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_color_init_rgba (cairo_color_t *color,
   double red, double green, double blue,
   double alpha);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_color_multiply_alpha (cairo_color_t *color,
        double alpha);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_color_get_rgba (cairo_color_t *color,
         double *red,
         double *green,
         double *blue,
         double *alpha);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_color_get_rgba_premultiplied (cairo_color_t *color,
         double *red,
         double *green,
         double *blue,
         double *alpha);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_color_equal (const cairo_color_t *color_a,
                    const cairo_color_t *color_b) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_color_stop_equal (const cairo_color_stop_t *color_a,
    const cairo_color_stop_t *color_b) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_content_t
_cairo_color_get_content (const cairo_color_t *color) __attribute__((pure));



extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_font_face_t _cairo_font_face_nil;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_font_face_init (cairo_font_face_t *font_face,
         const cairo_font_face_backend_t *backend);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_font_face_set_error (cairo_font_face_t *font_face,
                     cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_unscaled_font_init (cairo_unscaled_font_t *font,
      const cairo_unscaled_font_backend_t *backend);

__attribute__((__visibility__("hidden"))) cairo_unscaled_font_t *
_cairo_unscaled_font_reference (cairo_unscaled_font_t *font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_unscaled_font_destroy (cairo_unscaled_font_t *font);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_font_face_t *
_cairo_font_face_twin_create_fallback (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_font_face_twin_create_for_toy (cairo_toy_font_face_t *toy_face,
          cairo_font_face_t **font_face);



extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int8_t _cairo_twin_outlines[];
extern const __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) uint16_t _cairo_twin_charmap[128];



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_font_options_init_default (cairo_font_options_t *options);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_font_options_init_copy (cairo_font_options_t *options,
          const cairo_font_options_t *other);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_font_options_set_lcd_filter (cairo_font_options_t *options,
       cairo_lcd_filter_t lcd_filter);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_lcd_filter_t
_cairo_font_options_get_lcd_filter (const cairo_font_options_t *options);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_font_options_set_round_glyph_positions (cairo_font_options_t *options,
            cairo_round_glyph_positions_t round);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_round_glyph_positions_t
_cairo_font_options_get_round_glyph_positions (const cairo_font_options_t *options);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_hull_compute (cairo_pen_vertex_t *vertices, int *num_vertices);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) unsigned char *
_cairo_lzw_compress (unsigned char *data, unsigned long *size_in_out);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_validate_text_clusters (const char *utf8,
          int utf8_len,
          const cairo_glyph_t *glyphs,
          int num_glyphs,
          const cairo_text_cluster_t *clusters,
          int num_clusters,
          cairo_text_cluster_flags_t cluster_flags);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_intern_string (const char **str_inout, int len);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_intern_string_reset_static_data (void);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_path_fixed_t *
_cairo_path_fixed_create (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_init (cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_init_copy (cairo_path_fixed_t *path,
        const cairo_path_fixed_t *other);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_fini (cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_destroy (cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_move_to (cairo_path_fixed_t *path,
      cairo_fixed_t x,
      cairo_fixed_t y);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_new_sub_path (cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_rel_move_to (cairo_path_fixed_t *path,
          cairo_fixed_t dx,
          cairo_fixed_t dy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_line_to (cairo_path_fixed_t *path,
      cairo_fixed_t x,
      cairo_fixed_t y);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_rel_line_to (cairo_path_fixed_t *path,
          cairo_fixed_t dx,
          cairo_fixed_t dy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_curve_to (cairo_path_fixed_t *path,
       cairo_fixed_t x0, cairo_fixed_t y0,
       cairo_fixed_t x1, cairo_fixed_t y1,
       cairo_fixed_t x2, cairo_fixed_t y2);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_rel_curve_to (cairo_path_fixed_t *path,
    cairo_fixed_t dx0, cairo_fixed_t dy0,
    cairo_fixed_t dx1, cairo_fixed_t dy1,
    cairo_fixed_t dx2, cairo_fixed_t dy2);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_close_path (cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_get_current_point (cairo_path_fixed_t *path,
         cairo_fixed_t *x,
         cairo_fixed_t *y);

typedef cairo_status_t
(cairo_path_fixed_move_to_func_t) (void *closure,
       const cairo_point_t *point);

typedef cairo_status_t
(cairo_path_fixed_line_to_func_t) (void *closure,
       const cairo_point_t *point);

typedef cairo_status_t
(cairo_path_fixed_curve_to_func_t) (void *closure,
        const cairo_point_t *p0,
        const cairo_point_t *p1,
        const cairo_point_t *p2);

typedef cairo_status_t
(cairo_path_fixed_close_path_func_t) (void *closure);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_interpret (const cairo_path_fixed_t *path,
         cairo_path_fixed_move_to_func_t *move_to,
         cairo_path_fixed_line_to_func_t *line_to,
         cairo_path_fixed_curve_to_func_t *curve_to,
         cairo_path_fixed_close_path_func_t *close_path,
         void *closure);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_interpret_flat (const cairo_path_fixed_t *path,
         cairo_path_fixed_move_to_func_t *move_to,
         cairo_path_fixed_line_to_func_t *line_to,
         cairo_path_fixed_close_path_func_t *close_path,
         void *closure,
         double tolerance);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_bounder_extents (const cairo_path_fixed_t *path,
        cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_extents (const cairo_path_fixed_t *path,
      cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_approximate_clip_extents (const cairo_path_fixed_t *path,
         cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_approximate_fill_extents (const cairo_path_fixed_t *path,
         cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_fill_extents (const cairo_path_fixed_t *path,
    cairo_fill_rule_t fill_rule,
    double tolerance,
    cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_approximate_stroke_extents (const cairo_path_fixed_t *path,
           const cairo_stroke_style_t *style,
           const cairo_matrix_t *ctm,
           cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_stroke_extents (const cairo_path_fixed_t *path,
      const cairo_stroke_style_t *style,
      const cairo_matrix_t *ctm,
      const cairo_matrix_t *ctm_inverse,
      double tolerance,
      cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_path_fixed_transform (cairo_path_fixed_t *path,
        const cairo_matrix_t *matrix);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_is_box (const cairo_path_fixed_t *path,
                          cairo_box_t *box);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_is_rectangle (const cairo_path_fixed_t *path,
    cairo_box_t *box);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_path_fixed_in_fill (const cairo_path_fixed_t *path,
      cairo_fill_rule_t fill_rule,
      double tolerance,
      double x,
      double y);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_fill_to_polygon (const cairo_path_fixed_t *path,
       double tolerance,
       cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_fill_rectilinear_to_polygon (const cairo_path_fixed_t *path,
            cairo_antialias_t antialias,
            cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_fill_rectilinear_to_boxes (const cairo_path_fixed_t *path,
          cairo_fill_rule_t fill_rule,
          cairo_antialias_t antialias,
          cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_region_t *
_cairo_path_fixed_fill_rectilinear_to_region (const cairo_path_fixed_t *path,
           cairo_fill_rule_t fill_rule,
           const cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_fill_to_traps (const cairo_path_fixed_t *path,
     cairo_fill_rule_t fill_rule,
     double tolerance,
     cairo_traps_t *traps);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_stroke_to_polygon (const cairo_path_fixed_t *path,
         const cairo_stroke_style_t *stroke_style,
         const cairo_matrix_t *ctm,
         const cairo_matrix_t *ctm_inverse,
         double tolerance,
         cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_path_fixed_stroke_to_tristrip (const cairo_path_fixed_t *path,
          const cairo_stroke_style_t*style,
          const cairo_matrix_t *ctm,
          const cairo_matrix_t *ctm_inverse,
          double tolerance,
          cairo_tristrip_t *strip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_stroke_dashed_to_polygon (const cairo_path_fixed_t *path,
         const cairo_stroke_style_t *stroke_style,
         const cairo_matrix_t *ctm,
         const cairo_matrix_t *ctm_inverse,
         double tolerance,
         cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_path_fixed_stroke_rectilinear_to_boxes (const cairo_path_fixed_t *path,
            const cairo_stroke_style_t *stroke_style,
            const cairo_matrix_t *ctm,
            cairo_antialias_t antialias,
            cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_path_fixed_stroke_to_traps (const cairo_path_fixed_t *path,
       const cairo_stroke_style_t *stroke_style,
       const cairo_matrix_t *ctm,
       const cairo_matrix_t *ctm_inverse,
       double tolerance,
       cairo_traps_t *traps);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_path_fixed_stroke_to_shaper (cairo_path_fixed_t *path,
       const cairo_stroke_style_t *stroke_style,
       const cairo_matrix_t *ctm,
       const cairo_matrix_t *ctm_inverse,
       double tolerance,
       cairo_status_t (*add_triangle) (void *closure,
           const cairo_point_t triangle[3]),
       cairo_status_t (*add_triangle_fan) (void *closure,
               const cairo_point_t *midpt,
               const cairo_point_t *points,
               int npoints),
       cairo_status_t (*add_quad) (void *closure,
              const cairo_point_t quad[4]),
       void *closure);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_freeze_cache (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_thaw_cache (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_reset_cache (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_set_error (cairo_scaled_font_t *scaled_font,
         cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_scaled_font_t *
_cairo_scaled_font_create_in_error (cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_register_placeholder_and_unlock_font_map (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_unregister_placeholder_and_lock_font_map (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_init (cairo_scaled_font_t *scaled_font,
    cairo_font_face_t *font_face,
    const cairo_matrix_t *font_matrix,
    const cairo_matrix_t *ctm,
    const cairo_font_options_t *options,
    const cairo_scaled_font_backend_t *backend);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_set_metrics (cairo_scaled_font_t *scaled_font,
    cairo_font_extents_t *fs_metrics);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_fini (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_font_extents (cairo_scaled_font_t *scaled_font,
     cairo_font_extents_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_glyph_device_extents (cairo_scaled_font_t *scaled_font,
      const cairo_glyph_t *glyphs,
      int num_glyphs,
      cairo_rectangle_int_t *extents,
      cairo_bool_t *overlap);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_scaled_font_glyph_approximate_extents (cairo_scaled_font_t *scaled_font,
           const cairo_glyph_t *glyphs,
           int num_glyphs,
           cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_show_glyphs (cairo_scaled_font_t *scaled_font,
    cairo_operator_t op,
    const cairo_pattern_t *source,
    cairo_surface_t *surface,
    int source_x,
    int source_y,
    int dest_x,
    int dest_y,
    unsigned int width,
    unsigned int height,
    cairo_glyph_t *glyphs,
    int num_glyphs,
    cairo_region_t *clip_region);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_scaled_font_glyph_path (cairo_scaled_font_t *scaled_font,
          const cairo_glyph_t *glyphs,
          int num_glyphs,
          cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_glyph_set_metrics (cairo_scaled_glyph_t *scaled_glyph,
     cairo_scaled_font_t *scaled_font,
     cairo_text_extents_t *fs_metrics);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_glyph_set_surface (cairo_scaled_glyph_t *scaled_glyph,
     cairo_scaled_font_t *scaled_font,
     cairo_image_surface_t *surface);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_glyph_set_path (cairo_scaled_glyph_t *scaled_glyph,
         cairo_scaled_font_t *scaled_font,
         cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_glyph_set_recording_surface (cairo_scaled_glyph_t *scaled_glyph,
                                           cairo_scaled_font_t *scaled_font,
                                           cairo_surface_t *recording_surface);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_scaled_glyph_lookup (cairo_scaled_font_t *scaled_font,
       unsigned long index,
       cairo_scaled_glyph_info_t info,
       cairo_scaled_glyph_t **scaled_glyph_ret);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) double
_cairo_scaled_font_get_max_scale (cairo_scaled_font_t *scaled_font);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_scaled_font_map_destroy (void);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_stroke_style_init (cairo_stroke_style_t *style);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_stroke_style_init_copy (cairo_stroke_style_t *style,
          const cairo_stroke_style_t *other);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_stroke_style_fini (cairo_stroke_style_t *style);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_stroke_style_max_distance_from_path (const cairo_stroke_style_t *style,
         const cairo_path_fixed_t *path,
                                            const cairo_matrix_t *ctm,
                                            double *dx, double *dy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) double
_cairo_stroke_style_dash_period (const cairo_stroke_style_t *style);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) double
_cairo_stroke_style_dash_stroked (const cairo_stroke_style_t *style);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_stroke_style_dash_can_approximate (const cairo_stroke_style_t *style,
       const cairo_matrix_t *ctm,
       double tolerance);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_stroke_style_dash_approximate (const cairo_stroke_style_t *style,
          const cairo_matrix_t *ctm,
          double tolerance,
          double *dash_offset,
          double *dashes,
          unsigned int *num_dashes);




__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_copy_mime_data (cairo_surface_t *dst,
          cairo_surface_t *src);

__attribute__((__visibility__("hidden"))) cairo_int_status_t
_cairo_surface_set_error (cairo_surface_t *surface,
     cairo_int_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_set_resolution (cairo_surface_t *surface,
                               double x_res,
                               double y_res);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_create_similar_scratch (cairo_surface_t *other,
           cairo_content_t content,
           int width,
           int height);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_create_for_rectangle_int (cairo_surface_t *target,
      const cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_create_similar_solid (cairo_surface_t *other,
         cairo_content_t content,
         int width,
         int height,
         const cairo_color_t *color);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_init (cairo_surface_t *surface,
       const cairo_surface_backend_t *backend,
       cairo_device_t *device,
       cairo_content_t content);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_set_font_options (cairo_surface_t *surface,
     cairo_font_options_t *options);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_paint (cairo_surface_t *surface,
        cairo_operator_t op,
        const cairo_pattern_t *source,
        const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_image_surface_t *
_cairo_surface_map_to_image (cairo_surface_t *surface,
        const cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_int_status_t
_cairo_surface_unmap_image (cairo_surface_t *surface,
       cairo_image_surface_t *image);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_mask (cairo_surface_t *surface,
       cairo_operator_t op,
       const cairo_pattern_t *source,
       const cairo_pattern_t *mask,
       const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_fill_stroke (cairo_surface_t *surface,
       cairo_operator_t fill_op,
       const cairo_pattern_t *fill_source,
       cairo_fill_rule_t fill_rule,
       double fill_tolerance,
       cairo_antialias_t fill_antialias,
       cairo_path_fixed_t *path,
       cairo_operator_t stroke_op,
       const cairo_pattern_t *stroke_source,
       const cairo_stroke_style_t *stroke_style,
       const cairo_matrix_t *stroke_ctm,
       const cairo_matrix_t *stroke_ctm_inverse,
       double stroke_tolerance,
       cairo_antialias_t stroke_antialias,
       const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_stroke (cairo_surface_t *surface,
         cairo_operator_t op,
         const cairo_pattern_t *source,
         const cairo_path_fixed_t *path,
         const cairo_stroke_style_t *style,
         const cairo_matrix_t *ctm,
         const cairo_matrix_t *ctm_inverse,
         double tolerance,
         cairo_antialias_t antialias,
         const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_fill (cairo_surface_t *surface,
       cairo_operator_t op,
       const cairo_pattern_t *source,
       const cairo_path_fixed_t *path,
       cairo_fill_rule_t fill_rule,
       double tolerance,
       cairo_antialias_t antialias,
       const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_show_text_glyphs (cairo_surface_t *surface,
     cairo_operator_t op,
     const cairo_pattern_t *source,
     const char *utf8,
     int utf8_len,
     cairo_glyph_t *glyphs,
     int num_glyphs,
     const cairo_text_cluster_t *clusters,
     int num_clusters,
     cairo_text_cluster_flags_t cluster_flags,
     cairo_scaled_font_t *scaled_font,
     const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_acquire_source_image (cairo_surface_t *surface,
         cairo_image_surface_t **image_out,
         void **image_extra);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_release_source_image (cairo_surface_t *surface,
         cairo_image_surface_t *image,
         void *image_extra);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_snapshot (cairo_surface_t *surface);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_attach_snapshot (cairo_surface_t *surface,
    cairo_surface_t *snapshot,
    cairo_surface_func_t detach_func);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_surface_has_snapshot (cairo_surface_t *surface,
        const cairo_surface_backend_t *backend);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_detach_snapshot (cairo_surface_t *snapshot);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_surface_begin_modification (cairo_surface_t *surface);

__attribute__((__visibility__("hidden"))) cairo_bool_t
_cairo_surface_get_extents (cairo_surface_t *surface,
       cairo_rectangle_int_t *extents);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_set_device_scale (cairo_surface_t *surface,
     double sx,
     double sy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_surface_has_device_transform (cairo_surface_t *surface) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_surface_release_device_reference (cairo_surface_t *surface);
# 1461 "cairoint.h"
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_format_bits_per_pixel (cairo_format_t format) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_format_t
_cairo_format_from_content (cairo_content_t content) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_format_t
_cairo_format_from_pixman_format (pixman_format_code_t pixman_format);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_content_t
_cairo_content_from_format (cairo_format_t format) __attribute__((const));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_content_t
_cairo_content_from_pixman_format (pixman_format_code_t pixman_format);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_image_surface_create_for_pixman_image (pixman_image_t *pixman_image,
           pixman_format_code_t pixman_format);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) pixman_format_code_t
_cairo_format_to_pixman_format_code (cairo_format_t format);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_pixman_format_from_masks (cairo_format_masks_t *masks,
      pixman_format_code_t *format_ret);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_pixman_format_to_masks (pixman_format_code_t pixman_format,
    cairo_format_masks_t *masks);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_image_scaled_glyph_fini (cairo_scaled_font_t *scaled_font,
    cairo_scaled_glyph_t *scaled_glyph);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_image_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_image_surface_create_with_pixman_format (unsigned char *data,
      pixman_format_code_t pixman_format,
      int width,
      int height,
      int stride);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_surface_t *
_cairo_image_surface_create_with_content (cairo_content_t content,
       int width,
       int height);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_image_surface_assume_ownership_of_data (cairo_image_surface_t *surface);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_image_surface_t *
_cairo_image_surface_coerce (cairo_image_surface_t *surface);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_image_surface_t *
_cairo_image_surface_coerce_to_format (cairo_image_surface_t *surface,
                  cairo_format_t format);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_image_transparency_t
_cairo_image_analyze_transparency (cairo_image_surface_t *image);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_image_color_t
_cairo_image_analyze_color (cairo_image_surface_t *image);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_pen_vertices_needed (double tolerance,
       double radius,
       const cairo_matrix_t *matrix);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_pen_init (cairo_pen_t *pen,
   double radius,
   double tolerance,
   const cairo_matrix_t *ctm);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_pen_init_empty (cairo_pen_t *pen);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_pen_init_copy (cairo_pen_t *pen, const cairo_pen_t *other);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_pen_fini (cairo_pen_t *pen);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_pen_add_points (cairo_pen_t *pen, cairo_point_t *point, int num_points);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_pen_find_active_cw_vertex_index (const cairo_pen_t *pen,
     const cairo_slope_t *slope);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_pen_find_active_ccw_vertex_index (const cairo_pen_t *pen,
      const cairo_slope_t *slope);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_pen_find_active_cw_vertices (const cairo_pen_t *pen,
         const cairo_slope_t *in,
         const cairo_slope_t *out,
         int *start, int *stop);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_pen_find_active_ccw_vertices (const cairo_pen_t *pen,
         const cairo_slope_t *in,
         const cairo_slope_t *out,
         int *start, int *stop);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_init (cairo_polygon_t *polygon,
       const cairo_box_t *boxes,
       int num_boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_init_with_clip (cairo_polygon_t *polygon,
          const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_init_boxes (cairo_polygon_t *polygon,
      const cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_init_box_array (cairo_polygon_t *polygon,
          cairo_box_t *boxes,
          int num_boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_limit (cairo_polygon_t *polygon,
       const cairo_box_t *limits,
       int num_limits);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_limit_to_clip (cairo_polygon_t *polygon,
         const cairo_clip_t *clip);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_fini (cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_add_line (cairo_polygon_t *polygon,
    const cairo_line_t *line,
    int top, int bottom,
    int dir);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_add_external_edge (void *polygon,
      const cairo_point_t *p1,
      const cairo_point_t *p2);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_add_contour (cairo_polygon_t *polygon,
       const cairo_contour_t *contour);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_polygon_translate (cairo_polygon_t *polygon, int dx, int dy);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_reduce (cairo_polygon_t *polygon,
         cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_intersect (cairo_polygon_t *a, int winding_a,
     cairo_polygon_t *b, int winding_b);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_polygon_intersect_with_boxes (cairo_polygon_t *polygon,
         cairo_fill_rule_t *winding,
         cairo_box_t *boxes,
         int num_boxes);

static inline cairo_bool_t
_cairo_polygon_is_empty (const cairo_polygon_t *polygon)
{
    return
 polygon->num_edges == 0 ||
 polygon->extents.p2.x <= polygon->extents.p1.x;
}




__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_spline_init (cairo_spline_t *spline,
      cairo_spline_add_point_func_t add_point_func,
      void *closure,
      const cairo_point_t *a, const cairo_point_t *b,
      const cairo_point_t *c, const cairo_point_t *d);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_spline_decompose (cairo_spline_t *spline, double tolerance);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_spline_bound (cairo_spline_add_point_func_t add_point_func,
       void *closure,
       const cairo_point_t *p0, const cairo_point_t *p1,
       const cairo_point_t *p2, const cairo_point_t *p3);


__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_matrix_get_affine (const cairo_matrix_t *matrix,
     double *xx, double *yx,
     double *xy, double *yy,
     double *x0, double *y0);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_matrix_transform_bounding_box (const cairo_matrix_t *matrix,
          double *x1, double *y1,
          double *x2, double *y2,
          cairo_bool_t *is_tight);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_matrix_transform_bounding_box_fixed (const cairo_matrix_t *matrix,
         cairo_box_t *bbox,
         cairo_bool_t *is_tight);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_is_invertible (const cairo_matrix_t *matrix) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_is_scale_0 (const cairo_matrix_t *matrix) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) double
_cairo_matrix_compute_determinant (const cairo_matrix_t *matrix) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_matrix_compute_basis_scale_factors (const cairo_matrix_t *matrix,
        double *sx, double *sy, int x_major);

static inline cairo_bool_t
_cairo_matrix_is_identity (const cairo_matrix_t *matrix)
{
    return (matrix->xx == 1.0 && matrix->yx == 0.0 &&
     matrix->xy == 0.0 && matrix->yy == 1.0 &&
     matrix->x0 == 0.0 && matrix->y0 == 0.0);
}

static inline cairo_bool_t
_cairo_matrix_is_translation (const cairo_matrix_t *matrix)
{
    return (matrix->xx == 1.0 && matrix->yx == 0.0 &&
     matrix->xy == 0.0 && matrix->yy == 1.0);
}

static inline cairo_bool_t
_cairo_matrix_is_scale (const cairo_matrix_t *matrix)
{
    return matrix->yx == 0.0 && matrix->xy == 0.0;
}

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_is_integer_translation(const cairo_matrix_t *matrix,
         int *itx, int *ity);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_has_unity_scale (const cairo_matrix_t *matrix);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_is_pixel_exact (const cairo_matrix_t *matrix) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) double
_cairo_matrix_transformed_circle_major_axis (const cairo_matrix_t *matrix,
          double radius) __attribute__((pure));

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_bool_t
_cairo_matrix_is_pixman_translation (const cairo_matrix_t *matrix,
         cairo_filter_t filter,
         int *out_x_offset,
         int *out_y_offset);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_matrix_to_pixman_matrix_offset (const cairo_matrix_t *matrix,
           cairo_filter_t filter,
           double xc,
           double yc,
           pixman_transform_t *out_transform,
           int *out_x_offset,
           int *out_y_offset);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_rectilinear_polygon (cairo_traps_t *traps,
             const cairo_polygon_t *polygon,
             cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_polygon (cairo_traps_t *traps,
        const cairo_polygon_t *polygon,
        cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_traps (cairo_traps_t *traps,
      cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_rectangular_traps (cairo_traps_t *traps,
           cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_boxes (const cairo_boxes_t *in,
      cairo_fill_rule_t fill_rule,
      cairo_boxes_t *out);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_rectilinear_traps (cairo_traps_t *traps,
           cairo_fill_rule_t fill_rule);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_bentley_ottmann_tessellate_rectilinear_polygon_to_boxes (const cairo_polygon_t *polygon,
        cairo_fill_rule_t fill_rule,
        cairo_boxes_t *boxes);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_trapezoid_array_translate_and_scale (cairo_trapezoid_t *offset_traps,
         cairo_trapezoid_t *src_traps,
         int num_traps,
         double tx, double ty,
         double sx, double sy);
# 1787 "cairoint.h"
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_clip_reset_static_data (void);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_pattern_reset_static_data (void);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_utf8_get_char_validated (const char *p,
    uint32_t *unicode);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_utf8_to_ucs4 (const char *str,
       int len,
       uint32_t **result,
       int *items_written);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) int
_cairo_ucs4_to_utf8 (uint32_t unicode,
       char *utf8);
# 1820 "cairoint.h"
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_matrix_multiply (cairo_matrix_t *r,
   const cairo_matrix_t *a,
   const cairo_matrix_t *b);



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_observers_notify (cairo_list_t *observers, void *arg);


extern __typeof (cairo_clip_preserve) cairo_clip_preserve __asm__ ("" "INT_cairo_clip_preserve") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_close_path) cairo_close_path __asm__ ("" "INT_cairo_close_path") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_create) cairo_create __asm__ ("" "INT_cairo_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_curve_to) cairo_curve_to __asm__ ("" "INT_cairo_curve_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_destroy) cairo_destroy __asm__ ("" "INT_cairo_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_fill_preserve) cairo_fill_preserve __asm__ ("" "INT_cairo_fill_preserve") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_face_destroy) cairo_font_face_destroy __asm__ ("" "INT_cairo_font_face_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_face_get_user_data) cairo_font_face_get_user_data __asm__ ("" "INT_cairo_font_face_get_user_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_face_reference) cairo_font_face_reference __asm__ ("" "INT_cairo_font_face_reference") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_font_face_set_user_data) cairo_font_face_set_user_data __asm__ ("" "INT_cairo_font_face_set_user_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_equal) cairo_font_options_equal __asm__ ("" "INT_cairo_font_options_equal") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_hash) cairo_font_options_hash __asm__ ("" "INT_cairo_font_options_hash") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_merge) cairo_font_options_merge __asm__ ("" "INT_cairo_font_options_merge") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_set_antialias) cairo_font_options_set_antialias __asm__ ("" "INT_cairo_font_options_set_antialias") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_set_hint_metrics) cairo_font_options_set_hint_metrics __asm__ ("" "INT_cairo_font_options_set_hint_metrics") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_set_hint_style) cairo_font_options_set_hint_style __asm__ ("" "INT_cairo_font_options_set_hint_style") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_set_subpixel_order) cairo_font_options_set_subpixel_order __asm__ ("" "INT_cairo_font_options_set_subpixel_order") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_font_options_status) cairo_font_options_status __asm__ ("" "INT_cairo_font_options_status") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_format_stride_for_width) cairo_format_stride_for_width __asm__ ("" "INT_cairo_format_stride_for_width") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_current_point) cairo_get_current_point __asm__ ("" "INT_cairo_get_current_point") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_line_width) cairo_get_line_width __asm__ ("" "INT_cairo_get_line_width") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_matrix) cairo_get_matrix __asm__ ("" "INT_cairo_get_matrix") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_scaled_font) cairo_get_scaled_font __asm__ ("" "INT_cairo_get_scaled_font") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_target) cairo_get_target __asm__ ("" "INT_cairo_get_target") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_get_tolerance) cairo_get_tolerance __asm__ ("" "INT_cairo_get_tolerance") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_glyph_allocate) cairo_glyph_allocate __asm__ ("" "INT_cairo_glyph_allocate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_glyph_free) cairo_glyph_free __asm__ ("" "INT_cairo_glyph_free") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_create) cairo_image_surface_create __asm__ ("" "INT_cairo_image_surface_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_create_for_data) cairo_image_surface_create_for_data __asm__ ("" "INT_cairo_image_surface_create_for_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_get_data) cairo_image_surface_get_data __asm__ ("" "INT_cairo_image_surface_get_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_get_format) cairo_image_surface_get_format __asm__ ("" "INT_cairo_image_surface_get_format") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_get_height) cairo_image_surface_get_height __asm__ ("" "INT_cairo_image_surface_get_height") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_get_stride) cairo_image_surface_get_stride __asm__ ("" "INT_cairo_image_surface_get_stride") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_image_surface_get_width) cairo_image_surface_get_width __asm__ ("" "INT_cairo_image_surface_get_width") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_line_to) cairo_line_to __asm__ ("" "INT_cairo_line_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mask) cairo_mask __asm__ ("" "INT_cairo_mask") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_init) cairo_matrix_init __asm__ ("" "INT_cairo_matrix_init") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_init_identity) cairo_matrix_init_identity __asm__ ("" "INT_cairo_matrix_init_identity") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_init_rotate) cairo_matrix_init_rotate __asm__ ("" "INT_cairo_matrix_init_rotate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_init_scale) cairo_matrix_init_scale __asm__ ("" "INT_cairo_matrix_init_scale") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_init_translate) cairo_matrix_init_translate __asm__ ("" "INT_cairo_matrix_init_translate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_invert) cairo_matrix_invert __asm__ ("" "INT_cairo_matrix_invert") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_multiply) cairo_matrix_multiply __asm__ ("" "INT_cairo_matrix_multiply") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_scale) cairo_matrix_scale __asm__ ("" "INT_cairo_matrix_scale") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_transform_distance) cairo_matrix_transform_distance __asm__ ("" "INT_cairo_matrix_transform_distance") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_transform_point) cairo_matrix_transform_point __asm__ ("" "INT_cairo_matrix_transform_point") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_matrix_translate) cairo_matrix_translate __asm__ ("" "INT_cairo_matrix_translate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_move_to) cairo_move_to __asm__ ("" "INT_cairo_move_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_new_path) cairo_new_path __asm__ ("" "INT_cairo_new_path") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_paint) cairo_paint __asm__ ("" "INT_cairo_paint") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_add_color_stop_rgba) cairo_pattern_add_color_stop_rgba __asm__ ("" "INT_cairo_pattern_add_color_stop_rgba") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_create_for_surface) cairo_pattern_create_for_surface __asm__ ("" "INT_cairo_pattern_create_for_surface") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_create_rgb) cairo_pattern_create_rgb __asm__ ("" "INT_cairo_pattern_create_rgb") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_create_rgba) cairo_pattern_create_rgba __asm__ ("" "INT_cairo_pattern_create_rgba") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_destroy) cairo_pattern_destroy __asm__ ("" "INT_cairo_pattern_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_get_extend) cairo_pattern_get_extend __asm__ ("" "INT_cairo_pattern_get_extend") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_curve_to) cairo_mesh_pattern_curve_to __asm__ ("" "INT_cairo_mesh_pattern_curve_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_get_control_point) cairo_mesh_pattern_get_control_point __asm__ ("" "INT_cairo_mesh_pattern_get_control_point") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_get_corner_color_rgba) cairo_mesh_pattern_get_corner_color_rgba __asm__ ("" "INT_cairo_mesh_pattern_get_corner_color_rgba") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_get_patch_count) cairo_mesh_pattern_get_patch_count __asm__ ("" "INT_cairo_mesh_pattern_get_patch_count") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_get_path) cairo_mesh_pattern_get_path __asm__ ("" "INT_cairo_mesh_pattern_get_path") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_line_to) cairo_mesh_pattern_line_to __asm__ ("" "INT_cairo_mesh_pattern_line_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_move_to) cairo_mesh_pattern_move_to __asm__ ("" "INT_cairo_mesh_pattern_move_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_mesh_pattern_set_corner_color_rgba) cairo_mesh_pattern_set_corner_color_rgba __asm__ ("" "INT_cairo_mesh_pattern_set_corner_color_rgba") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pattern_reference) cairo_pattern_reference __asm__ ("" "INT_cairo_pattern_reference") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_pattern_set_matrix) cairo_pattern_set_matrix __asm__ ("" "INT_cairo_pattern_set_matrix") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_pop_group) cairo_pop_group __asm__ ("" "INT_cairo_pop_group") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_push_group_with_content) cairo_push_group_with_content __asm__ ("" "INT_cairo_push_group_with_content") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_path_destroy) cairo_path_destroy __asm__ ("" "INT_cairo_path_destroy") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_rel_line_to) cairo_rel_line_to __asm__ ("" "INT_cairo_rel_line_to") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_restore) cairo_restore __asm__ ("" "INT_cairo_restore") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_save) cairo_save __asm__ ("" "INT_cairo_save") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scale) cairo_scale __asm__ ("" "INT_cairo_scale") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_create) cairo_scaled_font_create __asm__ ("" "INT_cairo_scaled_font_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_destroy) cairo_scaled_font_destroy __asm__ ("" "INT_cairo_scaled_font_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_extents) cairo_scaled_font_extents __asm__ ("" "INT_cairo_scaled_font_extents") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_get_ctm) cairo_scaled_font_get_ctm __asm__ ("" "INT_cairo_scaled_font_get_ctm") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_get_font_face) cairo_scaled_font_get_font_face __asm__ ("" "INT_cairo_scaled_font_get_font_face") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_get_font_matrix) cairo_scaled_font_get_font_matrix __asm__ ("" "INT_cairo_scaled_font_get_font_matrix") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_get_font_options) cairo_scaled_font_get_font_options __asm__ ("" "INT_cairo_scaled_font_get_font_options") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_glyph_extents) cairo_scaled_font_glyph_extents __asm__ ("" "INT_cairo_scaled_font_glyph_extents") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_reference) cairo_scaled_font_reference __asm__ ("" "INT_cairo_scaled_font_reference") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_scaled_font_status) cairo_scaled_font_status __asm__ ("" "INT_cairo_scaled_font_status") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_get_user_data) cairo_scaled_font_get_user_data __asm__ ("" "INT_cairo_scaled_font_get_user_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_set_user_data) cairo_scaled_font_set_user_data __asm__ ("" "INT_cairo_scaled_font_set_user_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_scaled_font_text_to_glyphs) cairo_scaled_font_text_to_glyphs __asm__ ("" "INT_cairo_scaled_font_text_to_glyphs") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_font_matrix) cairo_set_font_matrix __asm__ ("" "INT_cairo_set_font_matrix") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_font_options) cairo_set_font_options __asm__ ("" "INT_cairo_set_font_options") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_font_size) cairo_set_font_size __asm__ ("" "INT_cairo_set_font_size") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_line_cap) cairo_set_line_cap __asm__ ("" "INT_cairo_set_line_cap") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_line_join) cairo_set_line_join __asm__ ("" "INT_cairo_set_line_join") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_line_width) cairo_set_line_width __asm__ ("" "INT_cairo_set_line_width") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_matrix) cairo_set_matrix __asm__ ("" "INT_cairo_set_matrix") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_operator) cairo_set_operator __asm__ ("" "INT_cairo_set_operator") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_source) cairo_set_source __asm__ ("" "INT_cairo_set_source") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_source_rgb) cairo_set_source_rgb __asm__ ("" "INT_cairo_set_source_rgb") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_source_surface) cairo_set_source_surface __asm__ ("" "INT_cairo_set_source_surface") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_set_tolerance) cairo_set_tolerance __asm__ ("" "INT_cairo_set_tolerance") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_status) cairo_status __asm__ ("" "INT_cairo_status") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_stroke) cairo_stroke __asm__ ("" "INT_cairo_stroke") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_stroke_preserve) cairo_stroke_preserve __asm__ ("" "INT_cairo_stroke_preserve") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_copy_page) cairo_surface_copy_page __asm__ ("" "INT_cairo_surface_copy_page") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_create_similar_image) cairo_surface_create_similar_image __asm__ ("" "INT_cairo_surface_create_similar_image") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_destroy) cairo_surface_destroy __asm__ ("" "INT_cairo_surface_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_finish) cairo_surface_finish __asm__ ("" "INT_cairo_surface_finish") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_flush) cairo_surface_flush __asm__ ("" "INT_cairo_surface_flush") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_get_device_offset) cairo_surface_get_device_offset __asm__ ("" "INT_cairo_surface_get_device_offset") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_get_font_options) cairo_surface_get_font_options __asm__ ("" "INT_cairo_surface_get_font_options") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_get_mime_data) cairo_surface_get_mime_data __asm__ ("" "INT_cairo_surface_get_mime_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_has_show_text_glyphs) cairo_surface_has_show_text_glyphs __asm__ ("" "INT_cairo_surface_has_show_text_glyphs") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_mark_dirty) cairo_surface_mark_dirty __asm__ ("" "INT_cairo_surface_mark_dirty") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_mark_dirty_rectangle) cairo_surface_mark_dirty_rectangle __asm__ ("" "INT_cairo_surface_mark_dirty_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_reference) cairo_surface_reference __asm__ ("" "INT_cairo_surface_reference") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_surface_set_device_offset) cairo_surface_set_device_offset __asm__ ("" "INT_cairo_surface_set_device_offset") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_set_fallback_resolution) cairo_surface_set_fallback_resolution __asm__ ("" "INT_cairo_surface_set_fallback_resolution") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_set_mime_data) cairo_surface_set_mime_data __asm__ ("" "INT_cairo_surface_set_mime_data") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_show_page) cairo_surface_show_page __asm__ ("" "INT_cairo_surface_show_page") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_status) cairo_surface_status __asm__ ("" "INT_cairo_surface_status") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_surface_supports_mime_type) cairo_surface_supports_mime_type __asm__ ("" "INT_cairo_surface_supports_mime_type") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_text_cluster_allocate) cairo_text_cluster_allocate __asm__ ("" "INT_cairo_text_cluster_allocate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_text_cluster_free) cairo_text_cluster_free __asm__ ("" "INT_cairo_text_cluster_free") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_toy_font_face_create) cairo_toy_font_face_create __asm__ ("" "INT_cairo_toy_font_face_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_toy_font_face_get_slant) cairo_toy_font_face_get_slant __asm__ ("" "INT_cairo_toy_font_face_get_slant") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_toy_font_face_get_weight) cairo_toy_font_face_get_weight __asm__ ("" "INT_cairo_toy_font_face_get_weight") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_translate) cairo_translate __asm__ ("" "INT_cairo_translate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_transform) cairo_transform __asm__ ("" "INT_cairo_transform") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_font_face_create) cairo_user_font_face_create __asm__ ("" "INT_cairo_user_font_face_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_font_face_set_init_func) cairo_user_font_face_set_init_func __asm__ ("" "INT_cairo_user_font_face_set_init_func") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_font_face_set_render_glyph_func) cairo_user_font_face_set_render_glyph_func __asm__ ("" "INT_cairo_user_font_face_set_render_glyph_func") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_font_face_set_unicode_to_glyph_func) cairo_user_font_face_set_unicode_to_glyph_func __asm__ ("" "INT_cairo_user_font_face_set_unicode_to_glyph_func") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_device_to_user) cairo_device_to_user __asm__ ("" "INT_cairo_device_to_user") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_to_device) cairo_user_to_device __asm__ ("" "INT_cairo_user_to_device") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_user_to_device_distance) cairo_user_to_device_distance __asm__ ("" "INT_cairo_user_to_device_distance") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_version_string) cairo_version_string __asm__ ("" "INT_cairo_version_string") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_create) cairo_region_create __asm__ ("" "INT_cairo_region_create") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_create_rectangle) cairo_region_create_rectangle __asm__ ("" "INT_cairo_region_create_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_create_rectangles) cairo_region_create_rectangles __asm__ ("" "INT_cairo_region_create_rectangles") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_copy) cairo_region_copy __asm__ ("" "INT_cairo_region_copy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_reference) cairo_region_reference __asm__ ("" "INT_cairo_region_reference") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_destroy) cairo_region_destroy __asm__ ("" "INT_cairo_region_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_equal) cairo_region_equal __asm__ ("" "INT_cairo_region_equal") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_status) cairo_region_status __asm__ ("" "INT_cairo_region_status") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_get_extents) cairo_region_get_extents __asm__ ("" "INT_cairo_region_get_extents") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_num_rectangles) cairo_region_num_rectangles __asm__ ("" "INT_cairo_region_num_rectangles") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_get_rectangle) cairo_region_get_rectangle __asm__ ("" "INT_cairo_region_get_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_is_empty) cairo_region_is_empty __asm__ ("" "INT_cairo_region_is_empty") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_contains_rectangle) cairo_region_contains_rectangle __asm__ ("" "INT_cairo_region_contains_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_contains_point) cairo_region_contains_point __asm__ ("" "INT_cairo_region_contains_point") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_translate) cairo_region_translate __asm__ ("" "INT_cairo_region_translate") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_subtract) cairo_region_subtract __asm__ ("" "INT_cairo_region_subtract") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_subtract_rectangle) cairo_region_subtract_rectangle __asm__ ("" "INT_cairo_region_subtract_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_intersect) cairo_region_intersect __asm__ ("" "INT_cairo_region_intersect") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_intersect_rectangle) cairo_region_intersect_rectangle __asm__ ("" "INT_cairo_region_intersect_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_union) cairo_region_union __asm__ ("" "INT_cairo_region_union") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_union_rectangle) cairo_region_union_rectangle __asm__ ("" "INT_cairo_region_union_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_xor) cairo_region_xor __asm__ ("" "INT_cairo_region_xor") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_region_xor_rectangle) cairo_region_xor_rectangle __asm__ ("" "INT_cairo_region_xor_rectangle") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));



extern __typeof (cairo_surface_write_to_png_stream) cairo_surface_write_to_png_stream __asm__ ("" "INT_cairo_surface_write_to_png_stream") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));



__attribute__((__visibility__("hidden"))) cairo_filter_t
_cairo_pattern_analyze_filter (const cairo_pattern_t *pattern,
          double *pad_out);



# 1 "cairo-mutex-private.h" 1
# 46 "cairo-mutex-private.h"

# 62 "cairo-mutex-private.h"
# 1 "cairo-mutex-list-private.h" 1
# 39 "cairo-mutex-list-private.h"
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_pattern_solid_surface_cache_lock;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_image_solid_cache_mutex;

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_toy_font_face_mutex;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_intern_string_mutex;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_scaled_font_map_mutex;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_scaled_glyph_page_cache_mutex;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_scaled_font_error_mutex;
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) extern cairo_mutex_t _cairo_glyph_cache_mutex;
# 63 "cairo-mutex-private.h" 2



# 2002 "cairoint.h" 2
# 1 "cairo-fixed-private.h" 1
# 42 "cairo-fixed-private.h"
# 1 "cairo-wideint-private.h" 1
# 101 "cairo-wideint-private.h"
static inline cairo_uquorem64_t
_cairo_uint64_divrem (cairo_uint64_t num, cairo_uint64_t den)
{
    cairo_uquorem64_t qr;

    qr.quo = num / den;
    qr.rem = num % den;
    return qr;
}
# 118 "cairo-wideint-private.h"
static inline __attribute__((always_inline)) __attribute__((const)) cairo_uint64_t _cairo_double_to_uint64 (double i) { return i; }
static inline __attribute__((always_inline)) __attribute__((const)) double _cairo_uint64_to_double (cairo_uint64_t i) { return i; }

static inline __attribute__((always_inline)) cairo_int64_t __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const)) _cairo_double_to_int64 (double i) { return i; }
static inline __attribute__((always_inline)) double __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const)) _cairo_int64_to_double (cairo_int64_t i) { return i; }
# 181 "cairo-wideint-private.h"
static inline cairo_quorem64_t
_cairo_int64_divrem (cairo_int64_t num, cairo_int64_t den)
{
    int num_neg = ((num) < 0);
    int den_neg = ((den) < 0);
    cairo_uquorem64_t uqr;
    cairo_quorem64_t qr;

    if (num_neg)
 num = (-(num));
    if (den_neg)
 den = (-(den));
    uqr = _cairo_uint64_divrem (num, den);
    if (num_neg)
 qr.rem = (-(uqr.rem));
    else
 qr.rem = uqr.rem;
    if (num_neg != den_neg)
 qr.quo = (cairo_int64_t) (-(uqr.quo));
    else
 qr.quo = (cairo_int64_t) uqr.quo;
    return qr;
}

static inline int32_t
_cairo_int64_32_div (cairo_int64_t num, int32_t den)
{




    return num / den;

}
# 312 "cairo-wideint-private.h"
cairo_uquorem128_t __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const))
_cairo_uint128_divrem (cairo_uint128_t num, cairo_uint128_t den);

cairo_quorem128_t __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const))
_cairo_int128_divrem (cairo_int128_t num, cairo_int128_t den);

cairo_uquorem64_t __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const))
_cairo_uint_96by64_32x64_divrem (cairo_uint128_t num,
     cairo_uint64_t den);

cairo_quorem64_t __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) __attribute__((const))
_cairo_int_96by64_32x64_divrem (cairo_int128_t num,
    cairo_int64_t den);
# 43 "cairo-fixed-private.h" 2
# 60 "cairo-fixed-private.h"
static inline cairo_fixed_t
_cairo_fixed_from_int (int i)
{
    return i << 8;
}
# 109 "cairo-fixed-private.h"
static inline cairo_fixed_t
_cairo_fixed_from_double (double d)
{
    union {
        double d;
        int32_t i[2];
    } u;

    u.d = d + ((1LL << (52 - 8)) * 1.5);



    return u.i[0];

}






static inline cairo_fixed_t
_cairo_fixed_from_26_6 (uint32_t i)
{

    return i << (8 - 6);



}

static inline cairo_fixed_t
_cairo_fixed_from_16_16 (uint32_t i)
{



    return i >> (16 - 8);

}

static inline double
_cairo_fixed_to_double (cairo_fixed_t f)
{
    return ((double) f) / ((double)(1 << 8));
}

static inline int
_cairo_fixed_is_integer (cairo_fixed_t f)
{
    return (f & ((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)))) == 0;
}

static inline cairo_fixed_t
_cairo_fixed_floor (cairo_fixed_t f)
{
    return f & ~((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)));
}

static inline cairo_fixed_t
_cairo_fixed_ceil (cairo_fixed_t f)
{
    return _cairo_fixed_floor (f + ((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8))));
}

static inline cairo_fixed_t
_cairo_fixed_round (cairo_fixed_t f)
{
    return _cairo_fixed_floor (f + (((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)))+1)/2);
}

static inline cairo_fixed_t
_cairo_fixed_round_down (cairo_fixed_t f)
{
    return _cairo_fixed_floor (f + ((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)))/2);
}

static inline int
_cairo_fixed_integer_part (cairo_fixed_t f)
{
    return f >> 8;
}

static inline int
_cairo_fixed_integer_round (cairo_fixed_t f)
{
    return _cairo_fixed_integer_part (f + (((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)))+1)/2);
}

static inline int
_cairo_fixed_integer_round_down (cairo_fixed_t f)
{
    return _cairo_fixed_integer_part (f + ((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)))/2);
}

static inline int
_cairo_fixed_fractional_part (cairo_fixed_t f)
{
    return f & ((cairo_fixed_t)(((cairo_fixed_unsigned_t)(-1)) >> (32 - 8)));
}

static inline int
_cairo_fixed_integer_floor (cairo_fixed_t f)
{
    if (f >= 0)
        return f >> 8;
    else
        return -((-f - 1) >> 8) - 1;
}

static inline int
_cairo_fixed_integer_ceil (cairo_fixed_t f)
{
    if (f > 0)
 return ((f - 1)>>8) + 1;
    else
 return - (-f >> 8);
}





static inline cairo_fixed_16_16_t
_cairo_fixed_to_16_16 (cairo_fixed_t f)
{






    cairo_fixed_16_16_t x;




    if ((f >> 8) < (-32767-1)) {
 x = (-2147483647-1);
    } else if ((f >> 8) > (32767)) {
 x = (2147483647);
    } else {
 x = f << (16 - 8);
    }

    return x;

}

static inline cairo_fixed_16_16_t
_cairo_fixed_16_16_from_double (double d)
{
    union {
        double d;
        int32_t i[2];
    } u;

    u.d = d + (103079215104.0);



    return u.i[0];

}

static inline int
_cairo_fixed_16_16_floor (cairo_fixed_16_16_t f)
{
    if (f >= 0)
 return f >> 16;
    else
 return -((-f - 1) >> 16) - 1;
}

static inline double
_cairo_fixed_16_16_to_double (cairo_fixed_16_16_t f)
{
    return ((double) f) / (double) (1 << 16);
}



static inline cairo_fixed_t
_cairo_fixed_mul (cairo_fixed_t a, cairo_fixed_t b)
{
    cairo_int64_t temp = ((int64_t) (a) * (b));
    return ((int32_t) (((int64_t) ((uint64_t) (temp) >> (8)))));
}


static inline cairo_fixed_t
_cairo_fixed_mul_div (cairo_fixed_t a, cairo_fixed_t b, cairo_fixed_t c)
{
    cairo_int64_t ab = ((int64_t) (a) * (b));
    cairo_int64_t c64 = ((int64_t) (c));
    return ((int32_t) (_cairo_int64_divrem (ab, c64).quo));
}


static inline cairo_fixed_t
_cairo_fixed_mul_div_floor (cairo_fixed_t a, cairo_fixed_t b, cairo_fixed_t c)
{
    return _cairo_int64_32_div (((int64_t) (a) * (b)), c);
}


static inline cairo_fixed_t
_cairo_edge_compute_intersection_y_for_x (const cairo_point_t *p1,
       const cairo_point_t *p2,
       cairo_fixed_t x)
{
    cairo_fixed_t y, dx;

    if (x == p1->x)
 return p1->y;
    if (x == p2->x)
 return p2->y;

    y = p1->y;
    dx = p2->x - p1->x;
    if (dx != 0)
 y += _cairo_fixed_mul_div_floor (x - p1->x, p2->y - p1->y, dx);

    return y;
}

static inline cairo_fixed_t
_cairo_edge_compute_intersection_x_for_y (const cairo_point_t *p1,
       const cairo_point_t *p2,
       cairo_fixed_t y)
{
    cairo_fixed_t x, dy;

    if (y == p1->y)
 return p1->x;
    if (y == p2->y)
 return p2->x;

    x = p1->x;
    dy = p2->y - p1->y;
    if (dy != 0)
 x += _cairo_fixed_mul_div_floor (y - p1->y, p2->x - p1->x, dy);

    return x;
}
# 2003 "cairoint.h" 2

# 1 "cairo-malloc-private.h" 1
# 2005 "cairoint.h" 2
# 1 "cairo-hash-private.h" 1
# 50 "cairo-hash-private.h"
typedef cairo_bool_t
(*cairo_hash_keys_equal_func_t) (const void *key_a, const void *key_b);

typedef cairo_bool_t
(*cairo_hash_predicate_func_t) (const void *entry);

typedef void
(*cairo_hash_callback_func_t) (void *entry,
          void *closure);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_hash_table_t *
_cairo_hash_table_create (cairo_hash_keys_equal_func_t keys_equal);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_hash_table_destroy (cairo_hash_table_t *hash_table);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void *
_cairo_hash_table_lookup (cairo_hash_table_t *hash_table,
     cairo_hash_entry_t *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void *
_cairo_hash_table_random_entry (cairo_hash_table_t *hash_table,
    cairo_hash_predicate_func_t predicate);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_hash_table_insert (cairo_hash_table_t *hash_table,
     cairo_hash_entry_t *entry);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_hash_table_remove (cairo_hash_table_t *hash_table,
     cairo_hash_entry_t *key);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_hash_table_foreach (cairo_hash_table_t *hash_table,
      cairo_hash_callback_func_t hash_callback,
      void *closure);
# 2006 "cairoint.h" 2


# 1 "/usr/include/valgrind/memcheck.h" 1
# 72 "/usr/include/valgrind/memcheck.h"
# 1 "/usr/include/valgrind/valgrind.h" 1
# 354 "/usr/include/valgrind/valgrind.h"
typedef
   struct {
      unsigned long long int nraddr;
   }
   OrigFn;
# 3605 "/usr/include/valgrind/valgrind.h"
typedef
   enum { VG_USERREQ__RUNNING_ON_VALGRIND = 0x1001,
          VG_USERREQ__DISCARD_TRANSLATIONS = 0x1002,






          VG_USERREQ__CLIENT_CALL0 = 0x1101,
          VG_USERREQ__CLIENT_CALL1 = 0x1102,
          VG_USERREQ__CLIENT_CALL2 = 0x1103,
          VG_USERREQ__CLIENT_CALL3 = 0x1104,




          VG_USERREQ__COUNT_ERRORS = 0x1201,



          VG_USERREQ__GDB_MONITOR_COMMAND = 0x1202,



          VG_USERREQ__MALLOCLIKE_BLOCK = 0x1301,
          VG_USERREQ__RESIZEINPLACE_BLOCK = 0x130b,
          VG_USERREQ__FREELIKE_BLOCK = 0x1302,

          VG_USERREQ__CREATE_MEMPOOL = 0x1303,
          VG_USERREQ__DESTROY_MEMPOOL = 0x1304,
          VG_USERREQ__MEMPOOL_ALLOC = 0x1305,
          VG_USERREQ__MEMPOOL_FREE = 0x1306,
          VG_USERREQ__MEMPOOL_TRIM = 0x1307,
          VG_USERREQ__MOVE_MEMPOOL = 0x1308,
          VG_USERREQ__MEMPOOL_CHANGE = 0x1309,
          VG_USERREQ__MEMPOOL_EXISTS = 0x130a,
# 3650 "/usr/include/valgrind/valgrind.h"
          VG_USERREQ__PRINTF = 0x1401,
          VG_USERREQ__PRINTF_BACKTRACE = 0x1402,

          VG_USERREQ__PRINTF_VALIST_BY_REF = 0x1403,
          VG_USERREQ__PRINTF_BACKTRACE_VALIST_BY_REF = 0x1404,


          VG_USERREQ__STACK_REGISTER = 0x1501,
          VG_USERREQ__STACK_DEREGISTER = 0x1502,
          VG_USERREQ__STACK_CHANGE = 0x1503,


          VG_USERREQ__LOAD_PDB_DEBUGINFO = 0x1601,


          VG_USERREQ__MAP_IP_TO_SRCLOC = 0x1701,






          VG_USERREQ__CHANGE_ERR_DISABLEMENT = 0x1801
   } Vg_ClientRequest;
# 3707 "/usr/include/valgrind/valgrind.h"
static int VALGRIND_PRINTF(const char *format, ...)
   __attribute__((format(__printf__, 1, 2), __unused__));

static int



VALGRIND_PRINTF(const char *format, ...)
{






   unsigned long _qzz_res;

   va_list vargs;
   __builtin_va_start(vargs,format);







   _qzz_res = __extension__ ({ volatile unsigned long long int _zzq_args[6]; volatile unsigned long long int _zzq_result; _zzq_args[0] = (unsigned long long int)(VG_USERREQ__PRINTF_VALIST_BY_REF); _zzq_args[1] = (unsigned long long int)((unsigned long)format); _zzq_args[2] = (unsigned long long int)((unsigned long)&vargs); _zzq_args[3] = (unsigned long long int)(0); _zzq_args[4] = (unsigned long long int)(0); _zzq_args[5] = (unsigned long long int)(0); __asm__ volatile("rolq $3,  %%rdi ; rolq $13, %%rdi\n\t" "rolq $61, %%rdi ; rolq $51, %%rdi\n\t" "xchgq %%rbx,%%rbx" : "=d" (_zzq_result) : "a" (&_zzq_args[0]), "0" (0) : "cc", "memory" ); _zzq_result; })



                                      ;

   __builtin_va_end(vargs);
   return (int)_qzz_res;

}


static int VALGRIND_PRINTF_BACKTRACE(const char *format, ...)
   __attribute__((format(__printf__, 1, 2), __unused__));

static int



VALGRIND_PRINTF_BACKTRACE(const char *format, ...)
{






   unsigned long _qzz_res;

   va_list vargs;
   __builtin_va_start(vargs,format);







   _qzz_res = __extension__ ({ volatile unsigned long long int _zzq_args[6]; volatile unsigned long long int _zzq_result; _zzq_args[0] = (unsigned long long int)(VG_USERREQ__PRINTF_BACKTRACE_VALIST_BY_REF); _zzq_args[1] = (unsigned long long int)((unsigned long)format); _zzq_args[2] = (unsigned long long int)((unsigned long)&vargs); _zzq_args[3] = (unsigned long long int)(0); _zzq_args[4] = (unsigned long long int)(0); _zzq_args[5] = (unsigned long long int)(0); __asm__ volatile("rolq $3,  %%rdi ; rolq $13, %%rdi\n\t" "rolq $61, %%rdi ; rolq $51, %%rdi\n\t" "xchgq %%rbx,%%rbx" : "=d" (_zzq_result) : "a" (&_zzq_args[0]), "0" (0) : "cc", "memory" ); _zzq_result; })



                                      ;

   __builtin_va_end(vargs);
   return (int)_qzz_res;

}
# 73 "/usr/include/valgrind/memcheck.h" 2





typedef
   enum {
      VG_USERREQ__MAKE_MEM_NOACCESS = ((unsigned int)((('M')&0xff) << 24 | (('C')&0xff) << 16)),
      VG_USERREQ__MAKE_MEM_UNDEFINED,
      VG_USERREQ__MAKE_MEM_DEFINED,
      VG_USERREQ__DISCARD,
      VG_USERREQ__CHECK_MEM_IS_ADDRESSABLE,
      VG_USERREQ__CHECK_MEM_IS_DEFINED,
      VG_USERREQ__DO_LEAK_CHECK,
      VG_USERREQ__COUNT_LEAKS,

      VG_USERREQ__GET_VBITS,
      VG_USERREQ__SET_VBITS,

      VG_USERREQ__CREATE_BLOCK,

      VG_USERREQ__MAKE_MEM_DEFINED_IF_ADDRESSABLE,


      VG_USERREQ__COUNT_LEAK_BLOCKS,


      _VG_USERREQ__MEMCHECK_RECORD_OVERLAP_ERROR
         = ((unsigned int)((('M')&0xff) << 24 | (('C')&0xff) << 16)) + 256
   } Vg_MemCheckClientRequest;
# 2009 "cairoint.h" 2



__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_check_image_surface_is_defined (const cairo_surface_t *surface);
# 2022 "cairoint.h"
__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_print_path (FILE *stream, cairo_path_fixed_t *path);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_print_polygon (FILE *stream, cairo_polygon_t *polygon);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_print_traps (FILE *file, const cairo_traps_t *traps);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_debug_print_clip (FILE *stream, const cairo_clip_t *clip);
# 37 "cairo-device.c" 2
# 1 "cairo-device-private.h" 1
# 44 "cairo-device-private.h"
struct _cairo_device {
    cairo_reference_count_t ref_count;
    cairo_status_t status;
    cairo_user_data_array_t user_data;

    const cairo_device_backend_t *backend;

    cairo_recursive_mutex_t mutex;
    unsigned mutex_depth;

    cairo_bool_t finished;
};

struct _cairo_device_backend {
    cairo_device_type_t type;

    void (*lock) (void *device);
    void (*unlock) (void *device);

    __attribute__((__warn_unused_result__)) cairo_status_t (*flush) (void *device);
    void (*finish) (void *device);
    void (*destroy) (void *device);
};

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_device_t *
_cairo_device_create_in_error (cairo_status_t status);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) void
_cairo_device_init (cairo_device_t *device,
      const cairo_device_backend_t *backend);

__attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__)) cairo_status_t
_cairo_device_set_error (cairo_device_t *device,
           cairo_status_t error);

extern __typeof (cairo_device_reference) cairo_device_reference __asm__ ("" "INT_cairo_device_reference") __attribute__((__visibility__("hidden")));
extern __typeof (cairo_device_acquire) cairo_device_acquire __asm__ ("" "INT_cairo_device_acquire") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_device_release) cairo_device_release __asm__ ("" "INT_cairo_device_release") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_device_flush) cairo_device_flush __asm__ ("" "INT_cairo_device_flush") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_device_finish) cairo_device_finish __asm__ ("" "INT_cairo_device_finish") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
extern __typeof (cairo_device_destroy) cairo_device_destroy __asm__ ("" "INT_cairo_device_destroy") __attribute__((__visibility__("hidden"))) __attribute__((__warn_unused_result__));
# 38 "cairo-device.c" 2
# 97 "cairo-device.c"
static const cairo_device_t _nil_device = {
    {((cairo_atomic_int_t) -1)},
    CAIRO_STATUS_NO_MEMORY,
};

static const cairo_device_t _mismatch_device = {
    {((cairo_atomic_int_t) -1)},
    CAIRO_STATUS_DEVICE_TYPE_MISMATCH,
};

static const cairo_device_t _invalid_device = {
    {((cairo_atomic_int_t) -1)},
    CAIRO_STATUS_DEVICE_ERROR,
};

cairo_device_t *
_cairo_device_create_in_error (cairo_status_t status)
{
    switch (status) {
    case CAIRO_STATUS_NO_MEMORY:
 return (cairo_device_t *) &_nil_device;
    case CAIRO_STATUS_DEVICE_ERROR:
 return (cairo_device_t *) &_invalid_device;
    case CAIRO_STATUS_DEVICE_TYPE_MISMATCH:
 return (cairo_device_t *) &_mismatch_device;

    case CAIRO_STATUS_SUCCESS:
    case CAIRO_STATUS_LAST_STATUS:
 do { ((!"reached") ? (void) (0) : __assert_fail ("!\"reached\"", "cairo-device.c", 125, __PRETTY_FUNCTION__)); } while (0);

    case CAIRO_STATUS_SURFACE_TYPE_MISMATCH:
    case CAIRO_STATUS_INVALID_STATUS:
    case CAIRO_STATUS_INVALID_FORMAT:
    case CAIRO_STATUS_INVALID_VISUAL:
    case CAIRO_STATUS_READ_ERROR:
    case CAIRO_STATUS_WRITE_ERROR:
    case CAIRO_STATUS_FILE_NOT_FOUND:
    case CAIRO_STATUS_TEMP_FILE_ERROR:
    case CAIRO_STATUS_INVALID_STRIDE:
    case CAIRO_STATUS_INVALID_SIZE:
    case CAIRO_STATUS_INVALID_RESTORE:
    case CAIRO_STATUS_INVALID_POP_GROUP:
    case CAIRO_STATUS_NO_CURRENT_POINT:
    case CAIRO_STATUS_INVALID_MATRIX:
    case CAIRO_STATUS_NULL_POINTER:
    case CAIRO_STATUS_INVALID_STRING:
    case CAIRO_STATUS_INVALID_PATH_DATA:
    case CAIRO_STATUS_SURFACE_FINISHED:
    case CAIRO_STATUS_PATTERN_TYPE_MISMATCH:
    case CAIRO_STATUS_INVALID_DASH:
    case CAIRO_STATUS_INVALID_DSC_COMMENT:
    case CAIRO_STATUS_INVALID_INDEX:
    case CAIRO_STATUS_CLIP_NOT_REPRESENTABLE:
    case CAIRO_STATUS_FONT_TYPE_MISMATCH:
    case CAIRO_STATUS_USER_FONT_IMMUTABLE:
    case CAIRO_STATUS_USER_FONT_ERROR:
    case CAIRO_STATUS_NEGATIVE_COUNT:
    case CAIRO_STATUS_INVALID_CLUSTERS:
    case CAIRO_STATUS_INVALID_SLANT:
    case CAIRO_STATUS_INVALID_WEIGHT:
    case CAIRO_STATUS_USER_FONT_NOT_IMPLEMENTED:
    case CAIRO_STATUS_INVALID_CONTENT:
    case CAIRO_STATUS_INVALID_MESH_CONSTRUCTION:
    case CAIRO_STATUS_DEVICE_FINISHED:
    default:
 do { cairo_status_t status__ = _cairo_error (CAIRO_STATUS_NO_MEMORY); (void) status__; } while (0);
 return (cairo_device_t *) &_nil_device;
    }
}

void
_cairo_device_init (cairo_device_t *device,
      const cairo_device_backend_t *backend)
{
    ((&device->ref_count)->ref_count = (1));
    device->status = CAIRO_STATUS_SUCCESS;

    device->backend = backend;

    ;
    device->mutex_depth = 0;

    device->finished = 0;

    _cairo_user_data_array_init (&device->user_data);
}
# 199 "cairo-device.c"
cairo_device_t *
cairo_device_reference (cairo_device_t *device)
{
    if (device == ((void *)0) ||
 ((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
    {
 return device;
    }

    ((((*&(&device->ref_count)->ref_count) > 0)) ? (void) (0) : __assert_fail ("((*&(&device->ref_count)->ref_count) > 0)", "cairo-device.c", 208, __PRETTY_FUNCTION__));
    ((void) __sync_fetch_and_add(&(&device->ref_count)->ref_count, 1));

    return device;
}
extern __typeof (cairo_device_reference) EXT_cairo_device_reference __asm__("" "cairo_device_reference") __attribute__((__alias__("" "INT_cairo_device_reference")));
# 227 "cairo-device.c"
cairo_status_t
cairo_device_status (cairo_device_t *device)
{
    if (device == ((void *)0))
 return CAIRO_STATUS_NULL_POINTER;

    return device->status;
}
# 251 "cairo-device.c"
void
cairo_device_flush (cairo_device_t *device)
{
    cairo_status_t status;

    if (device == ((void *)0) || device->status)
 return;

    if (device->finished)
 return;

    if (device->backend->flush != ((void *)0)) {
 status = device->backend->flush (device);
 if ((status))
     status = _cairo_device_set_error (device, status);
    }
}
extern __typeof (cairo_device_flush) EXT_cairo_device_flush __asm__("" "cairo_device_flush") __attribute__((__alias__("" "INT_cairo_device_flush")));
# 289 "cairo-device.c"
void
cairo_device_finish (cairo_device_t *device)
{
    if (device == ((void *)0) ||
 ((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
    {
 return;
    }

    if (device->finished)
 return;

    cairo_device_flush (device);

    if (device->backend->finish != ((void *)0))
 device->backend->finish (device);





    device->finished = 1;
}
extern __typeof (cairo_device_finish) EXT_cairo_device_finish __asm__("" "cairo_device_finish") __attribute__((__alias__("" "INT_cairo_device_finish")));
# 326 "cairo-device.c"
void
cairo_device_destroy (cairo_device_t *device)
{
    cairo_user_data_array_t user_data;

    if (device == ((void *)0) ||
 ((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
    {
 return;
    }

    ((((*&(&device->ref_count)->ref_count) > 0)) ? (void) (0) : __assert_fail ("((*&(&device->ref_count)->ref_count) > 0)", "cairo-device.c", 337, __PRETTY_FUNCTION__));
    if (! (__sync_fetch_and_add(&(&device->ref_count)->ref_count, -1) == 1))
 return;

    cairo_device_finish (device);

    ((device->mutex_depth == 0) ? (void) (0) : __assert_fail ("device->mutex_depth == 0", "cairo-device.c", 343, __PRETTY_FUNCTION__));
    do { (void)(device->mutex); } while (0);

    user_data = device->user_data;

    device->backend->destroy (device);

    _cairo_user_data_array_fini (&user_data);

}
extern __typeof (cairo_device_destroy) EXT_cairo_device_destroy __asm__("" "cairo_device_destroy") __attribute__((__alias__("" "INT_cairo_device_destroy")));
# 366 "cairo-device.c"
cairo_device_type_t
cairo_device_get_type (cairo_device_t *device)
{
    if (device == ((void *)0) ||
 ((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
    {
 return CAIRO_DEVICE_TYPE_INVALID;
    }

    return device->backend->type;
}
# 408 "cairo-device.c"
cairo_status_t
cairo_device_acquire (cairo_device_t *device)
{
    if (device == ((void *)0))
 return CAIRO_STATUS_SUCCESS;

    if ((device->status))
 return device->status;

    if ((device->finished))
 return _cairo_device_set_error (device, CAIRO_STATUS_DEVICE_FINISHED);

    do { (void)(device->mutex); } while (0);
    if (device->mutex_depth++ == 0) {
 if (device->backend->lock != ((void *)0))
     device->backend->lock (device);
    }

    return CAIRO_STATUS_SUCCESS;
}
extern __typeof (cairo_device_acquire) EXT_cairo_device_acquire __asm__("" "cairo_device_acquire") __attribute__((__alias__("" "INT_cairo_device_acquire")));
# 439 "cairo-device.c"
void
cairo_device_release (cairo_device_t *device)
{
    if (device == ((void *)0))
 return;

    ((device->mutex_depth > 0) ? (void) (0) : __assert_fail ("device->mutex_depth > 0", "cairo-device.c", 445, __PRETTY_FUNCTION__));

    if (--device->mutex_depth == 0) {
 if (device->backend->unlock != ((void *)0))
     device->backend->unlock (device);
    }

    do { (void)(device->mutex); } while (0);
}
extern __typeof (cairo_device_release) EXT_cairo_device_release __asm__("" "cairo_device_release") __attribute__((__alias__("" "INT_cairo_device_release")));

cairo_status_t
_cairo_device_set_error (cairo_device_t *device,
    cairo_status_t status)
{
    if (status == CAIRO_STATUS_SUCCESS)
        return CAIRO_STATUS_SUCCESS;

    do { int ret__; ((status < CAIRO_STATUS_LAST_STATUS) ? (void) (0) : __assert_fail ("status < CAIRO_STATUS_LAST_STATUS", "cairo-device.c", 463, __PRETTY_FUNCTION__)); ret__ = __sync_bool_compare_and_swap ((cairo_atomic_int_t *) &device->status, CAIRO_STATUS_SUCCESS, status); (void) ret__; } while (0);

    return _cairo_error (status);
}
# 479 "cairo-device.c"
unsigned int
cairo_device_get_reference_count (cairo_device_t *device)
{
    if (device == ((void *)0) ||
 ((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
 return 0;

    return (*&(&device->ref_count)->ref_count);
}
# 503 "cairo-device.c"
void *
cairo_device_get_user_data (cairo_device_t *device,
       const cairo_user_data_key_t *key)
{
    return _cairo_user_data_array_get_data (&device->user_data,
         key);
}
# 529 "cairo-device.c"
cairo_status_t
cairo_device_set_user_data (cairo_device_t *device,
       const cairo_user_data_key_t *key,
       void *user_data,
       cairo_destroy_func_t destroy)
{
    if (((*&(&device->ref_count)->ref_count) == ((cairo_atomic_int_t) -1)))
 return device->status;

    return _cairo_user_data_array_set_data (&device->user_data,
         key, user_data, destroy);
}
