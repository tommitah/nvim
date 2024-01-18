local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }
}

function M.config()
  local telescope = require("telescope")
  local opts = {
    defaults = {
      file_ignore_patterns = { "node_modules", "target", "build" },
    },
    pickers = {
      find_files = { theme = "ivy" },
      live_grep = { theme = "ivy" },
      lsp_definitions = { theme = "ivy" },
      lsp_references = { theme = "ivy" },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      },
    },
  }
  telescope.setup(opts)
  -- telescope.load_extension("ui-select")
  local keymap_opts = { noremap = true, silent = true }
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, keymap_opts)
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, keymap_opts)
  -- vim.keymap.set("n", "<leader>f*", fzf_lua.grep_cword, keymap_opts)
  vim.keymap.set("n", "gd", builtin.lsp_definitions, keymap_opts)
  vim.keymap.set("n", "gr", builtin.lsp_references, keymap_opts)
  vim.keymap.set("n", "gt", builtin.lsp_type_definitions, keymap_opts)
  -- vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, keymap_opts)
  vim.keymap.set("n", "<leader>bb", builtin.buffers, keymap_opts)
  -- vim.keymap.set("n", "<leader>.", fzf_lua.quickfix, keymap_opts)
end

return M
