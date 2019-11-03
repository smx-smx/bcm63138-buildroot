#!/bin/bash
TOP=`readlink -f ../`

[ -e $TOP/output/build/busybox-1.28.4/.config ] && cp $TOP/output/build/busybox-1.28.4/.config config_busybox
[ -e $TOP/output/build/asterisk-14.7.6/menuselect.makedeps ] && cp $TOP/output/build/asterisk-14.7.6/menuselect.makedeps asterisk_makedeps
[ -e $TOP/output/build/asterisk-14.7.6/menuselect.makeopts ] && cp $TOP/output/build/asterisk-14.7.6/menuselect.makeopts asterisk_makeopts

cd $TOP
make clean && \
make busybox-extract && \
cp config_busybox output/build/busybox-1.28.4/.config && \
make asterisk-extract && \
cp asterisk_makedeps output/build/asterisk-14.7.6/menuselect.makedeps && \
cp asterisk_makeopts output/build/asterisk-14.7.6/menuselect.makeopts && \
make
