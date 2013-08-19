#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PID="$( cat "$SCRIPT_DIR"/.pid  )"
kill -9 "$PID"
