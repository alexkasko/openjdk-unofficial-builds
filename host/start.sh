#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
nohup "$SCRIPT_DIR"/build-all.sh >> "$SCRIPT_DIR"/build.log 2>&1 &
echo "$!" > .pid

tail -F "$SCRIPT_DIR"/build.log

