vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('navarasu/onedark.nvim')

  use('nvim-tree/nvim-web-devicons')

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

end)
