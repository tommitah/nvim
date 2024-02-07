local M = {
  "rose-pine/neovim",
  name = "rose-pine"
}

function M.config()
  require("rose-pine").setup({
    variant = "auto",
    disable_background = true
  })
  vim.cmd.colorscheme "rose-pine"
end

return M
