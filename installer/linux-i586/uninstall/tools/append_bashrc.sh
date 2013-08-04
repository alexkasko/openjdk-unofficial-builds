#!/bin/bash
set -e
TOOLS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UNINSTALL_DIR="$( dirname "$TOOLS_DIR" )"
JDK_DIR="$( dirname "$UNINSTALL_DIR" )"

if [ -f ~/.bashrc ] ; then
    echo "export JAVA_HOME="$JDK_DIR" # OpenJDK installer entry" >> ~/.bashrc
    echo "export OPENJDK_JDK_BIN=$JDK_DIR/bin # OpenJDK installer entry" >> ~/.bashrc
    echo "export OPENJDK_JRE_BIN=$JDK_DIR/jre/bin # OpenJDK installer entry" >> ~/.bashrc
    echo "export PATH=\$PATH:\$OPENJDK_JDK_BIN:\$OPENJDK_JRE_BIN # OpenJDK installer entry" >> ~/.bashrc
fi
