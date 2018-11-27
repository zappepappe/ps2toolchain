#!/usr/bin/env bash
# newlib-1.10.0.sh by Naomi Peori (naomi@peori.ca)

NEWLIB_VERSION=1.10.0
## Download the source code.
SOURCE=http://mirrors.kernel.org/sourceware/newlib/newlib-$NEWLIB_VERSION.tar.gz
wget --continue $SOURCE || { exit 1; }

## Unpack the source code.
echo Decompressing newlib $NEWLIB_VERSION. Please wait.
rm -Rf newlib-$NEWLIB_VERSION && tar xfz newlib-$NEWLIB_VERSION.tar.gz || { exit 1; }

## Enter the source directory and patch the source code.
cd newlib-$NEWLIB_VERSION || { exit 1; }
if [ -e ../../patches/newlib-$NEWLIB_VERSION-PS2.patch ]; then
	cat ../../patches/newlib-$NEWLIB_VERSION-PS2.patch | patch -p1 || { exit 1; }
fi

TARGET="ee"
## Create and enter the build directory.
mkdir build-$TARGET && cd build-$TARGET || { exit 1; }

echo "Building with $PROC_NR jobs."
## Configure the build.
../configure --quiet --prefix="$PS2DEV/$TARGET" --target="$TARGET" || { exit 1; }

## Compile and install.
$GNUMAKE --quiet clean && CPPFLAGS="-G0" $GNUMAKE --quiet -j $PROC_NR && $GNUMAKE --quiet install && $GNUMAKE --quiet clean || { exit 1; }
