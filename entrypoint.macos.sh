#!/bin/bash

echo "== Building yacoin for MacOS =="
echo "Running in folder:"
pwd

export PATH=$OSXCROSS_BASE/target/bin:$PATH
export OSXCROSS_NO_INCLUDE_PATH_WARNINGS=1
export SDK_VERSION=10.11
export SDK_PATH=$OSXCROSS_BASE/target/SDK

echo "== Building dependencies =="
cd depends/
make -j 4 HOST=x86_64-apple-darwin15

echo "== Building yacoin =="
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-apple-darwin15/share/config.site ./configure LDFLAGS=-static-libstdc++ --prefix=/
make -j 4
make install DESTDIR=`pwd`/release-root
