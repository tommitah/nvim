require('util')

vim.pack.add({
  { src = get_url('nvim-mini/mini.icons') },
  { src = get_url('nvim-mini/mini.statusline') },
  { src = get_url('nvim-mini/mini-git') },
  { src = get_url('nvim-mini/mini.pairs') },
  { src = get_url('nvim-mini/mini.completion') },
  { src = get_url('nvim-mini/mini.diff') },
  { src = get_url('nvim-mini/mini.pick') },
})

require('mini.git').setup()
require('mini.icons').mock_nvim_web_devicons()
require('mini.icons').tweak_lsp_kind()
require('mini.statusline').setup()
require('mini.pairs').setup()
require('mini.completion').setup()
require('mini.diff').setup()
require('mini.pick').setup()

-- set as default picker
vim.ui.select = require('mini.pick').ui_select
