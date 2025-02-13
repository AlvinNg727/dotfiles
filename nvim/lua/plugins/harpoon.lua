return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            local harpoon = require("harpoon")

            harpoon.setup({})

            local telescope_conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require("telescope.pickers")
                    .new({}, {
                        prompt_title = "Harpoon",
                        finder = require("telescope.finders").new_table({
                            results = file_paths,
                        }),
                        previewer = telescope_conf.file_previewer({}),
                        sorter = telescope_conf.generic_sorter({}),
                    })
                    :find()
            end

            vim.keymap.set("n", "<leader>ha", function()
                harpoon:list():add()
            end, { desc = "Mark file" })
            vim.keymap.set("n", "<leader>hd", function()
                harpoon:list():remove()
            end, { desc = "Unmark file" })

            vim.keymap.set("n", "<leader>he", function()
                toggle_telescope(harpoon:list())
            end, { desc = "Open harpoon window" })

            vim.keymap.set("n", "<C-S-P>", function()
                harpoon:list():prev()
            end, { desc = "Prev mark" })
            vim.keymap.set("n", "<C-S-N>", function()
                harpoon:list():next()
            end, { desc = "Next mark" })
        end,
    },
}
