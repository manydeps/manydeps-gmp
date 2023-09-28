load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

package(
    default_visibility = ["//visibility:public"],
)

# DOCUMENTATION ON SELECT:
# https://bazel.build/reference/be/functions?hl=pt-br#select

# thirdparty vcpkg-installed GMP library
cc_library(
    name = "lib",
    #srcs = glob(
    #    ["vcpkg_installed/x64-linux/lib/**/*.a"],
    #    ["vcpkg_installed/x64-linux/lib/**/*.lib"]
    #),
    srcs = select({
        "@bazel_tools//src/conditions:windows": glob(["mpir_x64-windows-static/lib/**/mpir.lib", "mpir_x64-windows/lib/**/mpir.lib"]),
        "@bazel_tools//src/conditions:darwin": glob(["gmp_x64-osx/lib/**/*.a"]),
        "//conditions:default": glob(["gmp_x64-linux/lib/**/*.a"]),
    }),
    #hdrs = glob(["vcpkg_installed/x64-linux/include/**/*.h"]),
    hdrs = select({
        "@bazel_tools//src/conditions:windows": glob(["mpir_x64-windows-static/include/**/*.h","mpir_x64-windows/include/**/*.h"]),
        "@bazel_tools//src/conditions:darwin": glob(["gmp_x64-osx/include/**/*.h"]),
        "//conditions:default": glob(["gmp_x64-linux/include/**/*.h"]),
    }),
    #includes = ["vcpkg_installed/x64-linux/include/"],
    includes = select({
        "@bazel_tools//src/conditions:windows": ["mpir_x64-windows-static/include/", "mpir_x64-windows/include/"],
        "@bazel_tools//src/conditions:darwin": ["gmp_x64-osx/include/"],
        "//conditions:default": ["gmp_x64-linux/include/"],
    }),
    visibility = ["//visibility:public"],
    #linkstatic = 1
)
