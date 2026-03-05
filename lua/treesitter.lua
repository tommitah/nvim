require('util')

vim.pack.add({
  {
    src = get_url('nvim-treesitter/nvim-treesitter'),
    version = 'main',
  },
  {
    -- TREESITTER HTML TAG PLUG
    src = get_url('windwp/nvim-ts-autotag'),
  },
})

require('nvim-treesitter').install({
  'rust',
  'vimdoc',
  'lua',
  'json',
  'markdown',
  'markdown_inline',
  'javascript',
  'typescript',
  'tsx',
  'html',
  'yaml',
  'clojure',
  'fennel',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'jsx',
    'tsx',
    'rust',
    'json',
    'html',
    'lua',
    'markdown',
    'fennel',
    'fnl',
    'yaml',
    '*.fnl',
    '*.rs',
    '*.jsx',
    '*.tsx',
    'clj',
    'clojure',
    'java',
  },
  callback = function()
    vim.treesitter.start()
  end,
})

---@diagnostic disable-next-line: missing-fields
require('nvim-ts-autotag').setup({
  opts = {
    -- defaults
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false, -- enable for </
  },
})
