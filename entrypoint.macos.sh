#!/bin/bash

echo "== Building yacoin for macOS =="
echo "Running in folder:"
pwd

# for genbuild.sh to run without errors
git config --global --add safe.directory /src

echo "== Building dependencies for macOS =="
cd depends/
make -j 4 HOST=x86_64-apple-darwin15

echo "== Building yacoin for macOS =="
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-apple-darwin15/share/config.site ./configure LDFLAGS=-static-libstdc++ --prefix=/
make -j 4
make install DESTDIR=`pwd`/release-root

echo "== Build completed. Executables are in release-root/bin directory =="
