local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("FormatAutogroup", {})
autocmd("BufWritePost", {
	group = "FormatAutogroup",
	command = "FormatWrite",
})
