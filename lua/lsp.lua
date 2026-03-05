require('util')
vim.pack.add({
  { src = get_url('neovim/nvim-lspconfig') },
  { src = get_url('mfussenegger/nvim-dap') },
})

vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'marksman',
  'clojure_lsp',
  'jsonls',
  'fennel_language_server',
  'eslint',
  -- 'rust_analyzer',
  -- 'bacon_ls',
  -- 'jdtls',
})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})
vim.lsp.config('ts_ls', {})
vim.lsp.config('eslint', {})
vim.lsp.config('marksman', {})
-- vim.lsp.config('gopls', {})
-- vim.lsp.config('rust_analyzer', {})
-- vim.lsp.config('bacon_ls', {})
-- vim.lsp.config('jdtls', {})
vim.lsp.config('jsonls', {})
vim.lsp.config('clojure_lsp', {})
vim.lsp.config('fennel_language_server', {})

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover({
    border = 'rounded',
  })
end, Keymap_opts)
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, Keymap_opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, Keymap_opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, Keymap_opts)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, Keymap_opts)
vim.keymap.set('n', 'rr', vim.lsp.buf.rename, Keymap_opts)
-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, Keymap_opts)
vim.keymap.set('n', '<C-n>', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, Keymap_opts)
vim.keymap.set('n', '<C-p>', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, Keymap_opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, Keymap_opts)
