if status is-interactive
and not set -q TMUX
    # tmux attach || exec tmux new-session && exit
    tmux -a || tmux 
  #exec tmux
end

# Obsidian CLI for WSL — locate the Windows redirector dynamically
if type -q obsidian.exe
    set -l _obsidian_dir (dirname (which obsidian.exe))
    if test -f "$_obsidian_dir/Obsidian.com"
        function obsidian -V _obsidian_dir
            $_obsidian_dir/Obsidian.com $argv
        end
    end
end

# <------- Fish Greeting ------->
function fish_greeting
  fastfetch
end

# <------- Vi Mode Prompt ------->
function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'N'
    case insert
      set_color --bold green
      echo 'I'
    case replace_one
      set_color --bold green
      echo 'R'
    case visual
      set_color --bold brmagenta
      echo 'V'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end

# <------- Fish Interactive ------->
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# <------- eza ------->
set -gx EXA_ICON_SPACING 2

# <------- Basics ------->
fish_vi_key_bindings

alias vim="nvim"
alias cat="batcat"
alias glgga="git log --oneline --graph --decorate --all"

function ls
    set -l has_l false
    for arg in $argv
        if string match -q -r '^-.*l' -- $arg
            set has_l true
            break
        end
    end

    if test "$has_l" = true
        command eza --color=always --icons=always --group-directories-first --git $argv
    else
        command eza --color=always --icons=always --group-directories-first --git --long --no-filesize --no-time --no-user --no-permissions $argv
    end
end

# <------- Theme / Colors ------->
# Migrated from 3.7.0 universal variables
set --global fish_color_autosuggestion brblack
set --global fish_color_cancel -r
set --global fish_color_command blue
set --global fish_color_comment red
set --global fish_color_cwd green
set --global fish_color_cwd_root red
set --global fish_color_end green
set --global fish_color_error brred
set --global fish_color_escape brcyan
set --global fish_color_history_current --bold
set --global fish_color_host normal
set --global fish_color_host_remote yellow
set --global fish_color_normal normal
set --global fish_color_operator brcyan
set --global fish_color_param cyan
set --global fish_color_quote yellow
set --global fish_color_redirection cyan --bold
set --global fish_color_search_match bryellow --background=brblack
set --global fish_color_selection white --bold --background=brblack
set --global fish_color_status red
set --global fish_color_user brgreen
set --global fish_color_valid_path --underline
set --global fish_pager_color_completion normal
set --global fish_pager_color_description yellow -i
set --global fish_pager_color_prefix normal --bold --underline
set --global fish_pager_color_progress brwhite --background=cyan
set --global fish_pager_color_selected_background -r

# <------- Environment Variables ------->
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# <------- Paths ------->
fish_add_path ~/.local/bin
fish_add_path /usr/local/go/bin
fish_add_path /usr/local/flyway-12.1.1
fish_add_path ~/.cargo/bin
# Created by `pipx` on 2024-07-01 12:06:56
fish_add_path /Users/maesonchan/.local/bin
fish_add_path ~/go/bin

# <------- WSL: Windows interop paths ------->
if test -d /mnt/c/Windows/System32
    fish_add_path /mnt/c/Windows/System32
    fish_add_path /mnt/c/Windows
    fish_add_path /mnt/c/Windows/System32/Wbem
    fish_add_path /mnt/c/Windows/System32/WindowsPowerShell/v1.0
end


# <------- Prompts & Integrations ------->
starship init fish | source

zoxide init --cmd cd fish | source
