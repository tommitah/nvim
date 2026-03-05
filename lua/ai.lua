require('util')

vim.pack.add({
  { src = get_url('CopilotC-Nvim/CopilotChat.nvim') },
})

require('CopilotChat').setup({
  -- model = 'gpt-5.1',
  -- heavier more capable model
  -- model = 'claude-opus-4.5',
  -- cheaper model that's fine for most tasks
  model = 'claude-sonnet-4.6',
  temperature = 0.2,
  window = {
    layout = 'horizontal',
    -- width = 0.7,
    height = 1, -- fullscreen
  },
  auto_insert_mode = false,
})

vim.keymap.set('n', '<leader>co', ':CopilotChatToggle<cr>', Keymap_opts)
