load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

local_repository(
    name = "manydeps-gmp",
    path = ".",
)

local_repository(
    name = "tools",
    path = "./tools",
)

# bazel query "@vcpkg-build//include:*"
# bazel query 'labels(hdrs, ...)'
local_repository(
    name = "vcpkg-build",
    path = "./build/vcpkg_installed/x64-linux",
)
