@!/bin/bash

echo "========================= Building yacoin"

./autogen.sh
./configure
make

echo "========================= Done building yacoin"
