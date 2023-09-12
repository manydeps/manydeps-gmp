FROM mcr.microsoft.com/devcontainers/cpp:0-ubuntu-22.04
# LIST: https://mcr.microsoft.com/v2/vscode/devcontainers/cpp/tags/list

# command 'add-apt-repository'
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends software-properties-common

# see: https://launchpad.net/~ubuntu-toolchain-r/+archive/ubuntu/test
# RUN sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

# ===========

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
     chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
     fi \
     && rm -f /tmp/reinstall-cmake.sh

# NOTE on cmake:
# ubuntu 22 by default is 3.22.1 (old)
# conan requires at least 3.23 for preset functionalities
# next steps will get latest stable version... currently 3.27.4

# install base for latest cmake
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends gpg wget

# ==== get cmake/kitware keys
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null

# ==== cmake on ubuntu 22
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ jammy main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null

# ==== rotate kitware keys
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends kitware-archive-keyring

# ==== latest cmake... currently 3.27.4
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends cmake

# =============================
# =============================
# =============================

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends nodejs npm 

# clang-tidy
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends clang-tidy clang-format clangd

# bazel
RUN curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends nodejs 

RUN npm install -g @bazel/bazelisk

# install pip and cpplint
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends python3-pip
# install cpplint into /usr/local/bin/cpplint
RUN pip install cpplint 

# bumpver
RUN python3 -m pip install bumpver

# install CLN
#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends libcln-dev
     
RUN python3 -m pip install conan

RUN conan profile detect


# dependencies for gmp in vcpkg
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends autoconf automake libtool