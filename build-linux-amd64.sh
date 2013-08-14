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
export ALT_BOOTDIR=/home/obf/openjdk7
export ALLOW_DOWNLOADS=false
export MILESTONE=u40-unofficial
export BUILD_NUMBER=b1
export STATIC_CXX=true
export UNLIMITED_CRYPTO=true
export RHINO_JAR="$OUB_DIR"/libs/rhino/rhino-jdk7.jar
export FT2_LIBS=-lfreetype
export FT2_CFLAGS='-I$(FREETYPE_HEADERS_PATH) -I$(FREETYPE_HEADERS_PATH)/freetype2'
export DISABLE_INTREE_EC=true

"$OUB_DIR"/make-and-bundle.sh
