local M = {
  "klen/nvim-test"
}

function M.config()
  require("nvim-test").setup()
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>tn", ":TestNearest<cr>", opts)
  vim.keymap.set("n", "<leader>tf", ":TestFile<cr>", opts)
  vim.keymap.set("n", "<leader>ts", ":TestSuite<cr>", opts)
  vim.keymap.set("n", "<leader>tl", ":TestLast<cr>", opts)
  vim.keymap.set("n", "<leader>te", ":TestEdit<cr>", opts)
end

return M
