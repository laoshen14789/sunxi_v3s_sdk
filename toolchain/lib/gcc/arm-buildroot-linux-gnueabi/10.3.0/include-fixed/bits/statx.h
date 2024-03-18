/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/home/shen/git_rep/buildroot-2021.11.x/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/statx.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* statx-related definitions and declarations.  Linux version.
   Copyright (C) 2018-2021 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.  */

/* This interface is based on <linux/stat.h> in Linux.  */

#ifndef _SYS_STAT_H
# error Never include <bits/statx.h> directly, include <sys/stat.h> instead.
#endif

/* Use the Linux kernel header if available.  */

/* Use "" to work around incorrect macro expansion of the
   __has_include argument (GCC PR 80005).  */
#ifdef __has_include
# if __has_include ("__linux__/stat.h")
#  include "linux/stat.h"
#  ifdef STATX_TYPE
#   define __statx_timestamp_defined 1
#   define __statx_defined 1
#  endif
# endif
#endif

#include <bits/statx-generic.h>
