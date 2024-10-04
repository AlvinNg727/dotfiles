alias gcr="git clone --recurse-submodules -j8"
alias gpr="git pull --recurse-submodules -j8"
alias ls="eza -x --color=always --icons=always --group-directories-first --git --git-repos"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

pyenv init - | source

# fzf --fish | source

starship init fish | source
