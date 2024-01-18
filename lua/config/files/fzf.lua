local M = {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  }
}

function M.config()
  local fzf_lua = require("fzf-lua")
  fzf_lua.setup({
    winopts = { preview = { hidden = "hidden" } }
  })
  local opts = { noremap = true, silent = true }
  -- vim.keymap.set("n", "<leader>ff", fzf_lua.files, opts)
  -- vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, opts)
  -- vim.keymap.set("n", "<leader>f*", fzf_lua.grep_cword, opts)
  -- vim.keymap.set("n", "gD", fzf_lua.lsp_definitions, opts)
  -- vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, opts)
  -- vim.keymap.set("n", "<leader>bb", fzf_lua.buffers, opts)
  -- vim.keymap.set("n", "<leader>.", fzf_lua.quickfix, opts)
end

return M
