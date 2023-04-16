-- vim.cmd.colorscheme 'zenbones'
-- vim.cmd([[ set background=light ]])

-- vim.cmd.colorscheme 'neobones'
-- vim.cmd.colorscheme 'tokyobones'
-- vim.cmd.colorscheme 'duckbones'

-- vim.cmd.colorscheme("spaceduck")

-- vim.cmd.colorscheme("oxocarbon")

-- vim.cmd.colorscheme("moonfly")

-- vim.cmd([[
-- let g:pyramid_transparent_mode = 0
-- let g:telescope_theme = 1
-- let g:variable_style = "NONE"
-- let g:function_style = "bold"
-- ]])
-- vim.cmd([[ colorscheme pyramid ]])

-- require("plugins.nordic_theme")
-- require("nordic").load()

-- "luisiacc/gruvbox-baby",
-- vim.cmd.colorscheme('gruvbox-baby')
-- "ramojus/mellifluous.nvim",
-- require("mellifluous").setup({
-- 	color_set = "alduin",
-- 	-- color_set = "mellifluous",
-- 	-- color_set = "mountain",
-- 	-- color_set = "tender",
-- })
-- vim.cmd.colorscheme("mellifluous")
-- "lewpoly/sherbet.nvim",
-- vim.cmd.colorscheme("sherbet")

-- require("neosolarized").setup({
-- 	background_set = false,
-- })

-- require("colorbuddy").colorscheme('cobalt2')

-- vim.cmd[[ set background=light ]]
vim.g.solarized_termtrans = 1
vim.g.solarized_diffmode = 'low'
vim.cmd.colorscheme("solarized")
-- vim.cmd.colorscheme("solarized-high")
-- vim.cmd.colorscheme("solarized-flat")
-- vim.cmd.colorscheme("solarized-low")

-- require("vscode").setup({
-- 	transparent = true,
-- })

-- require("plugins.rose_pine")
-- vim.cmd.colorscheme("rose-pine")

-- vim.cmd.colorscheme("tokyonight-night")
-- vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-day")
-- vim.cmd.colorscheme("tokyonight-moon")

-- require("plugins.gruvbox")
-- vim.cmd.colorscheme("gruvbox")

-- require("kanagawa").setup({
-- 	undercurl = false, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = {},
-- 	keywordStyle = {},
-- 	statementStyle = {},
-- 	typeStyle = {},
-- 	variablebuiltinStyle = {},
-- 	specialReturn = true, -- special highlight for the return keyword
-- 	specialException = true, -- special highlight for exception handling keywords
-- 	transparent = false, -- do not set background color
-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
-- 	globalStatus = true, -- adjust window separators highlight for laststatus=3
-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
-- 	colors = {},
-- 	-- overrides = {},
-- 	-- theme = "default", -- Load "default" theme or the experimental "light" theme
-- 	theme = "lotus", -- Load "default" theme or the experimental "light" theme
--     background = {
--         -- dark = "dragon",
--         dark = "wave",
--         light = "lotus"
--     },
-- })
-- vim.cmd.colorscheme("kanagawa-lotus")
--
-- vim.cmd.colorscheme("danger_dark")

-- vim.cmd.colorscheme("catppuccin")

-- vim.cmd([[ colorscheme alduin ]])
-- vim.cmd([[ colorscheme despacio ]])
-- vim.cmd[[ let loaded_matchparen = 1 ]]

-- vim.cmd([[
-- if !exists('g:neovide')
-- 	hi Normal guibg=NONE ctermbg=NONE
-- 	hi LineNr guibg=NONE ctermbg=NONE
-- 	hi SignColumn guibg=NONE ctermbg=NONE
-- 	hi EndOfBuffer guibg=NONE ctermbg=NONE
-- end
-- ]])


local links = {
  ['@lsp.type.namespace'] = '@namespace',
  ['@lsp.type.type'] = '@type',
  ['@lsp.type.class'] = '@type',
  ['@lsp.type.enum'] = '@type',
  ['@lsp.type.interface'] = '@type',
  ['@lsp.type.struct'] = '@structure',
  ['@lsp.type.parameter'] = '@parameter',
  ['@lsp.type.variable'] = '@variable',
  ['@lsp.type.property'] = '@property',
  ['@lsp.type.enumMember'] = '@constant',
  ['@lsp.type.function'] = '@function',
  ['@lsp.type.method'] = '@method',
  ['@lsp.type.macro'] = '@macro',
  ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true  })
end
