#!/bin/bash
set -e
if [ -f ~/.bashrc ] ; then
    echo "export JAVA_HOME=# OpenJDK installer entry" >> ~/.bashrc
    echo "export OPENJDK_JDK_BIN=# OpenJDK installer entry" >> ~/.bashrc
    echo "export OPENJDK_JRE_BIN=# OpenJDK installer entry" >> ~/.bashrc
fi
