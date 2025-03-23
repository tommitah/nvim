local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'lewis6991/gitsigns.nvim' },
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

now(function()
  local gitsigns = require('gitsigns')

  gitsigns.setup()
  vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, keymap_opts)
  vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, keymap_opts)
  vim.keymap.set("n", "<leader>gw", gitsigns.preview_hunk_inline, keymap_opts)
  vim.keymap.set("n", "<leader>gf", gitsigns.diffthis, keymap_opts)
  vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, keymap_opts)
end)
-- COLOR
