return {
    {
        "saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {},
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
        opts = {
            keymap = { preset = "enter" },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                },
                menu = {
                    draw = {
                        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
                        treesitter = { "lsp" },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
                ghost_text = { enabled = true },
            },
            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "buffer", "snippets", "lazydev", "copilot" },
                providers = {
                    lsp = {
                        override = {
                            get_trigger_characters = function(self)
                                local trigger_characters = self:get_trigger_characters()
                                vim.list_extend(trigger_characters, { "\n", "\t", " " })
                                return trigger_characters
                            end,
                        },
                    },
                    path = {
                        enabled = function()
                            return vim.bo.filetype ~= "copilot-chat"
                        end,
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
}
