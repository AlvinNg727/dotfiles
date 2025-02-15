alias gcr="git clone --recurse-submodules -j8"
alias gpr="git pull --recurse-submodules -j8"
alias ls="eza -x --color=always --icons=always --group-directories-first --git --git-repos"

alias gg="lazygit"

# Pokemon :D
# function fish_greeting
#     pokemon-colorscripts -rn charmander,charizard,gengar,greninja,rayquaza --no-title
# end

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

set fzf_preview_dir_cmd eza --all --color=always
set fzf_preview_file_cmd bat
set fzf_diff_highlighter delta --color-only --paging=never

zoxide init fish --cmd cd | source

starship init fish | source

uv generate-shell-completion fish | source
uvx --generate-shell-completion fish | source
