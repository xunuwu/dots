vim.keymap.set({'n', 'i'}, '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set({'n', 'i'}, '<C-j>', vim.lsp.buf.hover)
vim.keymap.set({'n'}, '<Leader>f', require'telescope.builtin'.find_files)
