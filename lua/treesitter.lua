local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- TREESITTER

local plugs = {
  {
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'master',
    monitor = 'main'
  },
  -- TREESITTER HTML TAG PLUG
  {
    source = 'windwp/nvim-ts-autotag',
    checkout = 'main'
  }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

now(function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua', 'vimdoc', 'json',
      'markdown', 'markdown_inline', 'tsx',
      'javascript', 'typescript', 'html'
    },
    highlight = { enable = true },
  })
end)
later(function()
  require('nvim-ts-autotag').setup({
    opts = {
      -- defaults
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false, -- enable for </
    },
  })
end)
-- TREESITTER
