#!/bin/bash
set -e
DATE="$( date +%Y-%m-%d_%H:%M:%S )"

if [ -f ~/.bash_profile ] ; then
    echo "export JAVA_HOME=\"\" # OpenJDK uninstaller entry, added on "$DATE"" >> ~/.bash_profile
fi
