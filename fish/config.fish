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
fish_add_path /Users/maesonchan/Library/Python/3.9/bin
fish_add_path /Users/maesonchan/flutter/bin
# fish_add_path /usr/local/opt/ruby/bin
fish_add_path ~/scripts
fish_add_path ~/Work/Website_Rsync/sanad_rsync
fish_add_path ~/Work/Website_Rsync/hkg_rsync
fish_add_path ~/Work/Website_Rsync/sm_rsync
fish_add_path ~/Work/Website_Rsync/sm_rsync
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin:$PATH


# <------- Starship ------->
starship init fish | source

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
