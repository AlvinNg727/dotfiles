return {
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        opts = {
            providers = {
                "lsp",
                "treesitter",
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
}
