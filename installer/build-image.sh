#!/bin/bash
set -e

# get installer builder dir
IMAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# check argument
SRC_DIR_RELATIVE=$1
if [ "x$SRC_DIR_RELATIVE" = "x" ] ; then
    echo "Error: OpenJDK sources directry must be provided as script argument"
    exit 1
fi
pushd "$SRC_DIR_RELATIVE" > /dev/null
SRC_DIR=`pwd`
popd > /dev/null

# search for jdk image
if [ -d "$SRC_DIR"/build/windows-i586 ] ; then
    PLATFORM=windows-i586
elif [ -d "$SRC_DIR"/build/windows-amd64 ] ; then
    PLATFORM=windows-amd64
elif [ -d "$SRC_DIR"/build/windows-amd64 ] ; then
    PLATFORM=windows-amd64
elif [ -d "$SRC_DIR"/build/linux-i586 ] ; then
    PLATFORM=linux-i586
elif [ -d "$SRC_DIR"/build/linux-amd64 ] ; then
    PLATFORM=linux-amd64
elif [ -d "$SRC_DIR"/build/macosx-x86_64 ] ; then
    PLATFORM=macosx-x86_64
else
    echo "Error: OpenJDK binaries not found in $SRC_DIR/build"
    exit 1
fi

# extract version
JDK_IMAGE="$SRC_DIR"/build/"$PLATFORM"/j2sdk-image

echo "Packing OpenJDK image: $JDK_IMAGE"

JAVA="$JDK_IMAGE"/bin/java
VERSION=`"$JAVA" -version 2>&1 | awk 'NR==2{print substr($5,0,length($5)-1)}'`
if [ -z "$VERSION" ] ; then
    echo "Error: cannot get 'java -version' from $JAVA"
    exit 1
fi

# pack image 
BUNDLE_NAME=openjdk-"$VERSION"-"$PLATFORM"-image
WORK_DIR="$IMAGE_DIR"/target
if [ ! -d "$DIRECTORY" ]; then
    mkdir "$WORK_DIR"
fi
CURDIR=`pwd`
pushd "$WORK_DIR" > /dev/null
cp -r "$JDK_IMAGE" .
mv j2sdk-image $BUNDLE_NAME
zip -rq "$BUNDLE_NAME".zip "$BUNDLE_NAME"
mv "$BUNDLE_NAME".zip "$CURDIR"
popd > /dev/null

# clean target
rm -rf "$WORK_DIR"

echo "Image packed successfully: $BUNDLE_NAME.zip"

exit 0
