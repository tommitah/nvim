require('util')

vim.pack.add({
  { src = get_url('sindrets/diffview.nvim') },
  { src = get_url('NeogitOrg/neogit') },
})

local neogit = require('neogit')

vim.keymap.set('n', '<leader>gg', neogit.open, Keymap_opts)
