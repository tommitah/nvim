local M = {
    "folke/trouble.nvim"
}

function M.config()
    local trouble = require "trouble"
    trouble.setup()
    vim.keymap.set("n", "<leader>Q", function()
        trouble.toggle("document_diagnostics")
    end)
    vim.keymap.set("n", "<leader>q", function()
        trouble.toggle("quickfix")
    end)
end

return M
