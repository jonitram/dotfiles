#!/bin/bash    
# Script to automatically pull all files in a set of given repos
# list of git repos
repos="$HOME/dotfiles $HOME/notes" 

for repo in $repos; do
    echo "Moving to $repo"
    cd $repo
    git checkout master
    echo "Updating all files"
    git remote update -p; git merge --ff-only @{u}
done
