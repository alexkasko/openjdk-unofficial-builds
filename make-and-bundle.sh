#!/bin/bash
#set -e
OUB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OBF_DIR="$( dirname "$OUB_DIR" )"
LOG_FILE="$OBF_DIR"/build.log
FINISH_FLAG="$OBF_DIR"/build_finished.flag

# options
DEBUG_SWITCH=
IS_FINISH=

usage()
{
cat << EOF
usage: $0 [-d -f]

options:
    -d  debug build
    -f  write finish flag on success
    -h  show this message
EOF
}

while getopts "hdf" OPTION
do
    case $OPTION in
        h)
            usage
            exit
            ;;
        d)
            DEBUG_SWITCH="-d"
            ;;
        f)
            IS_FINISH="true"
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

echo "Starting make" >> "$LOG_FILE"
cd "$OBF_DIR"/openjdk
make >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ] ; then
    echo "Build aborted with error on 'make'" >> "$LOG_FILE"
    echo error > "$FINISH_FLAG"
    exit 1
fi

#make test >> "$LOG_FILE" 2>&1
#if [ $? -ne 0 ] ; then
#    echo "Build aborted with error on 'make test'" >> "$LOG_FILE"
#    echo error > "$FINISH_FLAG"
#    exit 1
#fi

# Prepare bundles
if [ ! -d "$OBF_DIR"/dist ] ; then
    mkdir "$OBF_DIR"/dist
fi
cd "$OBF_DIR"/dist

echo "Bundling image" >> "$LOG_FILE"
"$OBF_DIR"/oub/installer/build-image.sh $DEBUG_SWITCH -s "$OBF_DIR"/openjdk >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ] ; then
    echo "Build aborted with error on 'image'" >> "$LOG_FILE"
    echo error > "$FINISH_FLAG"
    exit 1
fi

if [ "x" == "x$DEBUG_SWITCH" ] ; then
    echo "Building installer" >> "$LOG_FILE"
    "$OBF_DIR"/oub/installer/build-installer.sh -s "$OBF_DIR"/openjdk >> "$LOG_FILE" 2>&1
    if [ $? -ne 0 ] ; then
        echo "Build aborted with error on 'installer'" >> "$LOG_FILE"
        echo error > "$FINISH_FLAG"
        exit 1
    fi
fi

echo "Build finished successfully" >> "$LOG_FILE"
if [ "true" == "$IS_FINISH" ] ; then
    echo success > "$FINISH_FLAG"
fi
exit 0

