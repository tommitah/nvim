local M = {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "ibhagwan/fzf-lua"
  },
  config = true
}

function M.config()
  local neogit = require "neogit"

  neogit.setup()

  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>ng", neogit.open, opts)
end

return M
