return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                event = "VeryLazy",
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            {
                "nvim-telescope/telescope-frecency.nvim",
                event = "VeryLazy",
            },
        },
        event = "VeryLazy",
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local extensions = require("telescope").extensions

            -- Find
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (cwd)" })
            vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find files (git)" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

            -- Grep
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Live grep string (cwd)" })

            -- Git
            vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Lists git commits" })
            vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Lists git branches" })

            require("telescope").setup({
                defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                    },
                    border = true,
                    mappings = {
                        i = {
                            ["<C-Up>"] = actions.preview_scrolling_up,
                            ["<C-Down>"] = actions.preview_scrolling_down,
                        },
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
                pickers = {
                    current_buzzer_fuzzy_find = { sorting_strategy = "ascending" },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("persisted")
            require("telescope").load_extension("frecency")

            vim.keymap.set("n", "<leader>fp", "<cmd>Telescope persisted<CR>", { desc = "Find projects" })

            vim.keymap.set("n", "<leader>fq", function()
                extensions.frecency.frecency({ workspace = "CWD" })
            end, { desc = "Find files frecency (cwd)" })
        end,
    },
}
