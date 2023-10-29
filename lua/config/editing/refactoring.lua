local M = {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    }
}

function M.config()
    require("refactoring").setup()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("x", "<leader>re", ":Refactor extract ", opts)
    vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", opts)
    vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", opts)
    vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", opts)
    vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", opts)
    vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
    vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
end

return M
