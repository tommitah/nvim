local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- FILE INFORMATION/SERVICES

local plugs = {
  -- THE ASSHOLE THAT WON'T DIE
  {
    source = 'neovim/nvim-lspconfig',
    depends = { 'saghen/blink.cmp' }
  },
  -- THE FRIEND OF THE ASSHOLE WHO MAKES IT EASIER
  {
    source = 'williamboman/mason.nvim',
    depends = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim'
    }
  },
  -- TS-TOOLS IS A COMMUNITY LSP FOR TS/JS
  {
    source = 'pmizio/typescript-tools.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig'
    }
  }
}

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, Keymap_opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, Keymap_opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, Keymap_opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, Keymap_opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, Keymap_opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, Keymap_opts)
  vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, Keymap_opts)
  vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev, Keymap_opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, Keymap_opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, Keymap_opts)

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
  client.server_capabilities.semanticTokensProvicder = true

  if client.name == 'eslint' then
    client.server_capabilities.documentFormattingProvider = true
  elseif client.name == 'tsserver' or client.name == 'tstools' then
    client.server_capabilities.documentFormattingProvider = false
  end
end

local servers = {
  lua_ls = {},
  jsonls = {},
  eslint = {},
  html = {},
}

for _, plug in ipairs(plugs) do
  add(plug)
end

-- LSP
now(function()
  require('mason').setup()

  local lsp = require('lspconfig')
  local ts_tools = require('typescript-tools')
  local blink = require('blink.cmp')

  for server, config in pairs(servers) do
    config.capabilities = blink.get_lsp_capabilities(config.capabilities)
    config.on_attach = on_attach
    lsp[server].setup(config)
  end

  ts_tools.setup({
    on_attach = on_attach,
    capabilities = blink.get_lsp_capabilities(),
    settings = {
      include_completions_with_insert_text = false
    }
  })
end)
-- FILE INFORMATION/SERVICES
