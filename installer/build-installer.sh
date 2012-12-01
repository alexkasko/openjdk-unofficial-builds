#!/bin/bash
set -e

# get installer builder dir
INSTALLER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

INSTALLER_PLATFORM="$INSTALLER_DIR"/"$PLATFORM"
# check installer support for platform
if [ ! -d "$INSTALLER_PLATFORM"  ] ; then
    echo "Error: installer is not supported for platform: $PLATFORM"
    exit 1
fi

# extract version
JDK_IMAGE="$SRC_DIR"/build/"$PLATFORM"/j2sdk-image

echo "Building installer for OpenJDK image: $JDK_IMAGE"

JAVA="$JDK_IMAGE"/bin/java
VERSION=`"$JAVA" -version 2>&1 | awk 'NR==2{print substr($5,0,length($5)-1)}'`
if [ -z "$VERSION" ] ; then
    echo "Error: cannot get 'java -version' from $JAVA"
    exit 1
fi

# copy 
rm -rf "$INSTALLER_PLATFORM"/j2sdk-image
rm -rf "$INSTALLER_PLATFORM"/jre
cp -r "$JDK_IMAGE" "$INSTALLER_PLATFORM"
mv "$INSTALLER_PLATFORM"/j2sdk-image/jre "$INSTALLER_PLATFORM"

# launch izpack
BUNDLE_NAME=openjdk-"$VERSION"-"$PLATFORM"
INSTALLER_TARGET="$INSTALLER_DIR"/target/"$BUNDLE_NAME"
rm -rf "$INSTALLER_TARGET"
pushd "$INSTALLER_DIR" > /dev/null
"$JAVA" -jar izpack-launcher.jar "$PLATFORM" target/"$BUNDLE_NAME"/install.jar
popd > /dev/null

# copy supplemental
if [ -f "$INSTALLER_PLATFORM"/install.exe ] ; then
    INSTALLER_LAUNCHER="$INSTALLER_PLATFORM"/install.exe
elif [ -f "$INSTALLER_PLATFORM"/install ] ; then
    INSTALLER_LAUNCHER="$INSTALLER_PLATFORM"/install
else
    echo "Error: cannot find installer launcher for platform: $INSTALLER_PLATFORM"
    exit 1
fi
cp "$INSTALLER_LAUNCHER" "$INSTALLER_TARGET"
mv "$INSTALLER_PLATFORM"/jre "$INSTALLER_TARGET"
rm -rf "$INSTALLER_PLATFORM"/j2sdk-image

# create installer archive
CURDIR=`pwd`
pushd "$INSTALLER_DIR"/target > /dev/null
zip -rq "$BUNDLE_NAME".zip "$BUNDLE_NAME"
mv "$BUNDLE_NAME".zip "$CURDIR"
popd > /dev/null

# clean target
rm -rf "$INSTALLER_TARGET"

echo "Installer packed successfully: $BUNDLE_NAME.zip"

exit 0
