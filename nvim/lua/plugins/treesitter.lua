return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
        },
        event = "VeryLazy",
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
                    "dockerfile",
                    "fish",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "regex",
                    "rust",
                    "toml",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
                sync_install = true,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = false,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        opts = {
            max_lines = 3,
        },
    },
}
