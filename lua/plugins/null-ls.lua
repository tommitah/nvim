local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.ruff,
		diagnostics.ruff,
		-- diagnostics.eslint_d,
		diagnostics.rubocop,
		-- diagnostics.standardrb,
	},
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- HACK: kind of a hack, this enables format on save, which is slow, do it manually
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	group = augroup,
			-- 	buffer = bufnr,
			-- 	callback = function()
			-- 		vim.lsp.buf.format({
			-- 			filter = function(client)
			-- 				-- only use null for formatting instead of lsp
			-- 				return client.name == "null-ls"
			-- 			end,
			-- 			bufnr = bufnr,
			-- 		})
			-- 	end,
			-- })
		end
	end,
})
