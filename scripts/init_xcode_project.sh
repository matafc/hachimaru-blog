#!/bin/bash
set -e

META_PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
cd $META_PROJ_DIR


KIVY_IOS_APP_NAME=$1
KIVY_PROJ_SRC_DIR=$META_PROJ_DIR/$KIVY_IOS_APP_NAME/src
SYNC_SRC_DIR=$KIVY_IOS_APP_NAME-xcode-src
XCODE_PROJECT_DIR=kivy-ios/app-$KIVY_IOS_APP_NAME
XCODE_PROJECT=$XCODE_PROJECT_DIR/$KIVY_IOS_APP_NAME.xcodeproj

echo "Creating xcode project $XCODE_PROJECT for app \"$KIVY_IOS_APP_NAME\" with source files from $KIVY_PROJ_SRC_DIR"
kivy-ios/tools/create-xcode-project.sh $KIVY_IOS_APP_NAME $KIVY_PROJ_SRC_DIR
