local M = {
  "lewis6991/gitsigns.nvim"
}

function M.config()
  local gitsigns = require "gitsigns"

  gitsigns.setup()
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, opts)
  vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, opts)
  vim.keymap.set("n", "<leader>gw", gitsigns.preview_hunk_inline, opts)
  vim.keymap.set("n", "<leader>gf", gitsigns.diffthis, opts)
  vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, opts)
end

return M
