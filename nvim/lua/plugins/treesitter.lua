return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "comment",
                    "cpp",
                    "css",
                    "diff",
                    "fish",
                    "json",
                    "latex",
                    "lua",
                    "markdown",
                    "python",
                    "rust",
                    "toml",
                    "vimdoc",
                    "yaml",
                },

                sync_installed = false,

                auto_install = true,

                highlight = {
                    enable = true,

                    disable = {},

                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enabled = true,
                },
            })
        end,
    }
}
