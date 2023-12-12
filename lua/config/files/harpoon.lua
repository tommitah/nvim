local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = "nvim-lua/plenary.nvim"
}

function M.config()
    local harpoon = require("harpoon")
    harpoon:setup()

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>a", function ()
        harpoon:list():append()
    end, opts)
    vim.keymap.set("n", "<leader>p", function ()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end, opts)
    vim.keymap.set("n", "<leader>6", function ()
        harpoon:list():select(1)
    end, opts)
    vim.keymap.set("n", "<leader>7", function ()
        harpoon:list():select(2)
    end, opts)
    vim.keymap.set("n", "<leader>8", function ()
        harpoon:list():select(3)
    end, opts)
    vim.keymap.set("n", "<leader>9", function ()
        harpoon:list():select(4)
    end, opts)
    vim.keymap.set("n", "<leader>0", function ()
        harpoon:list():select(5)
    end, opts)
end
return M
