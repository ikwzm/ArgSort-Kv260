#!/bin/bash

COMMAND="test_all"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root." >&2
    exit 1
fi

for target in argsort_??_[123]_[012]; do
    echo "TARGET=$target"
    TARGET="$target" rake install
    rake $COMMAND
    rake uninstall
done

