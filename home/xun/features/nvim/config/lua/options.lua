vim.g.mapleader = ' '

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.hidden = true

vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]])


vim.opt.clipboard:append {'unnamedplus'} -- use X system clipboard
