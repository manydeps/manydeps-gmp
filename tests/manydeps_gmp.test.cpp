// SPDX-License-Identifier:  MIT
// Copyright (C) 2023

#include <iostream>
//
#include <catch2/catch_all.hpp>
//
#include <gmp.h>    // NOLINT
#include <gmpxx.h>  // NOLINT

TEST_CASE("Teste1-X") {
  int x = 10;
  REQUIRE(x == 10);
}

TEST_CASE("Teste2-X") {
  mpz_class a, b, c;
  a = 1234;
  b = "-5678";
  c = a + b;
  bool r = (c == -4444);
  REQUIRE(r);
}
