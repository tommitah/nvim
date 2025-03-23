local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'rebelot/kanagawa.nvim' },
}

for _, plug in ipairs(plugs) do
  add(plug)
end

-- COLOR
now(function()
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
