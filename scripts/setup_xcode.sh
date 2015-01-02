#!/bin/bash
# Working with OSX 10.10.1, Xcode 6.1.1, iphonesimluator8.0
set -e

META_PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
cd $META_PROJ_DIR

# using forked repo to build for ios sim
git clone git@github.com:matafc/kivy-ios.git
cd kivy-ios

cd $META_PROJ_DIR/kivy-ios
make all
