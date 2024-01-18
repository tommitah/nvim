local M = {
  "marko-cerovac/material.nvim"
}

function M.config()
  require("material").setup({
    contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = false, -- Enable darker background for the cursor line
    },
  })

  vim.g.material_style = "darker"
  vim.cmd.colorscheme "material"
end

return M
