#!/bin/bash
# Script for cloning multiple git repositories

# list of repositories
repos="notes"

# create a new directory for repositories if desired
read -p "Would you like to create a directory for repositories? [y/n] " repdir
if [ $repdir = 'y' ]; then
    read -p "What would you like to call that directory? ~/" dirname
    echo "Making directory at ~/$dirname"
    mkdir -p $HOME/$dirname
    echo "done"
fi

# clone the repository either in the new directory or a specified location if a new directory wasn't created
for repo in $repos; do
    read -p "Would you like to clone the $repo repository? [y/n] " clrepo
    if [ $clrepo = 'y' ]; then
        if [ $repdir = 'y' ]; then
            reploc=$dirname
        else
            read -p "Where would you like to clone the $repo repository? ~/" reploc
        fi
        echo "Moving to ~/$reploc"
        cd $HOME/$reploc
        echo "Cloning the $repo repository into ~/$reploc"
        git clone https://github.com/jonitram/$repo.git
        echo "done"
    fi
done

