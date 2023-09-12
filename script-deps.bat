:: @echo off
:: vcpkg.exe search gmp
:: vcpkg.exe search mpir

vcpkg.exe integrate install

vcpkg.exe install --triplet=x64-windows-static

cmake -B build -S .

cmake --build build --config Release

.\build\Release\my_test.exe
