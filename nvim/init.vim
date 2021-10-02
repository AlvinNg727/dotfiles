call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

set ignorecase

syntax on
filetype plugin indent on

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set number
set relativenumber

set hidden

set nowrap

set completeopt=menuone,noselect

set wildmenu

set confirm

set cursorline

set mouse=a

set scrolloff=10

set noerrorbells

if (empty($TMUX))
    if (has("nvim"))
        let$NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

colorscheme onedark
set background=dark
highlight Normal guibg=none
set encoding=UTF-8
