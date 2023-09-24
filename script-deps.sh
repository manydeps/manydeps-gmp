#!/bin/bash

./vcpkg-install.sh

conan profile detect

USE_PRESET=win-x64-release

COUNT_LINUX=`conan profile show | grep Linux | wc -l`
if [[ "$COUNT_LINUX" -ne 0 ]]; then
    USE_PRESET=linux-release
fi

cmake -B build -S . --preset=$USE_PRESET

cmake --build build --config Release

./build/my_test

