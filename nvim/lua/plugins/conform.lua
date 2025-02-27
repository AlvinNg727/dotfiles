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
                markdown = { "markdownlint" },
                python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
                ["*"] = { "codespell" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = {
                timeout_ms = 1000,
                lsp_format = "fallback",
            },
        },
        keys = {
            {
                "<leader>fa",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "Format Buffer",
            },
        },
    },
}
