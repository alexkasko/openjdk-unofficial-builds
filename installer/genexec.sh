#!/bin/bash
set -e

if [ "jdk" == "$1" ] ; then
find . -name "*" -type f -exec ls -l {} \; | grep "\-rwxr" | awk '{print "<executable targetfile=\"$INSTALL_PATH/"substr($9,3)"\" os=\"unix\" stage=\"never\" failure=\"warn\" keep=\"true\"/>"}'
elif [ "jre" == "$1" ] ; then
find . -name "*" -type f -exec ls -l {} \; | grep "\-rwxr" | awk '{print "<executable targetfile=\"$INSTALL_PATH/jre/"substr($9,3)"\" os=\"unix\" stage=\"never\" failure=\"warn\" keep=\"true\"/>"}'
else 
    echo "Invalid genexec argument"
    exit 1
fi
exit 0
