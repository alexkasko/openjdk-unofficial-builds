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
export ALT_BOOTDIR=/home/obf/jdk7
export ALLOW_DOWNLOADS=false
export MILESTONE=u55-unofficial
export BUILD_NUMBER=b31
export STATIC_CXX=true
export UNLIMITED_CRYPTO=true
export FULL_DEBUG_SYMBOLS=0
export NO_DOCS=true

"$OUB_DIR"/make-and-bundle.sh -f

# export FULL_DEBUG_SYMBOLS=1
# export DEBUG_CLASSFILES=true
# export ALT_OUTPUTDIR="$OUB_DIR"/../openjdk/build.debug/linux-i586/

# "$OUB_DIR"/make-and-bundle.sh -d -f
