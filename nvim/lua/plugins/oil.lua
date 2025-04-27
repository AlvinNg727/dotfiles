function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {
            default_file_explorer = true,
            win_options = {
                -- winbar = "%!v:lua.get_oil_winbar()",
            },
            watch_for_changes = true,
            view_options = {
                show_hidden = true,
            },
        },
        config = function(_, opts)
            local oil = require("oil")
            oil.setup(opts)

            vim.keymap.set("n", "<leader>e", function()
                oil.toggle_float()
            end, { desc = "Toggle Oil (floating)" })

            vim.api.nvim_create_autocmd("User", {
                pattern = "OilActionsPost",
                callback = function(event)
                    if event.data.actions.type == "move" then
                        Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                    end
                end,
            })
        end,
    },
}
