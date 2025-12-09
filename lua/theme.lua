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
})

require('nvim-highlight-colors').setup({})

-- require('rose-pine').setup({
--   variant = 'main',
--   styles = {
--     italic = false,
--     transparency = true
--   }
-- })
-- vim.cmd.colorscheme 'rose-pine'
-- require('solarized').setup({
--   transparent = {
--     enabled = true
--   },
--   palette = 'selenized',
--   variant = 'summer'
-- })
-- vim.cmd.colorscheme 'solarized'
-- vim.cmd.colorscheme 'accent'
-- require('kanagawa').setup({
--   transparent = true,
--   background = {
--     dark = 'dragon',
--     -- dark = 'wave'
--   },
-- })
-- vim.cmd.colorscheme('kanagawa')
require('vague').setup({
  transparent = true,
})
vim.cmd('colorscheme vague')
-- vim.g.zenbones = {
--   -- lightness = 'dim',
--   transparent_background = true
-- }
-- vim.cmd('set background=light')
-- vim.cmd.colorscheme 'zenbones'
