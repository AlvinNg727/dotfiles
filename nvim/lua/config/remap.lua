vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<esc>", vim.cmd.nohlsearch, { desc = "Clear highlight" })

vim.keymap.set("n", "<leader>wh", vim.cmd("wincmd h"), { desc = "Go to the left window" })
vim.keymap.set("n", "<leader>wj", vim.cmd("wincmd j"), { desc = "Go to the down window" })
vim.keymap.set("n", "<leader>wk", vim.cmd("wincmd k"), { desc = "Go to the up window" })
vim.keymap.set("n", "<leader>wl", vim.cmd("wincmd l"), { desc = "Go to the right window" })
