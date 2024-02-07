local M = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000
}

function M.config()
  require("everforest").setup()
  vim.cmd.colorscheme "everforest"
end

return M
