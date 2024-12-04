#!/bin/bash

readonly FILE_TOOLS=1
readonly DEV_TOOLS=2
readonly SYS_TOOLS=3

export Variant=$1
export Action=$2
echo "Выбран вариант $Variant Действие $Action"
echo "Нажмите enter для продолжения"
read
case $Variant in
    $FILE_TOOLS)
        sudo pacman -Sy mc
        sudo pacman -Sy dolphin
        sudo pacman -Sy nemo
        sudo pacman -Sy thunar
        sudo pacman -Sy pcmanfm
        sudo pacman -Sy ranger
        sudo pacman -Sy nnn
        sudo pacman -Sy vifm
        yay -Sy yazi-git
        sudo pacman -Sy bat
        sudo pacman -Sy fzf
    ;;
    $DEV_TOOLS)
        sudo pacman -Sy gcc
        sudo pacman -Sy base-devel
        sudo pacman -Sy neovim
        sudo pacman -Sy python
        sudo pacman -Sy nodejs
        sudo pacman -Sy npm
        sudo pacman -Sy docker
        sudo pacman -Sy clang
        sudo pacman -Sy cmake
        sudo pacman -Sy codium
        sudo pacman -Sy tmux
        sudo pacman -Sy htop
        sudo pacman -Sy zsh
        sudo pacman -Sy ruby
        sudo pacman -Sy rustup
        sudo pacman -Sy go
        sudo pacman -Sy maven
        sudo pacman -Sy gradle
        sudo pacman -Sy valgrind
        sudo pacman -Sy postgresql
    ;;
    $SYS_TOOLS)
        sudo pacman -Sy cmake
        sudo pacman -Sy base
        sudo pacman -Sy linux
        sudo pacman -Sy linux-firmware
        sudo pacman -Sy git
        sudo pacman -Sy networkmanager
        sudo pacman -Sy vim
        sudo pacman -Sy nano
        sudo pacman -Sy wget
        sudo pacman -Sy curl
        sudo pacman -Sy unzip
    ;;
esac
