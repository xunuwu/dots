require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'c', 'lua', 'rust'
	},
	sync_install = false,

	auto_install = false,

	ignore_install = {},

	hightlight = {
		enable = true,

		disable = function(lang, buf)
			local max_filesize = 1000 * 1024 -- 1 MB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats > max_filesize then
				return true
			end
		end,

		additional_vim_regex_hightlighting = false,
	},


}
