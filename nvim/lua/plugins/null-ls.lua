return {
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        event = "VeryLazy",
        opts = {
            ensure_installed = nil,
            automatic_installation = true,
        },
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")

            local sources = {
                null_ls.builtins.formatting.black, -- python
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style=file", "--fallback-style=Google" },
                }), -- C/C++
                null_ls.builtins.formatting.fish_indent, -- fish
                null_ls.builtins.formatting.isort, -- python
                null_ls.builtins.formatting.markdownlint, -- markdown
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua, -- lua

                null_ls.builtins.diagnostics.cppcheck, -- C/C++
                null_ls.builtins.diagnostics.fish, -- fish
                null_ls.builtins.diagnostics.hadolint, -- dockerfile
                null_ls.builtins.diagnostics.markdownlint, -- markdown
            }

            local lsp_formatting = function(bufnr)
                vim.lsp.buf.format({
                    filter = function(client)
                        -- apply whatever logic you want (in this example, we'll only use null-ls)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end

            -- if you want to set up formatting on save, you can use this as a callback
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            -- add to your shared on_attach callback
            local on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            lsp_formatting(bufnr)
                        end,
                    })
                end
            end

            null_ls.setup({
                sources = sources,
                on_attach = on_attach,
            })

            vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format, { desc = "Format file" })
        end,
    },
}
