#!/bin/bash
find . -name "*.zip" -exec sh -c 'sha256sum {} > {}.sha256' \;
