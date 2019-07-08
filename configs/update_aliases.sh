#!/bin/bash
vim ~/.aliases
diffshells="zsh bash"
for diffshell in $diffshells; do
    if [ "$SHELL" = "/bin/$diffshell" ]; then
        rm -rf ~/.${diffshell}rc
        cp ~/.backups/${diffshell}rc ~/.${diffshell}rc
        cat ~/.aliases >> ~/.${diffshell}rc
        echo "Run 'source ~/.${diffshell}rc' to use the newly updated aliases"
    fi
done
