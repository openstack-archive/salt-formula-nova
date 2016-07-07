#!/bin/bash

cd /tmp/kitchen
export LC_ALL=C

make clean
make install
make test
make clean
