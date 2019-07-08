#!/bin/bash

# create a safer git 'up' alias for use instead of git 'pull'
read -p "Would you like to create a git 'up' alias as an alternative to git 'pull'? [y/n] " gitup
if [ $gitup = 'y' ]; then
    echo "Creating git 'up' alias"
    git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
    echo "done"
fi

# current working directory
scriptpath="$( cd "$(dirname "$0")" ; pwd -P )"

vfiles="vim vimrc"
afiles="aliases update_aliases.sh"

# create a backup directory for any existing dotfiles
echo "creating a 'backups' directory for any existing .files in '~/'"
mkdir -p $scriptpath/../backups
echo "done"
echo "creating symbolic link to the 'backups' directory in '~/'"
ln -s $scriptpath/../backups ~/.backups
echo "done"

echo "***** 'vim' setup *****"
read -p "Would you like to setup 'vim' configurations? [y/n] " vsetup
if [ $vsetup = 'y' ]; then
    for vfile in $vfiles; do
        echo "moving '.$vfile' into the 'backups' directory (if '.$vfile' exists)"
        mv ~/.$vfile $scriptpath/../backups/$vfile
        echo "done"
        echo "creating symbolic link to '$vfile' in '~/'"
        ln -s $scriptpath/../configs/$vfile ~/.$vfile
        echo "done"
    done
fi

echo "***** 'aliases' setup *****"
read -p "Would you like to setup 'alias' configurations? [y/n] " asetup
if [ $asetup = 'y' ]; then
    for afile in $afiles; do
        echo "creating symbolic link to '$afile' in '~/'"
        ln -s $scriptpath/../configs/$afile ~/.$afile
        echo "done"
    done
fi

diffshells="zsh bash"

if [ $asetup = 'y' ]; then
    for diffshell in $diffshells; do
        if [ "$SHELL" = "/bin/$diffshell" ]; then
            echo "***** '$diffshell' setup *****"
            read -p "Would you like to setup '$diffshell' configurations? [y/n] " shsetup
            if [ $shsetup = 'y' ]; then
                echo "copying '.${diffshell}rc' into the 'backups' directory (if '.${diffshell}rc' exists)"
                cp ~/.${diffshell}rc $scriptpath/../backups/${diffshell}rc
                echo "done"
                echo "adding aliases to '~/.${diffshell}rc'"
                cat ~/.aliases >> ~/.${diffshell}rc
                echo "done"
                if [ $diffshell = 'bash' ]; then
                    echo "moving original '~/.bash_profile' file to 'backups' (if '.bash_profile' exists)"
                    mv ~/.bash_profile $scriptpath/../backups/bash_profile
                    echo "done"
                    echo "creating symbolic link to 'bash_profile' in '~/'"
                    ln -s $scriptpath/../configs/bash_profile ~/.bash_profile
                    echo "done"
                fi
                echo "Run 'source ~/.${diffshell}rc' to use this shell's new configuration"
            fi
        fi
    done
fi
