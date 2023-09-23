// SPDX-License-Identifier: LGPL
// Copyright (C) 2023

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
