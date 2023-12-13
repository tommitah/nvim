local M = {
  "mcchrish/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
}

function M.config()
  vim.g.zenbones = { lightness = "dim", transparent_background = false }
  vim.cmd([[ set background=light ]])
  vim.cmd.colorscheme 'zenbones'
end

return M
