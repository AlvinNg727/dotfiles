return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "onsails/lspkind.nvim", event = "VeryLazy" },
            { "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
            { "hrsh7th/cmp-nvim-lsp-signature-help", event = "VeryLazy" },
            { "hrsh7th/cmp-buffer", event = "VeryLazy" },
            { "hrsh7th/cmp-path", event = "VeryLazy" },
            { "hrsh7th/cmp-cmdline", event = "VeryLazy" },
            { "hrsh7th/nvim-cmp", event = "VeryLazy" },
            { "hrsh7th/cmp-nvim-lua", event = "VeryLazy" },
            { "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
        },
        event = "VeryLazy",
        opts = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            return {
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior, count = 1 }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior, count = 1 }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            }
        end,
    },
}
