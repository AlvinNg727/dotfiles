return {
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local oil = require("oil")

            -- vim.keymap.set("n", "<leader>e", function() oil.open() end, { desc = "Oil" })
            vim.keymap.set("n", "<leader>e", function()
                oil.toggle_float()
            end, { desc = "Toggle oil (floating)" })

            oil.setup({
                default_file_explorer = true,
                view_options = {
                    show_hidden = true,
                },
            })
        end,
    },
}
