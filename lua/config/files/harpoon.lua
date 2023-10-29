local M = {
    "ThePrimeagen/harpoon"
}

function M.config()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
    vim.keymap.set("n", "<leader>p", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
    vim.keymap.set("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
    vim.keymap.set("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
    vim.keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
    vim.keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
    vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
end

return M
