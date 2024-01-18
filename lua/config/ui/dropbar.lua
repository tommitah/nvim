local M = {
  "Bekaboo/dropbar.nvim",
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim'
  }
}

function M.config()
  vim.cmd([[hi WinBar guibg=NONE]])
end

return M
