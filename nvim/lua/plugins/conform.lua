return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                lua = { "stylua" },
                markdown = { "markdownlint" },
                python = { "ruff_organize_imports", "ruff_format", "ruff_fix" },
                ["*"] = { "codespell" },
            },
            format_on_save = {
                timeout_ms = 1000,
            },
            formatters = {
                clang_format = {
                    command = "clang-format",
                    args = { "--style=file", "--fallback-style=Google" },
                },
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
