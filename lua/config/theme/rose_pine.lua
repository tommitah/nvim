local M = {
  "rose-pine/neovim",
  name = "rose-pine"
}

function M.config()
  local rose_pine = require("rose-pine")
  rose_pine.setup({
    variant = "auto",
    disable_background = true
  })
  vim.cmd.colorscheme "rose-pine"
end

return M
