local M = {
  "echasnovski/mini.statusline",
  version = false
}

function M.config()
  require("mini.statusline").setup()
end

return M
