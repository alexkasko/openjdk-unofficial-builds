#!/bin/bash
set -e
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/Library/Java/JavaVirtualMachines
cp -R "$CUR_DIR"/jdk1.7.0.jdk ~/Library/Java/JavaVirtualMachines
echo "Budle insalled into ~/Library/Java/JavaVirtualMachines/jdk1.7.0.jdk"
