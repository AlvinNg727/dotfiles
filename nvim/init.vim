call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'psliwka/vim-smoothie'
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', { 'branch': '0.5-compat', 'do': ':TSUpdate' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'shadmansaleh/lualine.nvim'

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

set scrolloff=15

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
        },
    indent = {
        enable = true
        }
}
EOF

nnoremap <silent> ;f <cmd>Telescope find_files<cr>

lua <<EOF
require'lualine'.setup {
    options = {
        theme = 'onedark',
        icons_enabled = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {
            {'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
            'encoding',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}
EOF

function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSep#ÓÇ∞'
    elseif i + 2 == tabpagenr()
      let s .= '%#TabLineSep2#ÓÇ∞'
    else
      let s .= 'ÓÇ±'
    endif
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
  endif
  return s
endfunction
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  let label = fnamemodify(name, ':t')
  return len(label) == 0 ? '[No Name]' : label
endfunction
set tabline=%!MyTabLine()
