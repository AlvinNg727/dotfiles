return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "warmer",
            transparent = false,
            term_colors = true,
            ending_tildes = false,
            cmp_itemkind_reverse = false,
            toggle_style_key = nil,
            toggle_style_list = { "warmer" },
            code_style = {
                comments = "italic",
                keywords = "none",
                functions = "none",
                strings = "none",
                variables = "none",
            },
            lualine = {
                transparent = true,
            },
            colors = {},
            highlights = {},
            diagnostics = {
                darker = true,
                undercurl = true,
                background = true,
            },
        },
        config = function(_, opts)
            require("onedark").setup(opts)
            -- require("onedark").load()
        end,
    },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            highlights = {
                DiagnosticUnderlineError = { sp = "${red}", style = "undercurl" },
                DiagnosticUnderlineWarn = { sp = "${yellow}", style = "undercurl" },
                DiagnosticUnderlineInfo = { sp = "${blue}", style = "undercurl" },
                DiagnosticUnderlineHint = { sp = "${cyan}", style = "undercurl" },
                ["@odp.import_module.python"] = { link = "@module" },
            },
            styles = {
                comments = "italic",
            },
            options = {
                cursorline = true,
                lualine_transparency = true,
                highlight_inactive_windows = false,
            },
        },
        config = function(_, opts)
            require("onedarkpro").setup(opts)

            vim.cmd("colorscheme onedark")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            color_icons = true,
            default = true,
            strict = true,
        },
    },
}
