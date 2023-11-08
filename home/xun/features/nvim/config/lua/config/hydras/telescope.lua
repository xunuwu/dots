local Hydra = require'hydra'
local cmd = require'hydra.keymap-util'.cmd

local hint = [[
	_f_: files			_g_: live grep
	_p_: projects		_/_: search in file		

	_r_: resume			_c_: execute command			
	_k_: keymaps		_?_: search history
	_o_: options		_;_: commands history
	_h_: vim help

 _<Enter>_: telescope	_<Esc>_: exit
]]

Hydra({
	name = 'telescope',
	hint = hint,
	config = {
		color = 'teal',
		invoke_on_body = true,
		hint = {
			position = 'middle',
			border = 'rounded',
		},
	},
	mode = 'n',
	body = '<Leader>t',
	heads = {
		{ 'f', cmd 'Telescope find_files' },
		{ 'g', cmd 'Telescope live_grep' },
		{ 'p', cmd 'Telescope projects' },
		{ '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },

		{ 'r', cmd 'Telescope resume' },
		{ 'c', cmd 'Telescope commands', { desc = 'execute command' } },
		{ 'k', cmd 'Telescope keymaps' },
		{ '?', cmd 'Telescope search_history', { desc = 'search history' } },
		{ 'o', cmd 'Telescope vim_options' },
		{ ';', cmd 'Telescope command_history', { desc = 'command-line history' } },
		{ 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },

		{ '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
		{ '<Esc>', nil, { exit = true, nowait = true } },
	}
})
