local M = {
    "kevinhwang91/rnvimr"
}

function M.config()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "-", "<cmd>RnvimrToggle<cr>", opts)
end

return M
