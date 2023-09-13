#!/bin/bash
conan install conanfile.txt --output-folder=build-conan --build=missing
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -GNinja -S..
# cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=../build-conan/conan_toolchain.cmake -GNinja -S..
ninja
#
echo "Executando aplicação"
./aplicacao