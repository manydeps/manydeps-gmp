:: @echo off
:: vcpkg.exe search gmp
:: vcpkg.exe search mpir

echo "ON WINDOWS (Visual Studio), USE: Developer Command Prompt"
echo "REMEMBER TO RUN: .\tools\vcpkg\bootstrap-vcpkg.bat"

:: vcpkg.exe integrate install
.\tools\vcpkg\vcpkg.exe --vcpkg-root .\tools\vcpkg integrate install

:: vcpkg.exe install --triplet=x64-windows-static
.\tools\vcpkg\vcpkg.exe --vcpkg-root .\tools\vcpkg install --triplet=x64-windows-static

cmake -B build -S .

cmake --build build --config Release

.\build\Release\my_test.exe
