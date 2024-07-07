#!/bin/bash

packagesNeeded='git npm neovim fish curl lolcat cowsay php nodejs tmux alacritty fortune';

is_mac=0;

if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded 
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
elif [ -x "$(command -v brew)" ];  then brew install $packagesNeeded; $is_mac=1;
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; $proceed_vim_setup=0; fi

mkdir -p $HOME/.config/alacritty
mkdir -p $HOME/.config/nvim

# Install latest nodejs (https://nodejs.org/en/download/package-manager#n) using npm.
sudo npm install -g n && n lts

# Install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install

# Install starship
curl -sS https://starship.rs/install.sh

./master_symlink.sh
./nvim/setup.sh
./tmux/setup.sh

# Add fish to shells
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# Try to change fish shell
if sudo chsh -s /usr/local/bin/fish; then
	echo "Successfully changed default shell to fish. Please relogin.";
else
	if sudo chsh -s /usr/bin/fish;then
		echo "Successfully changed default shell to fish. Please relogin.";
	else
		exit "Could not change default shell.";
	fi
fi

if [ $ismac == 1 ];
then
	echo "Installing hack font on Mac";
	brew tap homebrew/cask-fonts && brew install font-hack-nerd-font
else
	echo "Installing hack font on Linux";
	cd $HOME/git-personal/MAESON/  && git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts;
	cd $HOME/git-personal/MAESON/nerd-fonts;
	git sparse-checkout add patched-fonts/Hack;
	source install.sh Hack;
fi

