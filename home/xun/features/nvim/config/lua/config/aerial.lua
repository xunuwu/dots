require'aerial'.setup({
	backends = { 'treesitter', 'lsp', 'markdown', 'man' },

	layout = {
		-- the lesser of 40 colomns or 20% of total
		max_width = { 40, 0.2},
		width = nil,
		min_width = 10,

		win_opts = {},

		default_direction = "prefer_right",

		placement = "edge", -- "edge": edge of editor | "window": left/right of current window

		resize_to_content = true,

		-- preserve window size equality
		preserve_equality = false,
	},


	attach_mode = 'global', -- "global": current window | "window": window from where it was opened

	close_automatic_events = {}, -- "unfocus" | "switch_buffer" | "unsupported" -- does support multiple

	lazy_load = true,

	disable_max_lines = 100000, -- disable on more than 10k lines
	disable_max_size = 2000000, -- disable on more than 2MB

	filter_kind = {
		"Class",
	--"Constructor",
	--"Enum",
		"Function",
		"Interface",
		"Module",
	--"Method",
	--"Struct",
	},

	open_automatic = false,

})


