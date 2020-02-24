#!/bin/bash -x

mkdir -p pkg
cp -r inst pkg/usr

cd pkg
cat << EOF > .PKGINFO
pkgname = bluespec-bsc
pkgver = 1.0.0-1
pkgdesc = Bluespec bsc compiler
url = github.com/B-Lang-org/bsc

builddate = $(date -u '+%s')
size = $(du -sb --apparent-size | awk '{print $1}')

arch = $(uname -m)
EOF

tar -cf - .PKGINFO * | xz -c -z - > ../bsc.pkg.tar.xz
