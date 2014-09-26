#!/bin/bash
# Working with OSX 10.9.5, Xcode 6.1, iphonesimluator8.0
set -e

# start from scratch with iphonesimulator branch merged in
rm -rf kivy-ios || true
git clone git://github.com/kivy/kivy-ios
cd kivy-ios
git checkout iphonesimulator
git checkout master
git merge iphonesimulator -m "merge iphonesimulator"

# https://github.com/kivy/kivy-ios/issues/39 came back
rm -v src/SDL/SDL

# todo: remove this fix when libffi updates
cd ..
echo "Workaround for libffi simluator compilation on xcode 6.0+"
cp -v workarounds/build-libffi.sh kivy-ios/tools/build-libffi.sh
cp -v workarounds/generate-ios-source-and-headers.py kivy-ios/src/ffi_files/generate-ios-source-and-headers.py

cd kivy-ios
make all
