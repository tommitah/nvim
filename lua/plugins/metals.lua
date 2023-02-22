local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

map("n", "gD", function()
	vim.lsp.buf.definition()
end)

map("n", "K", function()
	vim.lsp.buf.hover()
end)

map("n", "gi", function()
	vim.lsp.buf.implementation()
end)

-- map("n", "gr", function()
-- 	vim.lsp.buf.references()
-- end)

-- map("n", "gds", function()
-- 	vim.lsp.buf.document_symbol()
-- end)

map("n", "gws", function()
	vim.lsp.buf.workspace_symbol()
end)

map("n", "<leader>cl", function()
	vim.lsp.codelens.run()
end)

map("n", "<leader>sh", function()
	vim.lsp.buf.signature_help()
end)

map("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end)

map("n", "<leader>f", function()
	vim.lsp.buf.formatting()
end)

map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end)

map("n", "<leader>ws", function()
	require("metals").hover_worksheet()
end)

-- all workspace diagnostics
map("n", "<leader>aa", function()
	vim.diagnostic.setqflist()
end)

-- all workspace errors
map("n", "<leader>ae", function()
	vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
	vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", function()
	vim.diagnostic.setloclist()
end)

map("n", "[c", function()
	vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
	vim.diagnostic.goto_next({ wrap = false })
end)

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "Luasnip" },
	},
	snippet = {
		expand = function(args)
			-- Comes from vsnip
			vim.fn["Luasnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- None of this made sense to me when first looking into this since there
		-- is no vim docs, but you can't have select = true here _unless_ you are
		-- also using the snippet stuff. So keep in mind that if you remove
		-- snippets you need to remove this select
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- I use tabs... some say you should stick to ins-completion but this is just here as an example
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
	}),
})

local metals = require("metals").bare_config()

metals.settings = {
	showImplicitArguments = true,
	excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
metals.init_options.statusBarProvider = "on"

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
metals.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		require("metals").initialize_or_attach(metals)
	end,
	group = nvim_metals_group,
})
