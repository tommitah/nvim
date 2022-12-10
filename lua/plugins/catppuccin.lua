require('catppuccin').setup({
	flavour = 'mocha',
	term_colors = true,
	no_italic = false,
	no_bold = false,
	color_overrides = {
		latte = {
			base = "#E1EEF5",
		},
		mocha = {
			base = "#000000",
		},
	},
	transparent_background = true,
	styles = {
		comments = { 'italic' },
		conditionals = { 'italic' },
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		native_lsp = {
			enabled = true,
		},
		-- navic = {
		-- 	enabled = true,
		-- 	custom_bg = 'NONE'
		-- },
		lsp_saga = {
			enabled = true,
		},
	}
})
