#!/bin/bash
set -e
TOOLS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UNINSTALL_DIR="$( dirname "$TOOLS_DIR" )"
JDK_DIR="$( dirname "$UNINSTALL_DIR" )"
DATE="$( date +%Y-%m-%d_%H:%M:%S )"

if [ -f ~/.bashrc ] ; then
    echo "export JAVA_HOME="$JDK_DIR" # OpenJDK installer entry, added on "$DATE"" >> ~/.bashrc
    echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$JAVA_HOME/jre/bin # OpenJDK installer entry, added on "$DATE"" >> ~/.bashrc
fi
