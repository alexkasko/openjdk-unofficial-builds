#!/bin/bash
set -e

# get installer builder dir
INSTALLER_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUB_DIR="$( dirname "$INSTALLER_DIR" )"
OBF_DIR="$( dirname "$OUB_DIR" )"
NEED_EXEC=false

# options
IS_ICEDTEA=
SRC_DIR_RELATIVE=

usage()
{
cat << EOF
usage: $0 [-i] -s openjdk_src_dir

options:
    -i  icedtea build
    -s  openjdk source dir
    -h  show this message
EOF
}

while getopts "his:" OPTION
do
    case $OPTION in
        h)
            usage
            exit
            ;;
        i)
            IS_ICEDTEA="true"
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
    NEED_EXEC=true
elif [ -d "$SRC_DIR"/build/linux-amd64 ] ; then
    PLATFORM=linux-amd64
    ZIP="zip -qry"
    NEED_EXEC=true
elif [ -d "$SRC_DIR"/build/macosx-x86_64 ] ; then
    PLATFORM=macosx-x86_64
    ZIP="zip -qry"
    NEED_EXEC=true
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
JDK_IMAGE="$SRC_DIR"/build/"$PLATFORM"/j2sdk-server-image

echo "Building installer for OpenJDK image: $JDK_IMAGE"

JAVA="$JDK_IMAGE"/bin/java
OPENJDK_VERSION="$( "$JAVA" -version 2>&1 | awk 'NR==1{print substr($3,2,length($3)-2)}' )"
if [ "true" == "$IS_ICEDTEA" ] ; then
    ICEDTEA_VERSION="$( "$JAVA" -version 2>&1 | awk 'NR==2{print substr($5,0,length($5)-1)}' )"
fi    
if [ -z "$OPENJDK_VERSION" ] ; then
    echo "Error: cannot get 'java -version' from $JAVA"
    exit 1
fi

# copy 
rm -rf "$INSTALLER_PLATFORM"/j2sdk-server-image
rm -rf "$INSTALLER_PLATFORM"/jre
cp -r "$JDK_IMAGE" "$INSTALLER_PLATFORM"
mv "$INSTALLER_PLATFORM"/j2sdk-server-image/jre "$INSTALLER_PLATFORM"
if [ "true" == "$NEED_EXEC" ] ; then
    pushd "$INSTALLER_PLATFORM"/j2sdk-server-image > /dev/null
    JDK_EXEC_LIST="$( "$INSTALLER_DIR"/genexec.sh jdk | tr '\n' ' ' )"
    awk -v jeln="$JDK_EXEC_LIST" '/\${JDK_EXECUTABLES}/ { $1=jeln }1' "$INSTALLER_PLATFORM"/izpack.xml > "$INSTALLER_PLATFORM"/izpack.xml_tmp
    mv "$INSTALLER_PLATFORM"/izpack.xml_tmp "$INSTALLER_PLATFORM"/izpack.xml
    popd > /dev/null
    pushd "$INSTALLER_PLATFORM"/jre > /dev/null
    JRE_EXEC_LIST="$( "$INSTALLER_DIR"/genexec.sh jre | tr '\n' ' ' )"
    awk -v jeln="$JRE_EXEC_LIST" '/\${JRE_EXECUTABLES}/ { $1=jeln }1' "$INSTALLER_PLATFORM"/izpack.xml > "$INSTALLER_PLATFORM"/izpack.xml_tmp
    mv "$INSTALLER_PLATFORM"/izpack.xml_tmp "$INSTALLER_PLATFORM"/izpack.xml
    popd > /dev/null
fi

# launch izpack
if [ "true" == "$IS_ICEDTEA" ] ; then
    BUNDLE_NAME=openjdk-"$OPENJDK_VERSION"-icedtea-"$ICEDTEA_VERSION"-"$PLATFORM"-installer
else
    BUNDLE_NAME=openjdk-"$OPENJDK_VERSION"-"$PLATFORM"-installer
fi    
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
rm -rf "$INSTALLER_PLATFORM"/j2sdk-server-image

# create installer archive
CURDIR=`pwd`
pushd "$INSTALLER_DIR"/target > /dev/null
$ZIP "$BUNDLE_NAME".zip "$BUNDLE_NAME"
mv "$BUNDLE_NAME".zip "$CURDIR"
popd > /dev/null

# clean target
rm -rf "$INSTALLER_TARGET"

echo "Installer packed successfully: $BUNDLE_NAME.zip"

exit 0
