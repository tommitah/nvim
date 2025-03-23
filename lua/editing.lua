local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'jinh0/eyeliner.nvim' },
  { source = 'kylechui/nvim-surround' }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

-- EDITING
now(function()
  require('eyeliner').setup({
    highlight_on_key = true,
    dim = false
  })
end)

now(function()
  require('nvim-surround').setup()
end)
-- EDITING
