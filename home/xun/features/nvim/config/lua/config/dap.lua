local dap = require'dap'
local dapui = require'dapui'
local mnd = require'mason-nvim-dap'

mnd.setup({
	ensure_installed = {},
	handlers = {},
})

dap.configurations.asm = {
	{
		type = "codelldb",
		request = "launch",
		name = "lldb asm",
		program = "${fileDirname}/${fileBasenameNoExtension}",
	},
}

dapui.setup()
