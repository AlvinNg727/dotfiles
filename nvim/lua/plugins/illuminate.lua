return {
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        config = function()
            require("illuminate").configure({
                delay = 200,
                providers = {
                    "lsp",
                    "treesitter",
                },
                large_file_providers = {
                    "lsp",
                },
            })
        end,
    },
}
