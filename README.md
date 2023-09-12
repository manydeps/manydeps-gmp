# depbox-gmp

## Running demo

Run `./script-deps.sh` and then build with cmake.

After build on cmake, it will indicate how to integrate:

```
[cmake]     #  gmp
[cmake]     find_package(PkgConfig REQUIRED)
[cmake]     pkg_check_modules(gmp REQUIRED IMPORTED_TARGET gmp)
[cmake]     target_link_libraries(main PkgConfig::gmp)
[cmake] 
[cmake]     # gmpxx
[cmake]     find_package(PkgConfig REQUIRED)
[cmake]     pkg_check_modules(gmpxx REQUIRED IMPORTED_TARGET gmpxx)
[cmake]     target_link_libraries(main PkgConfig::gmpxx)
```

### Common errors

#### System build dependencies on linux

GMP depends on some linux system build packages, such as:

- `apt-get install autoconf automake libtool`

## Managing tools

### Recursing submodules

Remember to do that!

```
git submodule update --init --recursive
git pull --recurse-submodules
```

### Initialization for vcpkg as submodule

Done already!

```
git submodule add https://github.com/Microsoft/vcpkg.git tools/vcpkg
./tools/vcpkg/bootstrap-vcpkg.sh
```

### Using Conan
```
python3 -m pip install conan
conan profile detect
```

On PROJECT, load conan auto-generated cmake files into build/ folder:

```
conan install conanfile.txt --output-folder=build-conan --build=missing
```

### CMakePresets with toolchain

Update your CMakePresets.json to include conan:

```{.json}
"cacheVariables": {
    "CMAKE_BUILD_TYPE": "Release",
    "CMAKE_TOOLCHAIN_FILE": "build-conan/conan_toolchain.cmake"
},
```
or, to add vcpkg:

```{.json}
"toolchainFile": "${sourceDir}/../deps/vcpkg/scripts/buildsystems/vcpkg.cmake",
```

Read more on vcpkg integration: https://learn.microsoft.com/pt-br/vcpkg/users/buildsystems/cmake-integration
