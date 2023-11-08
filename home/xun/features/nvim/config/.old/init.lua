require("plugins")

require("everblush").setup({
	transparent = false,
	styles = {
		comments = { italic = true },
		functions = { italic = false },
		variables = { italic = false },
		keywords = { italic = false },
	},
	override = {
		CursorLineNR = { fg = "#8ee0e4" },
	},
	highlights = {},
})

vim.cmd("colorscheme everblush")

vim.g.mapleader = "<"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.cursorline = true

vim.wo.number = true
vim.opt.relativenumber = true

require("lualine").setup({
	options = { theme = "everblush" },
})

for file, type in vim.fs.dir("~/.config/nvim/lua/config") do
	if type == "file" then
		require("config." .. file:sub(1, -5))
	end
end
