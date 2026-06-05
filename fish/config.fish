alias g="git"
alias gcr="git clone --recurse-submodules -j8"
alias gpr="git pull --recurse-submodules -j8"
alias ls="eza -x --color=always --icons=always --group-directories-first --git --git-repos"

alias gg="lazygit"

set -g direnv_fish_mode eval_on_arrow    # trigger direnv at prompt, and on every arrow-based directory change (default)

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

starship init fish | source

zoxide init fish --cmd cd | source

uv generate-shell-completion fish | source
uvx --generate-shell-completion fish | source

thefuck --alias | source

if status is-interactive
    direnv hook fish | source

    xhost +local: > /dev/null
end
