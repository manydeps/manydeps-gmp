#!/bin/bash

git submodule update --init --recursive
git pull --recurse-submodules

cd thirdparty
tar -xvf gmp-6.3.0.tar.xz 
mv gmp-6.3.0 gmp
cd gmp/
./configure
make
make check
