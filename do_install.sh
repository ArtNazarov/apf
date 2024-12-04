#!/bin/bash

readonly FILE_TOOLS=1
readonly DEV_TOOLS=2
readonly SYS_TOOLS=3

export Variant=$1
echo $Variant
case $Variant in
    $FILE_TOOLS)
        sudo pacman -Sy mc
    ;;
    $DEV_TOOLS)
        sudo pacman -Sy gcc
    ;;
    $SYS_TOOLS)
        sudo pacman -Sy cmake
    ;;
esac
