require("kanagawa").setup({
	undercurl = false, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = {},
	statementStyle = {},
	typeStyle = {},
	variablebuiltinStyle = {},
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = true, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	globalStatus = true, -- adjust window separators highlight for laststatus=3
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {},
	-- overrides = {},
	-- theme = "default", -- Load "default" theme or the experimental "light" theme
	-- theme = "lotus", -- Load "default" theme or the experimental "light" theme
    background = {
        -- dark = "dragon",
        dark = "wave",
        light = "lotus"
    },
})
