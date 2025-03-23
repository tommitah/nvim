local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later


local plugs = {
  -- THE ASSHOLE THAT WON'T DIE
  { source = 'neovim/nvim-lspconfig', },
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

for _, plug in ipairs(plugs) do
  add(plug)
end

-- LSP
now(function()
  require('mason').setup()

  local lsp = require('lspconfig')
  local ts_tools = require('typescript-tools')

  lsp.lua_ls.setup({ })
  ts_tools.setup({ })
end)
