#!/bin/bash

./vcpkg-install.sh

cmake -B build -S . --preset=$USE_PRESET

cmake --build build --config Release

./build/my_test

