#!/bin/bash

set -o nounset
set -e

VERSION=`grep Version rpmbuild/SPECS/pysshfs.spec | cut -f 2 -d ' '`

cd rpmbuild

rm -fr BUILD BUILDROOT RPMS SOURCES SRPMS tmp
mkdir  BUILD BUILDROOT RPMS SOURCES SRPMS tmp

rm -f ~/.rpmmacros
echo "%_topdir  "`pwd`     >> ~/.rpmmacros
echo "%_tmppath "`pwd`/tmp >> ~/.rpmmacros

rm -fr   pysshfs-${VERSION} pysshfs-${VERSION}.tar.gz 

mkdir -p pysshfs-${VERSION}/opt/pysshfs/bin
mkdir -p pysshfs-${VERSION}/opt/pysshfs/share
mkdir -p pysshfs-${VERSION}/etc
mkdir -p pysshfs-${VERSION}/usr

# Menu items:
cp -r ../etc/*      pysshfs-${VERSION}/etc/
cp -r ../usr/*      pysshfs-${VERSION}/usr/

# Python script:
cp ../pysshfs       pysshfs-${VERSION}/opt/pysshfs/bin

# Program icon:
cp ../pysshfs.png   pysshfs-${VERSION}/opt/pysshfs/share


tar zcvf pysshfs-${VERSION}.tar.gz pysshfs-${VERSION}
cp pysshfs-${VERSION}.tar.gz SOURCES/

rpmbuild -ba SPECS/pysshfs.spec
cd ..

find rpmbuild/ -iname '*rpm' -exec ls -lh {} \;


