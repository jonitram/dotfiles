#!/bin/bash
# Script for cloning multiple git repositories

# list of repositories
schoolrepos="notes textbooks cs314 cs429 cs439 isss"
coderepos="soundboardbot rapbot betbot"

# create a new directory for repositories if desired
read -p "Would you like to create a new directory for school repositories? [y/n] " srepdir
if [ $srepdir = 'y' ]; then
    read -p "What would you like to call that directory? ~/" sdirname
    echo "Making directory at ~/$sdirname"
    mkdir -p $HOME/$sdirname
    echo "done"
fi

# clone the repository either in the new directory or a specified location if a new directory wasn't created
for srepo in $schoolrepos; do
    read -p "Would you like to clone the $srepo repository? [y/n] " clsrepo
    if [ $clsrepo = 'y' ]; then
        if [ $srepdir = 'y' ]; then
            sreploc=$sdirname
        else
            read -p "Where would you like to clone the $srepo repository? ~/" sreploc
        fi
        echo "Moving to ~/$sreploc"
        cd $HOME/$sreploc
        echo "Cloning the $repo repository into ~/$sreploc"
        git clone https://github.com/jonitram/$srepo.git
        echo "done"
    fi
done

# create a new directory for repositories if desired
read -p "Would you like to create a new directory for code repositories? [y/n] " crepdir
if [ $crepdir = 'y' ]; then
    read -p "What would you like to call that directory? ~/" cdirname
    echo "Making directory at ~/$cdirname"
    mkdir -p $HOME/$cdirname
    echo "done"
fi

# clone the repository either in the new directory or a specified location if a new directory wasn't created
for crepo in $coderepos; do
    read -p "Would you like to clone the $crepo repository? [y/n] " clcrepo
    if [ $clcrepo = 'y' ]; then
        if [ $crepdir = 'y' ]; then
            creploc=$cdirname
        else
            read -p "Where would you like to clone the $crepo repository? ~/" creploc
        fi
        echo "Moving to ~/$creploc"
        cd $HOME/$creploc
        echo "Cloning the $repo repository into ~/$creploc"
        git clone https://github.com/jonitram/$crepo.git
        echo "done"
    fi
done
