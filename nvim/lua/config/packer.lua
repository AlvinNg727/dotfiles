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

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use('lukas-reineke/indent-blankline.nvim')

    use('tpope/vim-fugitive')

    use('lewis6991/impatient.nvim')

    use('norcalli/nvim-colorizer.lua')

    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
end)
