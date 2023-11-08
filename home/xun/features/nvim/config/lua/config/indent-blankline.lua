vim.cmd [[highlight IndentBlanklineIndent1 guifg=#333333 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineContextChar guifg=#ff7eb6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#9f3fa4 gui=nocombine]]

-- require("indent_blankline").setup {
--   space_char_blankline = " ",
--   use_treesitter = true,
--   show_trailing_blankline_indent = false,
--   char_highlight_list = {
--     "IndentBlanklineIndent1",
--   },
-- }

require("ibl").setup {
}
