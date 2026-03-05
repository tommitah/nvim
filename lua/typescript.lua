require('util')

vim.pack.add({
  { src = get_url('dmmulroy/tsc.nvim') },
})

require('tsc').setup()

vim.keymap.set('n', '<leader>to', ':TSCOpen<cr>')
vim.keymap.set('n', '<leader>tsc', ':TSC<cr>')
