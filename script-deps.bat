:: @echo off
:: vcpkg.exe search gmp
:: vcpkg.exe search mpir

echo "ON WINDOWS (Visual Studio), USE: Developer Command Prompt"
echo "REMEMBER TO RUN: .\tools\vcpkg\bootstrap-vcpkg.bat"

call .\tools\vcpkg\bootstrap-vcpkg.bat

:: vcpkg.exe integrate install
.\tools\vcpkg\vcpkg.exe --vcpkg-root .\tools\vcpkg integrate install

:: vcpkg.exe install --triplet=x64-windows-static
.\tools\vcpkg\vcpkg.exe --vcpkg-root .\tools\vcpkg install --triplet=x64-windows-static

echo "INVOKING cmake FOR win-x64-release"

:: cmake -B build -S .
cmake -B build -S . --preset=win-x64-release

echo "BUILDING WITH cmake"

cmake --build build --config Release

echo "LISTING files in build/ folder"

dir build

echo "RUNNING my_test"

.\build\my_test.exe
