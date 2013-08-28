#!/bin/bash
#set -e
OUB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OBF_DIR="$( dirname "$OUB_DIR" )"
LOG_FILE="$OBF_DIR"/build.log
FINISH_FLAG="$OBF_DIR"/build_finished.flag

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
"$OBF_DIR"/oub/installer/build-image.sh "$OBF_DIR"/openjdk >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ] ; then
    echo "Build aborted with error on 'image'" >> "$LOG_FILE"
    echo error > "$FINISH_FLAG"
    exit 1
fi

#echo "Building installer" >> "$LOG_FILE"
#"$OBF_DIR"/oub/installer/build-installer.sh "$OBF_DIR"/openjdk >> "$LOG_FILE" 2>&1
#if [ $? -ne 0 ] ; then
#    echo "Build aborted with error on 'installer'" >> "$LOG_FILE"
#    echo error > "$FINISH_FLAG"
#    exit 1
#fi

echo "Build finished successfully" >> "$LOG_FILE"
echo success > "$FINISH_FLAG"
exit 0

