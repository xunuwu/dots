local presentAerial, aerial = pcall(require, "aerial")
local presentLspSignature, lspSignature = pcall(require, "lsp_signature")


local function on_attach(client, bufnr)
	if presentLspSignature then
		lspSignature.on_attach({ floating_window = false, timer_interval = 500 })
	end

	if presentAerial then aerial.on_attach(client, bufnr) end
end

-- for nvim-ufo
local capabilites = vim.lsp.protocol.make_client_capabilities()
capabilites.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}



local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


require("mason-lspconfig").setup{
	handlers = {
		function (server_name)
			require('lspconfig')[server_name].setup {
				on_attach = on_attach,
				capabilities = capabilities,
			}
		end,
	}
}