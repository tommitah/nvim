require("notify").setup({
    background_colour = "#000000"
})
require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
            -- ["vim.lsp.handlers[\"textDocument/signatureHelp\"]"] = false
        },
        signature = {
            enabled = false,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
    cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
            search_down = {
                view = "cmdline",
            },
            search_up = {
                view = "cmdline",
            },
        },
    },
    redirect = {
        view = "cmdline",
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
    },
})
