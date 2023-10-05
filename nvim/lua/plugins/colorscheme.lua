return {
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "darker",
                transparent = false,
                term_colors = true,
                ending_tildes = false,
                toggle_style_key = nil,
                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none"
                },
                lualine = {
                    transparent = false,
                },
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },
            })
    
            require("onedark").load()
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                color_icons = true,
                default = true,
                strict = true,
            })
        end,
    },
}
