// SPDX-License-Identifier: GPL-3.0-or-later OR LGPL-3.0-or-later
// Copyright (C) 2023 - manydeps - https://github.com/manydeps
//
// License is a combination of:
// - GMP (GPL-2.0-or-later OR LGPL-3.0-or-later)

// C
#include <stdio.h>

// C++
#include <iostream>
#include <vector>
// local library
#include <manydeps-gmp-lib/Testing.hpp>
//
#include <gmp.h>

int main() {
  //
  int x = basic_testing();
  std::cout << "finished successfully!" << std::endl;
  return x;
}
