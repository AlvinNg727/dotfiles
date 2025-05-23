return {
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        opts = {
            linters_by_ft = {
                dockerfile = { "hadolint" },
                fish = { "fish" },
                markdown = { "markdownlint" },
            },
        },
        config = function(_, opts)
            local lint = require("lint")

            lint.linters_by_ft = opts.linters_by_ft

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                    lint.try_lint("codespell")
                end,
            })
        end,
    },
}
