return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            attach_to_untracked = true,
            current_line_blame = true,
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- navigation
                map("n", "]h", function()
                    gitsigns.nav_hunk("next")
                end, { desc = "Next hunk" })
                map("n", "[h", function()
                    gitsigns.nav_hunk("prev")
                end, { desc = "Previous hunk" })

                map("n", "<leader>bl", function()
                    gitsigns.blame_line({ full = true })
                end, { desc = "Blame line" })

                map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
                map("v", "<leader>gs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Stage hunk" })
                map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })

                map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
                map("v", "<leader>gr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Reset hunk" })
                map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

                map("n", "<leader>gph", gitsigns.preview_hunk, { desc = "Preview hunk" })

                map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git diff this" })
                map("n", "<leader>gD", function()
                    gitsigns.diffthis("~")
                end, { desc = "Git diff this" })
                map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Git toggle deleted" })
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
            end,
        },
    },
}
