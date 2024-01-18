local M = {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}

function M.config()
  require("solarized-osaka").setup({
    transparent = true
  })
  vim.cmd.colorscheme "solarized-osaka"
end

return M
