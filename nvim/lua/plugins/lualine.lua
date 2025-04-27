return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                theme = "onedark",
                component_separators = "",
                section_separators = "",
                globalstatus = true,
                disabled_filetypes = {
                    statusline = {
                        "snacks_dashboard",
                    },
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
                    { "filename", padding = { left = 0, right = 1 } },
                },
                lualine_c = { "branch", "diagnostics" },
                lualine_x = { "overseer", "diff", "searchcount" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = {
                "lazy",
                "oil",
            },
        },
    },
}
