#!/bin/bash

set -e

VERSION=5.20.1.34

wget "https://download.mono-project.com/sources/mono/mono-$VERSION.tar.bz2"
tar xf "mono-$VERSION.tar.bz2"

cd "mono-$VERSION"
patch support/fstab.c < ../fstab.patch

./configure
cd mono/eglib
make
cd ../../support
make

cp .libs/libMonoPosixHelper.so ../..
cd ../..

strip --strip-all libMonoPosixHelper.so
