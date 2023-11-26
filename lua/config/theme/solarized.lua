local M = {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    require("solarized").setup({
        transparent = false,
        theme = "neo",
        -- theme = "default",
    })

    vim.cmd.colorscheme "solarized"
end

return M
