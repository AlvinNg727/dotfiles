return {
    {
        "olimorris/persisted.nvim",
        lazy = false,
        opts = {
            use_git_branch = true,

            should_save = function()
                -- Do not save if the alpha dashboard is the current filetype
                if vim.bo.filetype == "alpha" then
                    return false
                end
                return true
            end,
        },
    },
}
