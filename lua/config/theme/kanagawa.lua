local M = {
    "rebelot/kanagawa.nvim"
}

function M.config()
    require("kanagawa").setup({
        transparent = true,
        theme = "wave",
        background = {
            dark = "dragon"
        }
    })
    vim.cmd.colorscheme "kanagawa"
end

return M
