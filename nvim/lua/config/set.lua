vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.completeopt = menu, menuone, noselect
vim.opt.wildmenu = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.background = dark
vim.opt.encoding = "UTF-8"
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.list = true
vim.opt.listchars = "tab:  ,multispace:·,lead:·,leadmultispace:·,trail:·"
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.o.hlsearch = true
vim.o.clipboard = "unnamedplus"
vim.o.statuscolumn = ""

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
