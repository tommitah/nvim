require('util')
vim.pack.add({
  { src = get_url('rktjmp/lush.nvim') },
  { src = get_url('rebelot/kanagawa.nvim') },
  { src = get_url('Alligator/accent.vim') },
  { src = get_url('zenbones-theme/zenbones.nvim') },
  { src = get_url('maxmx03/solarized.nvim') },
  { src = get_url('rose-pine/neovim') },
  { src = get_url('vague2k/vague.nvim') },
  { src = get_url('brenoprata10/nvim-highlight-colors') },
  { src = get_url('AlexvZyl/nordic.nvim') },
  { src = get_url('savq/melange-nvim') },
  { src = get_url('neanias/everforest-nvim') },
  { src = get_url('kungfusheep/mfd.nvim') },
  { src = get_url('webhooked/kanso.nvim') },
  { src = get_url('aymenhafeez/doric-themes.nvim') },
  { src = get_url('folke/tokyonight.nvim') },
})

require('nvim-highlight-colors').setup({})

-- require('rose-pine').setup({
--   variant = 'main',
--   styles = {
--     italic = false,
--     transparency = true,
--   },
-- })
-- vim.cmd.colorscheme('rose-pine')

-- require('kanso').setup({
--   transparent = true,
--   compile = true,
--   background = {
--     dark = 'mist',
--     light = 'pearl',
--   },
-- })
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('kanso')

-- require('solarized').setup({
--   transparent = {
--     enabled = true,
--   },
--   palette = 'selenized',
--   variant = 'summer',
-- })
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('solarized')

-- vim.cmd.colorscheme 'accent'

-- require('tokyonight').setup({
--   style = 'moon',
--   transparent = true,
-- })
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('tokyonight')

require('kanagawa').setup({
  transparent = true,
  background = {
    -- dark = 'dragon',
    dark = 'wave',
  },
})
vim.cmd('set background=dark')
vim.cmd.colorscheme('kanagawa')

-- require('vague').setup({
--   transparent = true,
-- })
-- vim.cmd('colorscheme vague')

-- require('doric').setup({
--   light = 'doric-oak',
-- })
-- vim.cmd('set background=light')
-- vim.cmd.colorscheme('doric')

-- require('nordic').setup({
--   transparent = {
--     bg = true,
--   },
-- })
-- require('nordic').load()

-- vim.g.zenbones = {
--   -- lightness = 'dim',
--   transparent_background = true,
-- }
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('zenbones')
-- vim.g.zenbones = {
--   lightness = 'dim',
--   transparent_background = false,
-- }
-- vim.cmd('set background=light')
-- vim.cmd.colorscheme('zenbones')

-- vim.g.forestbones = {
--   transparent_background = true,
-- }
-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('forestbones')

-- require('everforest').setup({
--   background = 'medium',
--   transparent_background_level = 2,
-- })
-- require('everforest').load()

-- vim.cmd('set background=dark')
-- vim.cmd.colorscheme('melange')
-- -- melange transparency
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

-- vim.cmd('colorscheme mfd')
