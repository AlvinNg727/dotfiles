call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

syntax on
filetype plugin indent on

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

"set number
set relativenumber

set completeopt=menuone,noselect

set confirm

set cursorline

set mouse=a

if (empty($TMUX))
    if (has("nvim"))
        let$NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

colorscheme onedark
set encoding=UTF-8
