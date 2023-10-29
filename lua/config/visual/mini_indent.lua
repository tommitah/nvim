local M = {
    "echasnovski/mini.indentscope",
    version = false
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

function M.config()
    require("mini.indentscope").setup({
        draw = {
        delay = 0,
        animation = function(s, n)
            return 0
        end,
        },
        mappings = {
            goto_top = "[i",
            goto_bottom = "]i",
        },
        options = {
            border = "both",
        },
        symbol = "|",
    })
end

return M
