require('util')

vim.pack.add({
  { src = get_url('sindrets/diffview.nvim') },
  { src = get_url('NeogitOrg/neogit') },
  -- dep of octo...
  { src = get_url('nvim-tree/nvim-web-devicons') },
  { src = get_url('pwntester/octo.nvim') },
})

local neogit = require('neogit')

require('octo').setup({
  picker = 'fzf-lua',
})

vim.keymap.set('n', '<leader>gg', neogit.open, Keymap_opts)
