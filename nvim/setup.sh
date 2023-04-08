#!/bin/bash

proceed_vim_setup=1;
 #Install vim vundle.
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE != 0 ];
then
	read -p "'git' command not found. Do you want to install Git? [y/N]" response 

	if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		packagesNeeded='git npm neovim'
		if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $packagesNeeded 
		elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $packagesNeeded
		elif [ -x "$(command -v dnf)" ];     then sudo dnf install $packagesNeeded
		elif [ -x "$(command -v zypper)" ];  then sudo zypper install $packagesNeeded
		elif [ -x "$(command -v brew)" ];  then brew install $packagesNeeded
		else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $packagesNeeded">&2; $proceed_vim_setup=0; fi
	else
		echo "Please manually install $packagesNeeded before proceeding.";
		exit 0
	fi
fi

if [ $proceed_vim_setup == 1 ];
then
	echo "Setting up vim";

	echo "Cloning Vundle";
	nvim_bundle_path=$HOME/.config/nvim/bundle/Vundle.vim
	echo "Cloning from Vundle repository into $nvim_bundle_path";
	git clone https://github.com/VundleVim/Vundle.vim.git "$nvim_bundle_path"

	nvim +PluginInstall +qall +silent

	# Install COC dependencides.
	cd $HOME/.config/nvim/bundle/coc.nvim
	npm install

	nvim "CocInstall coc-tsserver" +qall +silent
	nvim "CocInstall coc-tslint" +qall +silent
	nvim "CocInstall coc-tailwindcss" +qall +silent
	nvim "CocInstall coc-sqlfluff" +qall +silent
	nvim "CocInstall coc-sql" +qall +silent
	nvim "CocInstall coc-snippets" +qall +silent
	nvim "CocInstall coc-smartf" +qall +silent
	nvim "CocInstall coc-pyright" +qall +silent
	nvim "CocInstall coc-phpactor" +qall +silent
	nvim "CocInstall coc-omnisharp" +qall +silent
	nvim "CocInstall coc-json" +qall +silent
	nvim "CocInstall coc-html" +qall +silent
	nvim "CocInstall coc-fzf-preview" +qall +silent
	nvim "CocInstall coc-css" +qall +silent

	echo "Nvim is ready to go!"
fi
