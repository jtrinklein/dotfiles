#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root permission to run. Please run with: sudo $0 $*"
    exit 1
fi

function confirm_to_continue() {
    echo "are you sure? (y/N)"
    read confirm

    if [[ $confirm != "y" ]]; then
        echo "OK, nothing will happen. Goodbye"
        exit 0
    else
        echo "Great, continuing on."
    fi
}


diskutil list

echo "which disk should I flash? (make sure to get it correct!)"
echo "Just type the number and hit enter. (ex: 1 for /dev/disk1)"
read nDisk

echo "using /dev/disk${nDisk}"

confirm_to_continue


diskutil unmountDisk "/dev/disk${nDisk}"



