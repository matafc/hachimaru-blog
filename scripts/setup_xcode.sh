#!/bin/bash
# Working with OSX 10.9.5, Xcode 6.1, iphonesimluator8.0
set -e

META_PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
cd $META_PROJ_DIR

# start from scratch with iphonesimulator branch merged in
git clone git://github.com/kivy/kivy-ios
cd kivy-ios
git checkout iphonesimulator
git checkout master
git merge iphonesimulator -m "merge iphonesimulator"

# https://github.com/kivy/kivy-ios/issues/39 came back
rm -v $META_PROJ_DIR/kivy-ios/src/SDL/SDL

# todo: remove this fix when libffi updates
cd ..
echo "Workaround for libffi simluator compilation on xcode 6.0+"
cp -v $META_PROJ_DIR/scripts/workarounds/build-libffi.sh $META_PROJ_DIR/kivy-ios/tools/build-libffi.sh

cd $META_PROJ_DIR/kivy-ios
make all
