return {
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        opts = {
            ignored_filetypes = {
                "copilot-chat",
            },
            resize_mode = {
                silent = true,
                hooks = {
                    on_enter = function()
                        vim.notify("Entering resize mode")
                    end,
                    on_leave = function()
                        vim.notify("Exiting resize mode")
                    end,
                },
            },
        },
        config = function(_, opts)
            require("smart-splits").setup(opts)

            vim.keymap.set("n", "<C-S-h>", require("smart-splits").move_cursor_left)
            vim.keymap.set("n", "<C-S-j>", require("smart-splits").move_cursor_down)
            vim.keymap.set("n", "<C-S-k>", require("smart-splits").move_cursor_up)
            vim.keymap.set("n", "<C-S-l>", require("smart-splits").move_cursor_right)
        end,
    },
}
