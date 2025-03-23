local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'lewis6991/gitsigns.nvim' },
  {
    source = 'folke/trouble.nvim',
    depends = { 'nvim-tree/nvim-web-devicons' }
  }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

now(function()
  local gitsigns = require('gitsigns')

  gitsigns.setup()
  vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, keymap_opts)
  vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, keymap_opts)
  vim.keymap.set("n", "<leader>gw", gitsigns.preview_hunk_inline, keymap_opts)
  vim.keymap.set("n", "<leader>gf", gitsigns.diffthis, keymap_opts)
  vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, keymap_opts)

  require('trouble').setup()
  vim.keymap.set("n", "<leader>xx", function()
    require("trouble").toggle()
  end, keymap_opts)
  vim.keymap.set("n", "<leader>xw", function()
    require("trouble").toggle("workspace_diagnostics")
  end, keymap_opts)
  vim.keymap.set("n", "<leader>xd", function()
    require("trouble").toggle("diagnostics")
  end, keymap_opts)
  vim.keymap.set("n", "<leader>xq", function()
    require("trouble").toggle("quickfix")
  end, keymap_opts)
  vim.keymap.set("n", "<leader>xl", function()
    require("trouble").toggle("loclist")
  end, keymap_opts)
  vim.keymap.set("n", "gR", function()
    require("trouble").toggle("lsp_references")
  end, keymap_opts)
end)
