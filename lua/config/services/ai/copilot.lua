local M = {
  -- "github/copilot.vim"
  "zbirenbaum/copilot.lua"
}

function M.config()
  require('copilot').setup({
    enabled = true,
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        next = "<M-n>",
        prev = "<M-p>",
      }
    }
  })
end

-- vim.keymap.set('i', '<C-n>', 'copilot#Next()')
-- vim.keymap.set('i', '<C-p>', 'copilot#Previous()')

return M
