#!/bin/bash
set -e

# get image builder dir
IMAGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUB_DIR="$( dirname "$IMAGE_DIR" )"
OBF_DIR="$( dirname "$OUB_DIR" )"

# options
IS_DEBUG=
SRC_DIR_RELATIVE=

usage()
{
cat << EOF
usage: $0 [-d] -s openjdk_src_dir

options:
    -d  debug build
    -s  openjdk source dir
    -h  show this message
EOF
}

while getopts "hds:" OPTION
do
    case $OPTION in
        h)
            usage
            exit
            ;;
        d)
            IS_DEBUG="true"
            ;;
        s)
            SRC_DIR_RELATIVE=$OPTARG
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

# check argument
if [ "x$SRC_DIR_RELATIVE" == "x" ] ; then
    echo "Error: OpenJDK sources directry must be provided as '-s' argument"
    exit 1
fi
pushd "$SRC_DIR_RELATIVE" > /dev/null
SRC_DIR="$( pwd )"
popd > /dev/null

if [ "true" == "$IS_DEBUG" ] ; then
    BUILD_OUT_DIR=build.debug
else
    BUILD_OUT_DIR=build
fi

# search for jdk image
if [ -d "$SRC_DIR"/"$BUILD_OUT_DIR"/windows-i586 ] ; then
    PLATFORM=windows-i586
    ZIP=""$OBF_DIR"/zip/zip -qr"
elif [ -d "$SRC_DIR"/"$BUILD_OUT_DIR"/windows-amd64 ] ; then
    PLATFORM=windows-amd64
    ZIP=""$OBF_DIR"/zip/zip -qr"
elif [ -d "$SRC_DIR"/"$BUILD_OUT_DIR"/linux-i586 ] ; then
    PLATFORM=linux-i586
    ZIP="zip -qry"
elif [ -d "$SRC_DIR"/"$BUILD_OUT_DIR"/linux-amd64 ] ; then
    PLATFORM=linux-amd64
    ZIP="zip -qry"
elif [ -d "$SRC_DIR"/"$BUILD_OUT_DIR"/macosx-x86_64 ] ; then
    PLATFORM=macosx-x86_64
    ZIP="zip -qry"
    if [ ! -d "$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-image ] ; then
        # prepare server image
        cp -a "$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-image "$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-image
        rm -rf "$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-image/demo
        rm -rf "$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-image/sample
    fi
else
    echo "Error: OpenJDK binaries not found in $SRC_DIR/"$BUILD_OUT_DIR""
    exit 1
fi

JDK_IMAGE="$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-image

echo "Packing OpenJDK image: $JDK_IMAGE"

# fonts
cp -a "$IMAGE_DIR"/fonts "$JDK_IMAGE"/jre/lib

# extract version
JAVA="$JDK_IMAGE"/bin/java
OPENJDK_VERSION="$( "$JAVA" -version 2>&1 | awk 'NR==1{print substr($3,2,length($3)-2)}' )"
if [ -z "$OPENJDK_VERSION" ] ; then
    echo "Error: cannot get 'java -version' from $JAVA"
    exit 1
fi

# pack image 
if [ "true" == "$IS_DEBUG" ] ; then
    IMAGE_NAME=openjdk-"$OPENJDK_VERSION"-"$PLATFORM"-debug-image
else
    IMAGE_NAME=openjdk-"$OPENJDK_VERSION"-"$PLATFORM"-image
fi
WORK_DIR="$IMAGE_DIR"/target
if [ ! -d "$WORK_DIR" ]; then
    mkdir "$WORK_DIR"
fi
CURDIR=`pwd`
pushd "$WORK_DIR" > /dev/null
cp -a "$JDK_IMAGE" .
mv j2sdk-server-image "$IMAGE_NAME"
$ZIP "$IMAGE_NAME".zip "$IMAGE_NAME"
mv "$IMAGE_NAME".zip "$CURDIR"
popd > /dev/null

if [ "macosx-x86_64" == "$PLATFORM" ] ; then 
    # pack bundle
    JDK_BUNDLE="$SRC_DIR"/"$BUILD_OUT_DIR"/"$PLATFORM"/j2sdk-server-bundle
    if [ "true" == "$IS_DEBUG" ] ; then
        BUNDLE_NAME=openjdk-"$OPENJDK_VERSION"-"$PLATFORM"-debug-bundle
    else
        BUNDLE_NAME=openjdk-"$OPENJDK_VERSION"-"$PLATFORM"-bundle
    fi
    CURDIR=`pwd`
    pushd "$WORK_DIR" > /dev/null
    cp -a "$JDK_BUNDLE" .
    mv j2sdk-server-bundle "$BUNDLE_NAME"
    cp "$OBF_DIR"/oub/installer/macosx-x86_64/install_bundle.sh "$BUNDLE_NAME"
    # fonts
    cp -a "$IMAGE_DIR"/fonts "$BUNDLE_NAME"/jdk1.7.0.jdk/Contents/Home/jre/lib
    $ZIP "$BUNDLE_NAME".zip "$BUNDLE_NAME"
    mv "$BUNDLE_NAME".zip "$CURDIR"
    popd > /dev/null
fi

# clean target
rm -rf "$WORK_DIR"

echo "Image packed successfully: $IMAGE_NAME.zip"

exit 0
