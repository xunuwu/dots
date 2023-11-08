local Hydra = require('hydra')
local cmd = require('hydra.keymap-util').cmd

local hint = [[
_c_: code		_f_: file
_p_: project	_q_: close

		  _<Esc>_		         
]]

Hydra({
   name = 'runner',
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
   body = '<Leader>r',
   heads = {
      { 'c', cmd 'RunCode' },
	  { 'f', cmd 'RunFile' },
	  { 'p', cmd 'RunProject' },
	  { 'q', cmd 'RunClose' },
      { '<Esc>', nil, { exit = true, nowait = true } },
   }
})
