local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

-- Set guicursor for VimEnter and VimResume
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    callback = function()
        vim.opt.guicursor =
            "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
    end,
})

-- Set guicursor for VimLeave and VimSuspend
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    callback = function()
        vim.opt.guicursor = "a:hor20-blinkwait700-blinkoff500-blinkon250"
    end,
})
