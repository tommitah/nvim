local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

local plugs = {
  { source = 'stevearc/oil.nvim', },
  {
    source = 'ThePrimeagen/harpoon',
    checkout = 'harpoon2',
    monitor = 'harpoon2',
    depends = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  },
  {
    source = 'ibhagwan/fzf-lua',
    depends = { 'nvim-tree/nvim-web-devicons' }
  }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

-- FILES
-- OIL
now(function()
  require('oil').setup()
  vim.keymap.set('n', '-', '<cmd>Oil<cr>', keymap_opts)
end)
-- OIL

-- HARPOON
now(function()
  local harpoon = require('harpoon')
  harpoon:setup()

  vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
  end, keymap_opts)
  vim.keymap.set('n', '<leader>p', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, keymap_opts)
  vim.keymap.set('n', '<leader>6', function()
    harpoon:list():select(1)
  end, keymap_opts)
  vim.keymap.set('n', '<leader>7', function()
    harpoon:list():select(2)
  end, keymap_opts)
  vim.keymap.set('n', '<leader>8', function()
    harpoon:list():select(3)
  end, keymap_opts)
  vim.keymap.set('n', '<leader>9', function()
    harpoon:list():select(4)
  end, keymap_opts)
  vim.keymap.set('n', '<leader>0', function()
    harpoon:list():select(5)
  end, keymap_opts)
end)
-- HARPOON

-- FZF
now(function()
  local fzf_lua = require('fzf-lua')
  fzf_lua.setup({ 'telescope' })

  vim.keymap.set("n", "<leader>ff", fzf_lua.files, keymap_opts)
  vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, keymap_opts)
  vim.keymap.set("n", "<leader>fG", fzf_lua.live_grep_resume, keymap_opts)
  vim.keymap.set({ "n", "v" }, "<leader>f*", fzf_lua.grep_cword, keymap_opts)
  -- vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, opts)
  -- vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
  -- GIT STATUS
  vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, keymap_opts)
  vim.keymap.set("n", "<leader>gB", fzf_lua.git_bcommits, keymap_opts)
  vim.keymap.set("n", "<leader>gC", fzf_lua.git_commits, keymap_opts)
  vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, keymap_opts)
  vim.keymap.set("n", "<leader>bb", fzf_lua.buffers, keymap_opts)
  vim.keymap.set("n", "<leader>Q", fzf_lua.quickfix, keymap_opts)
  vim.keymap.set("n", "<leader>dW", fzf_lua.diagnostics_workspace, keymap_opts)
  vim.keymap.set("n", "<leader>dD", fzf_lua.diagnostics_document, keymap_opts)
end)

-- FZF

-- FILES
