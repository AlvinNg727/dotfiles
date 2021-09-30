if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

set -U fish_greeting
set TERM "xterm-256color"

starship init fish | source
