-- vim.cmd([[
-- if !exists('g:neovide')
-- 	hi Normal guibg=NONE ctermbg=NONE
-- 	hi LineNr guibg=NONE ctermbg=NONE
-- 	hi SignColumn guibg=NONE ctermbg=NONE
-- 	hi EndOfBuffer guibg=NONE ctermbg=NONE
-- end
-- ]])
-- vim.g.zenbones = { lightness = "dim", transparent_background = true }
-- vim.cmd.colorscheme 'zenbones'
-- vim.cmd([[ set background=light ]])

-- vim.g.forestbones = { transparent_background = true }
-- vim.cmd.colorscheme 'forestbones'

-- require("colorbuddy").colorscheme("gruvbuddy")

-- vim.g.starry_disable_background = true
-- vim.cmd.colorscheme "darksolar"
-- require("neosolarized").setup({
--     background_set = false,
-- })
-- vim.cmd.colorscheme("oxocarbon")

require("plugins.tokyonight")
vim.cmd.colorscheme "tokyonight"

-- vim.g.accent_colour = 'yellow'
-- vim.cmd.colorscheme 'accent'

-- vim.cmd.colorscheme('minicyan')
-- vim.cmd.colorscheme('minischeme')
-- vim.cmd.colorscheme 'neobones'
-- vim.cmd.colorscheme 'tokyobones'
-- vim.cmd.colorscheme 'duckbones'
-- vim.cmd.colorscheme("spaceduck")
-- vim.cmd.colorscheme("moonfly")

-- require("plugins.nordic_theme")
-- require("nordic").load()

-- require("colorbuddy").colorscheme('cobalt2')

-- vim.cmd[[ set background=light ]]
-- vim.g.solarized_termtrans = 1
-- vim.g.solarized_diffmode = 'low'
-- vim.cmd.colorscheme("solarized")
-- vim.cmd.colorscheme("solarized-high")
-- vim.cmd.colorscheme("solarized-flat")
-- vim.cmd.colorscheme("solarized-low")

-- require("vscode").setup({
-- 	transparent = true,
-- })
-- vim.cmd.colorscheme('vscode')

-- require("plugins.rose_pine")
-- vim.cmd.colorscheme("rose-pine")

-- require("plugins.kanagawa")
-- vim.cmd.colorscheme("kanagawa")

-- vim.cmd.colorscheme "darcubox"
-- vim.cmd.colorscheme 'caret'

-- local links = {
--   ['@lsp.type.namespace'] = '@namespace',
--   ['@lsp.type.type'] = '@type',
--   ['@lsp.type.class'] = '@type',
--   ['@lsp.type.enum'] = '@type',
--   ['@lsp.type.interface'] = '@type',
--   ['@lsp.type.struct'] = '@structure',
--   ['@lsp.type.parameter'] = '@parameter',
--   ['@lsp.type.variable'] = '@variable',
--   ['@lsp.type.property'] = '@property',
--   ['@lsp.type.enumMember'] = '@constant',
--   ['@lsp.type.function'] = '@function',
--   ['@lsp.type.method'] = '@method',
--   ['@lsp.type.macro'] = '@macro',
--   ['@lsp.type.decorator'] = '@function',
-- }
-- for newgroup, oldgroup in pairs(links) do
--   vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true  })
-- end
