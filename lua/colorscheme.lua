-- vim.cmd.colorscheme 'zenbones'
-- vim.cmd.colorscheme 'neobones'
-- vim.cmd.colorscheme 'tokyobones'
-- vim.cmd.colorscheme 'duckbones'

-- vim.cmd.colorscheme 'spaceduck'

-- vim.cmd.colorscheme 'oxocarbon'

-- vim.cmd.colorscheme 'moonfly'

-- vim.cmd[[
-- let g:pyramid_transparent_mode = 1
-- let g:telescope_theme = 1
-- let g:variable_style = "NONE"
-- let g:function_style = "bold"
-- ]]
-- vim.cmd[[ colorscheme pyramid ]]

-- require 'plugins.rose_pine'
-- vim.cmd.colorscheme 'rose-pine'

require 'kanagawa'.setup({
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
	overrides = {},
	theme = "default" -- Load "default" theme or the experimental "light" theme
})
vim.cmd.colorscheme 'kanagawa'

-- vim.cmd.colorscheme 'catppuccin'

-- vim.cmd[[ colorscheme alduin ]]
-- vim.cmd[[ colorscheme despacio ]]
-- vim.cmd[[ let loaded_matchparen = 1 ]]

-- vim.cmd[[
-- if !exists('g:neovide')
-- 	hi Normal guibg=NONE ctermbg=NONE
-- 	hi LineNr guibg=NONE ctermbg=NONE
-- 	hi SignColumn guibg=NONE ctermbg=NONE
-- 	hi EndOfBuffer guibg=NONE ctermbg=NONE
-- end
-- ]]
