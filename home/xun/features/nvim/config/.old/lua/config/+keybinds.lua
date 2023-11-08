local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>t", ":CHADopen<CR>", { silent = true })

map("n", "<leader>j", "<CMD>lua require('FTerm').toggle()<CR>")
map("t", "<leader>j", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")

map("n", "<leader>xx", "<CMD>TroubleToggle<CR>")
map("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>")
map("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>")
map("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>")
map("n", "gR", "<CMD>TroubleToggle lsp_references<CR>")

map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- With this you can use > < multiple time for changing indent when you visual selected text.
map("v", "<", "<gv")
map("v", ">", ">gv")

require("config.hydra.telescope")
require("config.hydra.dap")
require("config.hydra.code_runner")
