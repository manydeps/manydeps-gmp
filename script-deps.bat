@echo off

tools/vcpkg/vcpkg search gmp

tools/vcpkg/vcpkg search mpir

tools/vcpkg/vcpkg integrate install

tools/vcpkg/vcpkg install
