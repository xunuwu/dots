local Hydra = require'hydra'
local lsp = vim.lsp

local hint = [[
_re_: references   _a_: actions
_df_: definition  _dl_: declaration
_ic_: in calls    _rn_: rename
]]



Hydra({
	name = 'lsp',
	hint = hint,
	config = {
		color = 'blue',
		invoke_on_body = true,
		hint = {
			border = 'rounded',
			position = 'middle',
		},
	},
	mode = 'n',
	body = '<C-l>',
	heads = {
		{ 're', lsp.buf.references },
		{ 'a', lsp.buf.code_action },
		{ 'df', lsp.buf.definition },
		{ 'dl', lsp.buf.declaration },
		{ 'ic', lsp.buf.incoming_calls },
		{ 'rn', lsp.buf.rename },
	}
})

