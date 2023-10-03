// SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
// Copyright (C) 2023 - manydeps - https://github.com/manydeps
//
// License is a combination of:
// - GMP (GPL-2.0-or-later OR LGPL-3.0-or-later)

#pragma once

// C
#include <stdio.h>
// C++
#include <vector>
// thirdparty (testing)
#include <gmp.h>    // NOLINT
#include <gmpxx.h>  // NOLINT

int basic_testing() {
  mpz_class a, b, c;
  a = 1234;
  //
  return 0;
}
