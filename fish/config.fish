alias gcr="git clone --recurse-submodules -j8"
alias gpr="git pull --recurse-submodules -j8"
alias ls="eza -x --color=always --icons=always --group-directories-first --git --git-repos"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

pyenv init - | source

starship init fish | source
