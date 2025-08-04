#!/bin/bash

echo "== Building yacoin for Windows =="
echo "Running in folder:"
pwd

# for genbuild.sh to run without errors on Ubuntu 20
git config --global --add safe.directory /src

update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix

echo "== Building dependencies =="
cd depends/
make -j 4 HOST=x86_64-w64-mingw32

echo "== Building yacoin =="
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure LDFLAGS=-static-libstdc++ --prefix=/
make -j 4
make install DESTDIR=`pwd`/release-root