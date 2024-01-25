alias gcr="git clone --recurse-submodules -j8"
alias gpr="git pull --recurse-submodules -j8"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
