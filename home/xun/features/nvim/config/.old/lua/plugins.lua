vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "Everblush/nvim", as = "everblush" })
	use("ms-jpq/chadtree")
	use("tpope/vim-surround")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	})

	use("neovim/nvim-lspconfig")

	-- cmp
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use("numToStr/FTerm.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"folke/noice.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
		},
	})
	use("nvim-tree/nvim-web-devicons")
	use({
		"folke/trouble.nvim",
		requires = { { "nvim-tree/nvim-web-devicons" } },
	})
	use("CRAG666/code_runner.nvim")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("anuvyklack/hydra.nvim")
	use("folke/neodev.nvim")

	use("jlanzarotta/bufexplorer")
	use("sindrets/winshift.nvim")
	use({ "anuvyklack/windows.nvim", requires = "anuvyklack/middleclass" })
	use("mrjones2014/smart-splits.nvim")
	-- use("m4xshen/autoclose.nvim")
	use("mhartington/formatter.nvim")
	use("sitiom/nvim-numbertoggle")
	use("ggandor/leap.nvim")

	use('vim-crystal/vim-crystal')
end)
