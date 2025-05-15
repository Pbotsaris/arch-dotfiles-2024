local M = {}

M.setup = function()
	vim.diagnostic.config({
		virtual_text = false,

		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
			-- optionally, you can also set priority / numhl / linehl:
			-- numhl = { [vim.diagnostic.severity.ERROR] = "DiagnosticError" },
			-- linehl = {},
		},

		update_in_insert = true,
		underline = true,
		severity_sort = true,

		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "if_many",
			header = "",
			prefix = "",
		},
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.buf.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.buf.signature_help, { border = "rounded" })
end

M.get_opts = function()
	return {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		flags = { debounce_text_changes = 150 },
	}
end

return M
