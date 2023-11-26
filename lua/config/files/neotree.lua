local M = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    }
}

function M.config()
    require("neo-tree").setup({
        filesystem = {
            hijack_netrw_behavior = "open_current"
        }
    })
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "-", ":Neotree position=current<cr>", opts)
end

return M
