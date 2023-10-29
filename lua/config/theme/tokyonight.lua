local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000
}

function M.config()
  require("tokyonight").setup({
    style = "moon",
    transparent = false
  })
  vim.cmd.colorscheme "tokyonight"
end

return M
