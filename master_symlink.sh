#!/bin/bash

echo "Setting symlinks....";

ln -s -f $HOME/git-personal/MAESON/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -s -f $HOME/git-personal/MAESON/dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -s -f $HOME/git-personal/MAESON/dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -s -f $HOME/git-personal/MAESON/dotfiles/fish/omf.fish $HOME/.config/fish/conf.d/omf.fish
ln -s -f $HOME/git-personal/MAESON/dotfiles/fish/fish_greeting.fish $HOME/.config/fish/functions/fish_greeting.fish
ln -s -f $HOME/git-personal/MAESON/dotfiles/fish/starship.toml $HOME/.config/starship.toml

echo "Symlinks Completed";
