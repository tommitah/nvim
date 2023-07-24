local typescript_tools = require("typescript-tools")

typescript_tools.setup({
    on_attach = function ()
        local opts = { noremap = true, silent = true, buffer = bufnr }
        -- vim.keymap.set("n", "rr", function()
        -- 	return ":IncRename " .. vim.fn.expand("<cword>")
        -- end, { expr = true })
        vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
        -- vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
        -- vim.keymap.set("n", "rr", "<cmd>Lspsaga rename<CR>", opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "<leader>fr", "<cmd>Lspsaga lsp_finder<CR>", opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", ":TroubleToggle<CR>", opts)
        vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
    end
})
