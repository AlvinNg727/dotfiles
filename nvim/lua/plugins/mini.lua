return {
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = {
                insert = true,
                command = true,
                terminal = false,
            },
        },
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = {
            n_lines = 500,
        },
    },
    {
        "echasnovski/mini.move",
        event = "VeryLazy",
        opts = {
            mappings = {
                left = "<C-M-h>",
                right = "<C-M-l>",
                up = "<C-M-k>",
                down = "<C-M-j>",

                line_left = "<C-M-h>",
                line_right = "<C-M-l>",
                line_up = "<C-M-k>",
                line_down = "<C-M-j>",
            },
        },
    },
    {
        "echasnovski/mini.surround",
        event = "VeryLazy",
        opts = {
            mappings = {
                add = "<leader>sa",
                delete = "<leader>sd",
                find = "<leader>sf",
                find_left = "<leader>sF",
                highlight = "<leader>sh",
                replace = "<leader>sr",
                update_n_lines = "<leader>sn",
            },
            n_lines = 50,
        },
    },
    {
        "echasnovski/mini.bracketed",
        event = "VeryLazy",
        opts = {},
    },
}
