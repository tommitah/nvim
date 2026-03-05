require('util')

vim.pack.add({
  { src = get_url('quolpr/quicktest.nvim') },
})

local qt = require('quicktest')
local playwright = require('quicktest.adapters.playwright')
local vitest = require('quicktest.adapters.vitest')
qt.setup({
  adapters = {
    -- require('quicktest.adapters.mocha'),
    vitest({
      is_enabled = function(bufnr)
        return vitest.imports_from_vitest(bufnr)
      end,
    }),
    playwright({
      is_enabled = function(bufnr)
        return playwright.imports_from_playwright(bufnr)
      end,
    }),
  },
  default_win_mode = 'split',
  use_builtin_colorizer = true,
})

vim.keymap.set('n', '<leader>ta', function()
  qt.run_all('split')
end)
vim.keymap.set('n', '<leader>tf', function()
  qt.run_file('split')
end)
vim.keymap.set('n', '<leader>tp', function()
  qt.run_previous('split')
end)
vim.keymap.set('n', '<leader>tt', function()
  qt.toggle_win('split')
end)
