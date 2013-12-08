#!/bin/bash
set -e
OUB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export LD_LIBRARY_PATH=
export CLASSPATH=
export JAVA_HOME=
export LANG=C
export ANT_HOME="$OUB_DIR"/utils/ant
export PATH=$ANT_HOME/bin:$PATH
export ALT_CACERTS_FILE="$OUB_DIR"/libs/cacerts/cacerts
export ALT_BOOTDIR=/usr/lib/jvm/java-6-openjdk
export ALLOW_DOWNLOADS=false
export MILESTONE=unofficial
export BUILD_NUMBER=b29

export BUILD_FLAVOR=product
export FULL_DEBUG_SYMBOLS=0

"$OUB_DIR"/make-and-bundle.sh

export BUILD_FLAVOR=debug
export FULL_DEBUG_SYMBOLS=1
export DEBUG_CLASSFILES=true
export ALT_OUTPUTDIR="$OUB_DIR"/../openjdk/build.debug/linux-i586/

"$OUB_DIR"/make-and-bundle.sh -d -f
