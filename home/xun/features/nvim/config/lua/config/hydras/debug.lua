local Hydra = require'hydra'
local dap, dapui = require'dap', require'dapui'
-- local cmd = require'hydra.keymap-util'.cmd


local hint = [[
_c_: continue			_t_: toggle breakpoint
_x_: terminate		_T_: clear breakpoints
_r_: open repl

	_<Enter>_: dap-ui 	_<Esc>_: exit
]]

Hydra({
	name = 'debug',
	hint = hint,
	config = {
		color = 'pink',
		invoke_on_body = true,
		hint = {
			border = 'rounded',
			position = 'top',
		},
	},
	mode = 'n',
	body = '<Leader>d',
	heads = {
		{ 't', dap.toggle_breakpoint, { desc = 'toggle breakpoint' } },
		{ 'T', dap.clear_breakpoints, { desc = 'clear breakpoints' } },
		{ 'c', dap.continue, { desc = 'continue' } },
		{ 'x', dap.terminate, { desc = 'terminate' } },
		{ 'r', dap.repl.open, { exit = true, desc = 'open repl' } },

		{ '<Enter>', dapui.toggle, { desc = 'toggle dap-ui' } },
		{ '<Esc>', nil, { exit = true, nowait = true } },
	},
})
