#!/bin/bash
make clean
make distclean
./configure --prefix=/usr --enable-shared
make -j$(nproc)
sudo checkinstall --pkgname=x264 \
    --pkgversion="3:$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')" \
    --backup=no --deldoc=yes --fstrans=no --default
