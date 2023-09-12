@echo off
cd tools/vcpkg
vcpkg.exe search gmp

vcpkg.exe search mpir

vcpkg.exe integrate install

vcpkg.exe install --triplet=x64-windows-static
