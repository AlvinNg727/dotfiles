return {
    {
        "Saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
    },
    {
        "giuxtaposition/blink-cmp-copilot",
    },
    {
        "saghen/blink.cmp",
        version = "*",
        dependencies = { "rafamadriz/friendly-snippets", "Saghen/blink.compat", "giuxtaposition/blink-cmp-copilot" },
        opts = {
            keymap = { preset = "enter" },
            appearance = {
                use_nvim_cmp_as_default = false,
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
                ghost_text = { enabled = true },
                trigger = {
                    show_on_blocked_trigger_characters = {},
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                    lsp = {
                        override = {
                            get_trigger_characters = function(self)
                                local trigger_characters = self:get_trigger_characters()
                                vim.list_extend(trigger_characters, { "\n", "\t", " " })
                                return trigger_characters
                            end,
                        },
                    },
                },
            },
            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "BlinkCmpMenuOpen",
            callback = function()
                require("copilot.suggestion").dismiss()
                vim.b.copilot_suggestion_hidden = true
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "BlinkCmpMenuClose",
            callback = function()
                vim.b.copilot_suggestion_hidden = false
            end,
        })
    end,
}
