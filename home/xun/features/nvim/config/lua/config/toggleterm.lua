require'toggleterm'.setup{
	shell = 'zsh',
	open_mapping = [[<c-'>]],
	direction = 'float',
}

local _gitui = require'toggleterm.terminal'.Terminal:new({
	cmd = 'gitui',
	hidden = true,
})

local function gitui()
	_gitui:toggle()
end

vim.api.nvim_create_user_command('Gitui', gitui, {})

vim.cmd('autocmd! TermOpen term://*')
