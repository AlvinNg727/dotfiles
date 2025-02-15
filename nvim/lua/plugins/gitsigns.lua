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
                end, { desc = "Next Hunk" })
                map("n", "[h", function()
                    gitsigns.nav_hunk("prev")
                end, { desc = "Previous Hunk" })

                map("n", "<leader>bl", function()
                    gitsigns.blame_line({ full = true })
                end, { desc = "Blame Line" })

                map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
                map("v", "<leader>ghs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Stage Hunk" })
                map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage Buffer" })

                map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
                map("v", "<leader>ghr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end, { desc = "Reset Hunk" })
                map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset Buffer" })

                map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview Hunk" })

                map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Git Diff This" })
                map("n", "<leader>ghD", function()
                    gitsigns.diffthis("~")
                end, { desc = "Git Diff This ~" })
                map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Git Toggle Deleted" })
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git Select Hunk" })
            end,
        },
    },
}
