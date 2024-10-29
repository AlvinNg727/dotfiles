return {
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        config = function()
            require("mini.comment").setup()
        end,
    },
}
