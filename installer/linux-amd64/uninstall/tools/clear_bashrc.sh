#!/bin/bash
set -e
DATE="$( date +%Y-%m-%d_%H:%M:%S )"

if [ -f ~/.bashrc ] ; then
    echo "export JAVA_HOME=\"\" # OpenJDK uninstaller entry, added on "$DATE"" >> ~/.bashrc
fi
