local M = {
    "mrcjkb/haskell-tools.nvim",
    version = '^3',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
}

function M.config()
    local ht = require "haskell-tools"
    local bufnr = vim.api.nvim_get_current_buf()
    local def_opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "<leader>cn", vim.lsp.codelens.run, def_opts)
    vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, def_opts)
    vim.keymap.set("n", "<leader>ea", ht.lsp.buf_eval_all, def_opts)
    vim.keymap.set("n", "<leader>rt", ht.repl.toggle, def_opts)
    vim.keymap.set("n", "<leader>rf", function ()
        ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, def_opts)
    vim.keymap.set("n", "<leader>rq", ht.repl.quit, def_opts)
end

return M
