#!/bin/bash

echo "========================= Building yacoin"
echo "Running in folder:"
pwd

./autogen.sh
./configure
make
make release
