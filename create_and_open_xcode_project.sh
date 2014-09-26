#!/bin/bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

KIVY_IOS_APP_NAME="sample-app"
KIVY_PROJ_SRC_DIR="$SOURCE_DIR/src"
SYNC_SRC_DIR=$KIVY_IOS_APP_NAME-xcode-src
XCODE_PROJECT_DIR=kivy-ios/app-$KIVY_IOS_APP_NAME
XCODE_PROJECT=$XCODE_PROJECT_DIR/$KIVY_IOS_APP_NAME.xcodeproj


rm -rf $XCODE_PROJECT_DIR || true

kivy-ios/tools/create-xcode-project.sh $KIVY_IOS_APP_NAME $KIVY_PROJ_SRC_DIR
kivy-ios/tools/populate-project.sh $KIVY_IOS_APP_NAME $KIVY_PROJ_SRC_DIR

# open xcode project
open $XCODE_PROJECT