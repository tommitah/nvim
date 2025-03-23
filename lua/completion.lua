local add, now = MiniDeps.add, MiniDeps.now

local plugs = {
  { source = 'saghen/blink.cmp' }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

now(function()
  require('blink.cmp').setup()
end)
