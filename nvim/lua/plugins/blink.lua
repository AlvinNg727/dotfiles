return {
    {
        "Saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
    },
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = { "rafamadriz/friendly-snippets", "Saghen/blink.compat" },
        opts = {
            keymap = { preset = "enter" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            completion = {
                menu = {
                    draw = {
                        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
                        treesitter = { "lsp" },
                    },
                    -- auto_show = function(ctx)
                    --     return ctx.mode ~= "cmdline"
                    -- end,
                },
                list = {
                    selection = {
                        preselect = function(ctx)
                            return ctx.mode ~= "cmdline"
                        end,
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
                ghost_text = { enabled = false },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
}
