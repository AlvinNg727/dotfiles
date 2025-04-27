return {
    {
        "aznhe21/actions-preview.nvim",
        event = "VeryLazy",
        opts = {
            highlight_command = function()
                return { require("actions-preview.highlight").delta() }
            end,
            backend = { "snacks" },
        },
        config = function(_, opts)
            opts.highlight_command = opts.highlight_command()
            require("actions-preview").setup(opts)
        end,
        keys = {
            {
                "<leader>ca",
                function()
                    require("actions-preview").code_actions()
                end,
                mode = { "n", "v" },
                desc = "Code Action",
            },
        },
    },
}
