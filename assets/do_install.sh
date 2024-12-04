#!/bin/bash

readonly FILE_TOOLS=1
readonly DEV_TOOLS=2
readonly SYS_TOOLS=3
readonly KEYS_ACTION=4
readonly MIRRORS_ACTION=5
readonly ZIP_TOOLS=6

export Variant=$1
export Action=$2
echo "Выбран вариант $Variant Действие $Action"
echo "Нажмите enter для продолжения"
read
case $Variant in
    $FILE_TOOLS)
        sudo pacman -Sy kup
        sudo pacman -Sy bup
        sudo pacman -Sy luckybackup
        sudo pacman -Sy deja-dup
        sudo pacman -Sy mc
        sudo pacman -Sy dolphin
        sudo pacman -Sy nemo
        sudo pacman -Sy thunar
        sudo pacman -Sy pcmanfm
        sudo pacman -Sy ranger
        sudo pacman -Sy nnn
        sudo pacman -Sy vifm
        sudo pacman -Sy yazi-git
        sudo pacman -Sy bat
        sudo pacman -Sy fzf
    ;;
    $DEV_TOOLS)
    	sudo pacman -Sy autoconf
		sudo pacman -Sy gcc
		sudo pacman -Sy automake
		sudo pacman -Sy base-devel
		sudo pacman -Sy git
 		sudo pacman -Sy cppdap
		sudo pacman -Sy jsoncpp
		sudo pacman -Sy rhash
		sudo pacman -Sy cmake 
		sudo pacman -Sy ninja
		sudo pacman -Syu llvm clang lld
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
        sudo pacman -Sy python3
        sudo pacman -Sy python3-pip
        sudo pacman -Sy ruby
        sudo pacman -Sy nodejs
        sudo pacman -Sy npm
        sudo pacman -Sy kotlin
        sudo pacman -Sy kotlin-native-bin
        sudo pacman -Sy kotlin-language-server
        sudo pacman -Sy kscript
        sudo pacman -Sy ktlint
        sudo pacman -Sy ki-shell-bin
        sudo pacman -Sy detekt-bin
        sudo pacman -Sy rustc
        sudo pacman -Sy rustup
        sudo pacman -Sy dotnet-runtime
        sudo pacman -Sy dotnet-sdk
        sudo pacman -Sy github-desktop-bin
        sudo pacman -Sy notepadqq
        sudo pacman -Sy lazarus
        sudo pacman -Sy qtcreator
        sudo pacman -Sy virtualbox
        sudo pacman -Sy code
        sudo pacman -Sy eclipse-platform
        sudo pacman -Sy docker
        sudo pacman -Sy docker-desktop
        sudo pacman -Sy brew
        ;;
    $SYS_TOOLS)
    	sudo pacman -S gvfs 
		sudo pacman -S ccache 
		sudo pacman -S grub-customizer
		sudo pacman -S mc
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
    $KEYS_ACTION)
    	sudo pacman-key --init               
		sudo pacman-key --populate archlinux  
		sudo pacman-key --refresh-keys        
		sudo pacman -Sy   
    ;;
    $MIRRORS_ACTION)
    	sudo pacman -S reflector rsync curl   
		sudo reflector --verbose --country 'Russia' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
    ;;
    $ZIP_TOOLS)
        sudo pacman -Sy lrzip unrar unzip unace p7zip squashfs-tools
    ;;
esac
