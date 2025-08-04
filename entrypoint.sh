#!/bin/bash

echo "== Building yacoin =="
echo "Running in folder:"
pwd

# for genbuild.sh to run without errors on Ubuntu 20
git config --global --add safe.directory /src

echo "== Building dependencies =="
cd depends/
echo "Running in folder:"
pwd
echo "Content:"
ls -la
make -j 4 HOST=x86_64-pc-linux-gnu

echo "== Building yacoin =="
cd ..
echo "Running in folder:"
pwd
echo "Content:"
ls -la
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-pc-linux-gnu/share/config.site ./configure --enable-glibc-back-compat --enable-reduce-exports LDFLAGS=-static-libstdc++ --prefix=/
make -j 4
make install DESTDIR=`pwd`/release-root