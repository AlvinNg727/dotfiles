return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                c = { lsp_format = "first" },
                cpp = { lsp_format = "first" },
                lua = { "stylua" },
                markdown = { "markdownlint", "injected" },
                python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
                tex = { "latexindent" },
                -- ["*"] = { "codespell" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
            formatters = {
                ruff_fix = {
                    append_args = {
                        "--ignore=F401",
                    },
                },
            },
        },
        keys = {
            {
                "<leader>fa",
                function()
                    require("conform").format({ async = true })
                end,
                mode = { "n", "v" },
                desc = "Format Buffer",
            },
        },
    },
}
