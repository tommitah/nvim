-- [nfnl] fnl/plugins/noice.fnl
return {"folke/noice.nvim", event = "VeryLazy", opts = {lsp = {override = {["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true}}, cmdline = {enabled = true, view = "cmdline"}, messages = {enabled = true}}}
