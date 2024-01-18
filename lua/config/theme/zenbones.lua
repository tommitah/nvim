local M = {
  "mcchrish/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
}

function M.config()
  -- -- Zenbones
  -- vim.g.zenbones = { lightness = "dim", transparent_background = true }
  -- vim.cmd([[ set background=light ]])
  -- vim.cmd.colorscheme 'zenbones'
  -- Forestbones
  vim.cmd.colorscheme 'forestbones'
end

return M
