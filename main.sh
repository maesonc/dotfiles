#!/bin/bash

packagesNeeded='git npm neovim fish curl lolcat cowsay php nodejs tmux alacritty'

if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded 
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
elif [ -x "$(command -v brew)" ];  then brew install $packagesNeeded
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; $proceed_vim_setup=0; fi

# Install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install starship
curl -sS https://starship.rs/install.sh | sh

source ./master_symlink.sh

