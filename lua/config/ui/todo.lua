local M = {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim"
}

function M.config()
    require("todo-comments").setup()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>T", ":TodoQuickFix<cr>", opts)
end

return M
