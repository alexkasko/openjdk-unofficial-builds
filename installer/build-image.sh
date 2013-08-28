#!/bin/bash
set -e

# get installer builder dir
IMAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUB_DIR="$( dirname "$IMAGE_DIR" )"
OBF_DIR="$( dirname "$OUB_DIR" )"

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
    ZIP=""$OBF_DIR"/zip/zip -qr"
elif [ -d "$SRC_DIR"/build/windows-amd64 ] ; then
    PLATFORM=windows-amd64
    ZIP=""$OBF_DIR"/zip/zip -qr"
elif [ -d "$SRC_DIR"/build/linux-i586 ] ; then
    PLATFORM=linux-i586
    ZIP="zip -qry"
elif [ -d "$SRC_DIR"/build/linux-amd64 ] ; then
    PLATFORM=linux-amd64
    ZIP="zip -qry"
elif [ -d "$SRC_DIR"/build/macosx-x86_64 ] ; then
    PLATFORM=macosx-x86_64
    ZIP="zip -qry"
    if [ ! -d "$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image ] ; then
        # prepare server image
        cp -r "$SRC_DIR"/build/"$PLATFORM"/j2sdk-image "$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image
        rm -rf "$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image/demo
        rm -rf "$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image/sample
    fi
else
    echo "Error: OpenJDK binaries not found in $SRC_DIR/build"
    exit 1
fi

# extract version
JDK_IMAGE="$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image

echo "Packing OpenJDK image: $JDK_IMAGE"

JAVA="$JDK_IMAGE"/bin/java
OPENJDK_VERSION="$( "$JAVA" -version 2>&1 | awk 'NR==1{print substr($3,2,length($3)-2)}' )"
ICEDTEA_VERSION="$( "$JAVA" -version 2>&1 | awk 'NR==2{print substr($5,0,length($5)-1)}' )"
if [ -z "$OPENJDK_VERSION" ] ; then
    echo "Error: cannot get 'java -version' from $JAVA"
    exit 1
fi

# pack image 
IMAGE_NAME=openjdk-"$OPENJDK_VERSION"-icedtea-"$ICEDTEA_VERSION"-"$PLATFORM"-debug-image
WORK_DIR="$IMAGE_DIR"/target
if [ ! -d "$WORK_DIR" ]; then
    mkdir "$WORK_DIR"
fi
CURDIR=`pwd`
pushd "$WORK_DIR" > /dev/null
cp -r "$JDK_IMAGE" .
mv j2sdk-server-image "$IMAGE_NAME"
$ZIP "$IMAGE_NAME".zip "$IMAGE_NAME"
mv "$IMAGE_NAME".zip "$CURDIR"
popd > /dev/null

if [ "macosx-x86_64" == "$PLATFORM" ] ; then 
    # pack bundle
    JDK_BUNDLE="$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-bundle
    BUNDLE_NAME=openjdk-"$OPENJDK_VERSION"-icedtea-"$ICEDTEA_VERSION"-"$PLATFORM"-debug-bundle
    CURDIR=`pwd`
    pushd "$WORK_DIR" > /dev/null
    cp -r "$JDK_BUNDLE" .
    mv j2sdk-server-bundle "$BUNDLE_NAME"
    cp "$OBF_DIR"/oub/installer/macosx-x86_64/install_bundle.sh "$BUNDLE_NAME"
    $ZIP "$BUNDLE_NAME".zip "$BUNDLE_NAME" 
    mv "$BUNDLE_NAME".zip "$CURDIR"
    popd > /dev/null
fi

# clean target
rm -rf "$WORK_DIR"

echo "Image packed successfully: $IMAGE_NAME.zip"

exit 0
