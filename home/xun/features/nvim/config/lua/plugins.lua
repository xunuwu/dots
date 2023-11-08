return {
	"folke/neodev.nvim",
	{ "folke/which-key.nvim", event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 200
		end,
		opts = {},
	},

	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	-- lsp
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	-- dap
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',
	'jay-babu/mason-nvim-dap.nvim',
	'nvim-tree/nvim-web-devicons',
	'nvim-tree/nvim-tree.lua',

	'nyoom-engineering/oxocarbon.nvim',

	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	-- cmp
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-cmdline',
	'rafamadriz/friendly-snippets',
	'ray-x/lsp_signature.nvim',

	'rcarriga/nvim-notify',

	{ 'nvim-telescope/telescope.nvim', dependencies =
	{ 'nvim-lua/plenary.nvim' } },

	'anuvyklack/hydra.nvim',
	'NvChad/nvim-colorizer.lua',

	'stevearc/aerial.nvim',
	{ 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
	'akinsho/toggleterm.nvim',

	{ 'kylechui/nvim-surround', version = '*', event = 'VeryLazy', opts = {} },
	{ 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },

	{ 'goolord/alpha-nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{ 'ggandor/leap.nvim', init = function()
		require'leap'.set_default_keymaps()
	end},
	'klen/nvim-config-local',
	{ 'kevinhwang91/nvim-ufo', dependencies = {'kevinhwang91/promise-async'}},
}
