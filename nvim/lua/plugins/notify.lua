return {
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            timeout = 2000,
        },
        config = function()
            vim.notify = require("notify")
        end,
    },
}
