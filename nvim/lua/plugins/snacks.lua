return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { section = "header" },
                    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
                    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { section = "startup" },
                },
            },
            image = {
                enabled = true,
                math = {
                    enabled = false,
                },
            },
            indent = {
                enabled = true,
                char = "▏",
                animate = { enabled = false },
                scope = {
                    char = "▏",
                    underline = true,
                },
            },
            input = { enabled = true },
            lazygit = { enabled = true },
            notifier = { enabled = true },
            picker = {
                enabled = true,
                matcher = {
                    frecency = true,
                },
                ui_select = true,
                previewers = {
                    diff = {
                        builtin = true,
                        cmd = { "delta --color-only" },
                    },
                },
            },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            styles = {
                terminal = {
                    wo = {
                        winbar = "",
                    },
                },
            },
            terminal = {
                enabled = true,
                shell = "/usr/bin/fish -l",
            },
            words = { enabled = true },
        },
        keys = {
            {
                "<leader>gg",
                function()
                    Snacks.lazygit.open()
                end,
                desc = "Open Lazygit",
            },

            {
                "<leader>ff",
                function()
                    Snacks.picker.files({ hidden = true, ignored = true })
                end,
                desc = "Find Files (cwd)",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.git_files({ submodules = true })
                end,
                desc = "Find Files (git)",
            },
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers({ hidden = true })
                end,
                desc = "Find Buffers",
            },
            {
                "<leader>fp",
                function()
                    Snacks.picker.projects()
                end,
                desc = "Find Projects",
            },
            {
                "<leader>fu",
                function()
                    Snacks.picker.undo()
                end,
                desc = "Find Undo",
            },

            {
                "<leader>gb",
                function()
                    Snacks.picker.git_branches()
                end,
                desc = "Find Git Branches",
            },
            {
                "<leader>gs",
                function()
                    Snacks.picker.git_status()
                end,
                desc = "Git Status",
            },
            {
                "<leader>gS",
                function()
                    Snacks.picker.git_stash()
                end,
                desc = "Git Stash",
            },

            {
                "<leader>ps",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep String",
            },

            {
                "<C-`>",
                function()
                    Snacks.terminal()
                end,
                desc = "Open Terminal",
            },
            { "<C-`>", "<cmd>close<cr>", desc = "Hide Terminal", mode = "t" },

            {
                "<leader>un",
                function()
                    Snacks.notifier.hide()
                end,
                desc = "Dismiss All Notifications",
            },
            {
                "<leader>n",
                function()
                    Snacks.picker.notifications()
                end,
                desc = "Notification History",
            },

            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Delete Buffer",
            },

            {
                "<leader>gB",
                function()
                    Snacks.gitbrowse()
                end,
                desc = "Git Browse",
            },

            {
                "<leader>cR",
                function()
                    Snacks.rename.rename_file()
                end,
                desc = "Rename File",
            },

            {
                "]]",
                function()
                    Snacks.words.jump(vim.v.count1)
                end,
                desc = "Next Reference",
                mode = { "n", "t" },
            },
            {
                "[[",
                function()
                    Snacks.words.jump(-vim.v.count1)
                end,
                desc = "Prev Reference",
                mode = { "n", "t" },
            },
        },
    },
}
