#!/bin/bash
APPDIRNAME=`dirname "${BASH_SOURCE[0]}"`
APPNAME=`basename $APPDIRNAME`

echo $APPNAME

META_PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/.. && pwd )"
cd $META_PROJ_DIR

scripts/init_xcode_project.sh $APPNAME