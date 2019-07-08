#!/bin/bash
# Script to automatically push all files in a set of given git repos
# list of paths to git repos
repos="$HOME/dotfiles $HOME/notes"
# current date and time in "Hour:Min:Sec Day-Month-Year" format
cdt="$(date '+%H:%M:%S %d-%m-%Y')"

for repo in $repos; do
    echo "Moving to $repo"
    cd $repo 
    echo "Adding all files to be committed"
    git add .
    read -p "Would you like to write your own commit message? (y/n) " mess
    if [ $mess = 'y' ]; then
        # could use configurable commit messages
        read -p "Commit description: " desc
        git commit -m "$desc" 
    else
        echo "Writing Automatic commit message"
        git commit -m "automatic update pushing all files made on $cdt"
    fi
    echo "Pushing all files"
    git push
done
