#!/bin/bash
set -e
TOOLS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UNINSTALL_DIR="$( dirname "$TOOLS_DIR" )"
JDK_DIR="$( dirname "$UNINSTALL_DIR" )"
DATE="$( date +%Y-%m-%d_%H:%M:%S )"

if [ -f ~/.bash_profile ] ; then
    echo "export JAVA_HOME="$JDK_DIR" # OpenJDK installer entry, added on "$DATE"" >> ~/.bash_profile
fi
