local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim"
    }
}

function M.config()
    require("noice").setup({
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            }
        },
        cmdline = {
            view = "cmdline",
            format = {
                search_down = {
                    view = "cmdline",
                },
                search_up = {
                    view = "cmdline"
                }
            },
        }
    })
end

return M
