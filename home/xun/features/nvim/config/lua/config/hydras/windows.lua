local Hydra = require'hydra'
local cmd = require'hydra.keymap-util'.cmd

local hint = [[
	    Move			  	 Size				                 Split
	-------------    ----------            -----------------
	  _k_       _K_        _<C-k>_					_s_: hor, _v_: vert
	_h_   _l_   _H_   _L_   _<C-h>_ _<C-l>_	_q_, _c_: close
	  _j_       _J_        _<C-j>_					_z_: maximize
  focus   window	_=_: equalize			      _o_: remain only
	 _t_: new tab                             _b_: buffers
]]

Hydra({
	name = 'windows',
	hint = hint,
	config = {
		color = 'red',
		invoke_on_body = false,
		hint = {
			position = 'bottom',
			border = 'rounded',
		},
	},
	mode = 'n',
	body = '<Leader>w',
	heads = {
		{ 'h', cmd 'wincmd h' },
		{ 'j', cmd 'wincmd j' },
		{ 'k', cmd 'wincmd k' },
		{ 'l', cmd 'wincmd l' },

		{ 'H', cmd 'wincmd H' },
		{ 'J', cmd 'wincmd J' },
		{ 'K', cmd 'wincmd K' },
		{ 'L', cmd 'wincmd L' },

		{ '<C-h>', cmd 'wincmd >' },
		{ '<C-j>', cmd 'wincmd -' },
		{ '<C-k>', cmd 'wincmd +' },
		{ '<C-l>', cmd 'wincmd <' },

		{ 's', cmd 'wincmd s' },
		{ 'v', cmd 'wincmd v' },
		{ 'q', cmd 'wincmd q' },
		{ 'c', cmd 'wincmd c' },
		{ 'z', cmd 'WindowsMaximize' },
		{ 'o', cmd 'wincmd o' },
		{ 'b', cmd 'wincmd b' },
		{ '=', cmd 'WindowsEqualize' },
		{ 't', cmd 'wincmd T' },
	},
})
