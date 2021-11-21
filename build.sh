#!/usr/bin/bash
# Copyright 2021 Saleem Abdulrasool <compnerd@compnerd.org>

SourceCache=/SourceCache
BinaryCache=/BinaryCache
ToolchainInstallRoot=/Library/Developer/Toolchains/unknown-Asserts-development.xctoolchain
PlatformInstallRoot=/Library/Developer/Platforms/Linux.platform
SDKInstallRoot=${PlatformInstallRoot}/Developer/SDKs/Linux.sdk

set -e

# zlib
cmake                                                                           \
  -B ${BinaryCache}/zlib-1.2.11                                                 \
  -D BUILD_SHARED_LIBS=NO                                                       \
  -D CMAKE_BUILD_TYPE=Release                                                   \
  -D CMAKE_INSTALL_PREFIX=/Library/zlib-1.2.11/usr                              \
  -D SKIP_INSTALL_FILES=YES                                                     \
  -G Ninja                                                                      \
  -S ${SourceCache}/zlib
cmake --build ${BinaryCache}/zlib-1.2.11
cmake --build ${BinaryCache}/zlib-1.2.11 --target install

# libxml2
cmake                                                                           \
  -B ${BinaryCache}/libxml2                                                     \
  -D BUILD_SHARED_LIBS=NO                                                       \
  -D CMAKE_BUILD_TYPE=Release                                                   \
  -D CMAKE_INSTALL_PREFIX=/Library/libxml2-2.9.12/usr                           \
  -D LIBXML2_WITH_ICONV=NO                                                      \
  -D LIBXML2_WITH_ICU=NO                                                        \
  -D LIBXML2_WITH_LZMA=NO                                                       \
  -D LIBXML2_WITH_PYTHON=NO                                                     \
  -D LIBXML2_WITH_TESTS=NO                                                      \
  -D LIBXML2_WITH_THREADS=YES                                                   \
  -D LIBXML2_WITH_ZLIB=NO                                                       \
  -G Ninja                                                                      \
  -S ${SourceCache}/libxml2

