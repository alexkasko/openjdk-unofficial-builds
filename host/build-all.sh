#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$SCRIPT_DIR"/jdk6-windows-i586.env 
. "$SCRIPT_DIR"/build.sh
#. "$SCRIPT_DIR"/jdk6-windows-amd64.env 
#"$SCRIPT_DIR"/build.sh
