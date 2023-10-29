local M = {
    "stevearc/oil.nvim",
}

function M.config()
    require("oil").setup()
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", opts)
end

return M
