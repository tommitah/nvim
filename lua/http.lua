local plugs = {
  { source = 'mistweaverco/kulala.nvim', }
}

for _, plug in ipairs(plugs) do
  MiniDeps.add(plug)
end

MiniDeps.later(function()
  local kulala = require('kulala')
  kulala.setup({})

  vim.keymap.set('n', '<leader>Rs', kulala.run, Keymap_opts)
  vim.keymap.set('n', '<leader>Ra', kulala.run_all, Keymap_opts)
  vim.keymap.set('n', '<leader>Rb', kulala.replay, Keymap_opts)
end)
