local M = {
    "stevearc/oil.nvim",
}

function M.config()
    require("oil").setup({
        view_options = {
            show_hidden = true
        }
    })
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "-", "<cmd>Oil<cr>", opts)
end

return M
