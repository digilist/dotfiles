#!/bin/bash

# This script updates all files in this repository with the original ones from the system
# It fixes the hard links which might get lost e.g. because of a git checkout.

if ! (git status | grep "nothing to commit, working tree clean" > /dev/null); then
    echo "Please commit all changes before running this script!"
    exit 1
fi

for FILE in `find home etc -type f`; do
    sudo ln -f "/${FILE}" "${FILE}"
done

# Hard links from another partition are not possible
for FILE in `find boot -type f`; do
    cp "/${FILE}" "${FILE}"
done
