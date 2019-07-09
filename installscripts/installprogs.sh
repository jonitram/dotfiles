#!/bin/bash
# Script for installing useful programs

# list of casks installed via homebrew
casks="iterm2 amethyst"

# install programs based on device
if [ "$(uname)" = "Darwin" ]; then
    read -p "Would you like to install Homebrew (package manager)? [y/n] " hb
    if [ $hb = 'y' ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "done"
        for cask in $casks; do
            read -p "Would you like to install $cask? [y/n] " dlcask
            if [ $dlcask = 'y' ]; then
                brew cask install $cask
                echo "done"
            fi
        done
    fi
fi
