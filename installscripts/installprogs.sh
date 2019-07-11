#!/bin/bash
# Script for installing useful programs

# list of casks installed via homebrew
acore="google-chrome spotify vlc discord slack visual-studio-code iterm2"
bcore="marshallofsound-google-play-music-player microsoft-office libreoffice jetbrains-toolbox amethyst docker"
brews="python3 go"

# install programs based on device
if [ "$(uname)" = "Darwin" ]; then
    if [[ $(command -v brew) == "" ]]; then
        read -p "Would you like to install Homebrew (package manager)? [y/n] " hb
        if [ $hb = 'y' ]; then
            echo "installing Homebrew"
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            echo "done"
        fi
    else
        hb='y'
        read -p "Would you like to update Homebrew? [y/n] " bu
        if [ $bu = 'y' ]; then
            echo "updating Homebrew"
            brew update
            echo "done"
        fi
    fi
    if [ $hb = 'y' ]; then
        read -p "Would you like to install major-core all at once? ($acore) [y/n] " dlcore
        if [ $dlcore = 'y' ]; then
            for cask in $acore; do
                echo "installing $cask"
                brew cask install $cask
                echo "done"
            done
        else
            for cask in $acore; do
                read -p "Would you like to install $cask? [y/n] " dlcask
                if [ $dlcask = 'y' ]; then
                    brew cask install $cask
                    echo "done"
                fi
            done
        fi
        read -p "Would you like to install minor-core all at once? ($bcore) [y/n] " dlcore
        if [ $dlcore = 'y' ]; then
            for cask in $bcore; do
                echo "installing $cask"
                brew cask install $cask
                echo "done"
            done
        else
            for cask in $bcore; do
                read -p "Would you like to install $cask? [y/n] " dlcask
                if [ $dlcask = 'y' ]; then
                    brew cask install $cask
                    echo "done"
                fi
            done
        fi
        for brew in $brews; do
            read -p "Would you like to install $brew? [y/n] " dlbrew
            if [ $dlbrew = 'y' ]; then
                brew install $brew
                echo "done"
            fi
        done
    fi
fi
