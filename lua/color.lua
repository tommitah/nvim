local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'brenoprata10/nvim-highlight-colors' },
  { source = 'rebelot/kanagawa.nvim' },
}

for _, plug in ipairs(plugs) do
  add(plug)
end

-- COLOR
now(function()
  require('nvim-highlight-colors').setup()

  require('kanagawa').setup({
    transparent = true,
    keywordStyle = { italic = true },
    background = {
      dark = 'wave'
    }
  })

  vim.cmd('colorscheme kanagawa')
end)

-- COLOR
