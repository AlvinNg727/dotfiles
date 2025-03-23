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
                lsp_format = "first",
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "first",
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
