#!/bin/bash

echo "Building libffi ============================="

. $(dirname $0)/environment.sh

if [ ! -f $CACHEROOT/libffi-$FFI_VERSION.tar.gz ]; then
    try curl -L ftp://sourceware.org/pub/libffi/libffi-$FFI_VERSION.tar.gz > $CACHEROOT/libffi-$FFI_VERSION.tar.gz
fi

#get rid of old build
rm -rf $TMPROOT/libffi-$FFI_VERSION
try tar xvf $CACHEROOT/libffi-$FFI_VERSION.tar.gz
try mv libffi-$FFI_VERSION $TMPROOT

if [ -f $TMPROOT/libffi-$FFI_VERSION/build/Release-${TARGET_SDK}/libffi.a ]; then
    exit 0;
fi

# lib not found, compile it
pushd $TMPROOT/libffi-$FFI_VERSION
try patch -p1 < $KIVYIOSROOT/src/ffi_files/ffi-$FFI_VERSION-sysv.S.patch

# todo: submit this fix to libffi
echo "Changing -miphoneos-version-min=4.0 to -miphoneos-version-min=6.0 in kivy-ios/tmp/libffi-3.0.13/generate-ios-source-and-headers.py for xcode 6.0+ compatibility"
cp -v ../../src/ffi_files/generate-ios-source-and-headers.py generate-ios-source-and-headers.py

try xcodebuild  $XCODEBUILD_FLAGS  OTHER_CFLAGS="-no-integrated-as" -project libffi.xcodeproj -target "libffi iOS"
try cp build/Release-${TARGET_SDK}/libffi.a $BUILDROOT/lib/libffi.a
try cp -a build/Release-${TARGET_SDK}/usr/local/include $BUILDROOT/include/ffi
popd
