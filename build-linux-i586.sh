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
export BUILD_NUMBER=b6
export STATIC_CXX=true
export RHINO_JAR="$OUB_DIR"/libs/rhino/rhino-jdk6.jar
export FT2_LIB=-lfreetype
export FREETYPE2_HEADERS=-I/usr/include/freetype2

"$OUB_DIR"/make-and-bundle.sh
