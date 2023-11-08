local Hydra = require('hydra')
local cmd = require('hydra.keymap-util').cmd
local dap, dapui = require("dap"), require("dapui")

dapui.setup()

local hint = [[
_u_: toggle dap-ui		_e_: dap-ui eval

_c_: continue			_p_: pause
_rn_: run				_rl_: run last
_rc_: run to cursor		_re_: restart
_t_: terminate

_b_: breakpoint			_B_: force breakpoint
_C_: clear breakpoints

_so_: step over			_si_: step into
_sO_: step out			_sb_: step back


_<Esc>_ / _q_ : quit
]]


Hydra({
	name = 'DAP',
	hint = hint,
	config = {
		color = 'pink',
		invoke_on_body = true,
		hint = {
			position = 'middle',
			border = 'rounded',
		},
	},
	mode = 'n',
	body = '<Leader>d',
	heads = {
		{ 'u', dapui.toggle, {} },
		{ 'e', dapui.eval, {} },

		{ 'c', dap.continue, {} },
		{ 'p', dap.pause, {} },
		{ 'rn', dap.run, {} },
		{ 'rl', dap.run_last, {} },
		{ 'rc', dap.run_to_cursor, {} },
		{ 're', dap.restart, {} },
		{ 't', dap.terminate, {} },


		{ 'b', dap.toggle_breakpoint, {} },
		{ 'B', dap.set_breakpoint, {} },
		{ 'C', dap.clear_breakpoints, {} },

		{ 'so', dap.step_over, {} },
		{ 'si', dap.step_into, {} },
		{ 'sO', dap.step_out, {} },
		{ 'sb', dap.step_back, {} },

		{ 'q', nil, { exit = true, nowait = true } },
		{ '<Esc>', nil, { exit = true, nowait = true } },
	}
})

