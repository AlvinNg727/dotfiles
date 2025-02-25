return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
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
                "jsonc",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        config = function() end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        opts = {},
    },
}
