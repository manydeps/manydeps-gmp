@echo off

deps/vcpkg/vcpkg search gmp

deps/vcpkg/vcpkg search mpir

deps/vcpkg/vcpkg integrate install

deps/vcpkg/vcpkg install
