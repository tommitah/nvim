local M = {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>S", "<cmd>lua require(\"spectre\").toggle()<cr>", opts)
  vim.keymap.set("n", "<leader>sw", "<cmd>lua require(\"spectre\").open_visual({select_word=true})<cr>", opts)
  vim.keymap.set("v", "<leader>sw", "<cmd>lua require(\"spectre\").open_visual()<cr>", opts)
  vim.keymap.set("n", "<leader>sp", "<cmd>lua require(\"spectre\").open_file_search({select_word=true})<cr>", opts)
end
return M
