return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
            {
                "rafamadriz/friendly-snippets",
                event = "VeryLazy",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
        },
        version = "v2.*",
        build = "make install_jsregexp",
        event = "VeryLazy",
        opts = {},
    },
}
