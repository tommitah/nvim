local M = {
    "kelly-lin/ranger.nvim"
}

function M.config()
    require("ranger-nvim").setup({ replace_netrw = true })
    vim.api.nvim_set_keymap("n", "-", "", {
        noremap = true,
        callback = function ()
            require("ranger-nvim").open(true)
        end
    })
end

return M
