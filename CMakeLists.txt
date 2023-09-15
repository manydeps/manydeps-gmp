cmake_minimum_required(VERSION 3.26)

#set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/build-conan/conan_toolchain.cmake" CACHE STRING "")
#set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/../deps/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "")


if(EXISTS ${CMAKE_TOOLCHAIN_FILE})
message(STATUS "MAIN CMAKE_TOOLCHAIN_FILE EXISTS:" ${CMAKE_TOOLCHAIN_FILE})
else()
message(STATUS "MAIN CMAKE_TOOLCHAIN_FILE NOT FOUND:" ${CMAKE_TOOLCHAIN_FILE})
endif()

project(demo-depbox-gmp-project LANGUAGES CXX VERSION 0.0.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ===================
# header only library
# -------------------
add_library(depbox-gmp-lib INTERFACE)
target_include_directories(depbox-gmp-lib INTERFACE include/)

add_executable(app_demo src/main.cpp)
target_link_libraries(app_demo PRIVATE depbox-gmp-lib) #external_folder)

#add_library(external_folder INTERFACE)
#target_include_directories(external_folder INTERFACE external/)

if(UNIX)
set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/build/vcpkg_installed/x64-linux")
else() # WINDOWS?
set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/build/vcpkg_installed/x64-windows-static")
set(GMP_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/build/vcpkg_installed/x64-windows-static/include")
set(GMP_LIBRARIES "${CMAKE_SOURCE_DIR}/build/vcpkg_installed/x64-windows-static/lib") 
endif()

# PkgConfig from vcpkg only working on Linux!
# On Windows, do it manually with FindGMP

if(UNIX)
find_package(PkgConfig REQUIRED)
pkg_check_modules(gmp REQUIRED IMPORTED_TARGET gmp)
pkg_check_modules(gmpxx REQUIRED IMPORTED_TARGET gmpxx)
#
add_library(gmp::gmp ALIAS PkgConfig::gmp)
add_library(gmp::gmpxx ALIAS PkgConfig::gmpxx)
#
target_link_libraries(app_demo PRIVATE gmp::gmp)
#
else() # WINDOWS?
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")
set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")
# invoke FindGMP.cmake
# find_package(GMP REQUIRED)
# message(STATUS "MAIN GMP FOUND!" ${GMP_FOUND})
#
set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/cmake/modules") # ???
set(VCPKG_WINDOWS "${CMAKE_SOURCE_DIR}/build/vcpkg_installed/x64-windows-static")
include_directories("${VCPKG_WINDOWS}/include")
link_directories("${VCPKG_WINDOWS}/lib")
#
set(MPIR_LIB_PATH "${VCPKG_WINDOWS}/lib")
target_link_libraries(app_demo PRIVATE "${MPIR_LIB_PATH}/mpir.lib") # "${MPIR_LIB_PATH}/mpirxx.lib"
endif()


# TO HELP DEBUG, CHECK THESE VARIABLES
#message(STATUS "MAIN CMAKE_LIBRARY_PATH:" "${CMAKE_LIBRARY_PATH}")
#message(STATUS "MAIN CMAKE_INCLUDE_PATH:" "${CMAKE_INCLUDE_PATH}")
#message(STATUS "MAIN CMAKE_FIND_ROOT_PATH:" "${CMAKE_FIND_ROOT_PATH}")

# TO FORCE SOME CMake-Find MODULE, USE THESE
# set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cln/cmake/modules")
# set(CMAKE_PREFIX_PATH "${CMAKE_SOURCE_DIR}/cln/cmake/modules")
# find_package(GMP REQUIRED)

#==========
#  TESTS
#----------
Include(FetchContent)
#
FetchContent_Declare(Catch2 GIT_REPOSITORY https://github.com/catchorg/Catch2.git GIT_TAG v3.3.1)
FetchContent_MakeAvailable(Catch2)
#
list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
include(CTest)
include(Catch)
#
#add_executable(my_test tests/get_data.test.cpp)
#target_link_libraries(my_test PRIVATE brkpg_biblioteca Minha_pasta_external Catch2::Catch2WithMain)
#catch_discover_tests(my_test)


# this is heuristically generated, and may not be correct
add_executable(my_test tests/depbox_gmp.test.cpp)
#find_package(Catch2 CONFIG REQUIRED)

target_link_libraries(my_test PRIVATE Catch2::Catch2 Catch2::Catch2WithMain)

if(UNIX)
target_link_libraries(my_test PRIVATE gmp::gmp gmp::gmpxx)
else() # WINDOWS?
target_link_libraries(my_test PRIVATE mpir)
endif()

# catch_discover_tests(my_test)

