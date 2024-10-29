return {
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VimEnter",
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
                dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
                dashboard.button("s", "  Open session", "<cmd>Telescope persisted<CR>"),
                dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
            }

            require("alpha").setup(dashboard.config)
        end,
    },
}
