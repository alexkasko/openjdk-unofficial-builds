#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#. "$SCRIPT_DIR"/jdk6-windows-i586.env 
#. "$SCRIPT_DIR"/build.sh
#. "$SCRIPT_DIR"/jdk6-windows-amd64.env 
#. "$SCRIPT_DIR"/build.sh
#. "$SCRIPT_DIR"/jdk6-linux-i586.env 
#. "$SCRIPT_DIR"/build.sh
#. "$SCRIPT_DIR"/jdk6-linux-amd64.env 
#. "$SCRIPT_DIR"/build.sh

. "$SCRIPT_DIR"/jdk7-windows-i586.env 
. "$SCRIPT_DIR"/build.sh
. "$SCRIPT_DIR"/jdk7-windows-amd64.env 
. "$SCRIPT_DIR"/build.sh
. "$SCRIPT_DIR"/jdk7-linux-i586.env 
. "$SCRIPT_DIR"/build.sh
. "$SCRIPT_DIR"/jdk7-linux-amd64.env 
. "$SCRIPT_DIR"/build.sh
. "$SCRIPT_DIR"/jdk7-macosx-x86_64.env 
. "$SCRIPT_DIR"/build.sh
