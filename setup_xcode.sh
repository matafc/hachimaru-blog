#!/bin/bash

set -e


# start from scratch with iphonesimulator branch merged in
rm -rf kivy-ios || true
git clone git://github.com/kivy/kivy-ios
cd kivy-ios
git checkout iphonesimulator
git checkout master
git merge iphonesimulator -m "merge iphonesimulator"

make all
