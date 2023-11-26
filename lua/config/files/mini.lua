local M = {
    "echasnovski/mini.files",
      version = false
}

function M.config()
    local files = require "mini.files"
    files.setup()
end

return M
