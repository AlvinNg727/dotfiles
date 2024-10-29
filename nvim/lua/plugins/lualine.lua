return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
        opts = {
            options = {
                theme = "onedark",
                component_separators = "",
                section_separators = "",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = { "branch", "diagnostics" },
                lualine_x = { "diff", "searchcount" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = {
                "fugitive",
                "fzf",
                "lazy",
                "mason",
                "oil",
                "quickfix",
                "toggleterm",
                "trouble",
            },
        },
    },
}
