if status is-interactive
and not set -q TMUX
    #tmux attach -t default || tmux new -s default
    exec tmux
end

# <------- Fish Greeting ------->

function fish_greeting
	fortune | cowsay -f tux | lolcat
end

#funcsave fish_greeting

# <------- Fish Interactive ------->
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# <------- Basics ------->

fish_vi_key_bindings
alias vim="nvim"
alias cat="bat"

# <------- Paths ------->
fish_add_path /Applications/XAMPP/xamppfiles
fish_add_path /Applications/XAMPP/bin
fish_add_path /Applications/Alacritty.app/Contents/MacOS
fish_add_path /Users/maesonchan/Library/Python/3.9/bin
# fish_add_path /usr/local/opt/ruby/bin
fish_add_path ~/scripts
fish_add_path ~/Work/scripts
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin:$PATH
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin:$PATH
fish_add_path /Users/maesonchan/.flutter/bin
fish_add_path /usr/local/go/bin


# <------- Starship ------->
starship init fish | source

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Created by `pipx` on 2024-07-01 12:06:56
set PATH $PATH /Users/maesonchan/.local/bin
