require('util')

vim.pack.add({
  { src = get_url('copilotlsp-nvim/copilot-lsp') },
  { src = get_url('zbirenbaum/copilot.lua') },
  { src = get_url('CopilotC-Nvim/CopilotChat.nvim') },
})

require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = false,
    hide_during_completion = true,
    debounce = 75,
    trigger_on_accept = true,
    keymap = {
      accept = '<C-l>',
      accept_word = false,
      accept_line = false,
    },
  },
})

require('CopilotChat').setup({
  model = 'gpt-5.1',
  temperature = 0.1,
  window = {
    layout = 'horizontal',
    width = 0.7,
  },
  auto_insert_mode = false,
})
