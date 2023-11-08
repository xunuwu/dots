local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()


local function on_attach(client, bufnr)

end



lspconfig.lua_ls.setup{
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.rust_analyzer.setup{ capabilities = capabilities, on_attach = on_attach }
lspconfig.clangd.setup{ capabilities = capabilities, on_attach = on_attach }


lspconfig.crystalline.setup{ capabilities = capabilities, on_attach = on_attach }
