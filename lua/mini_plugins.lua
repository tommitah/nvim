-- PLUGINS
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- MINI UTILS
local plugs = {
  {
    source = 'echasnovski/mini.comment',
    checkout = 'stable'
  },
  {
    source = 'echasnovski/mini.pairs',
    checkout = 'stable'
  },
  {
    source = 'echasnovski/mini-git',
    checkout = 'stable'
  },
  {
    source = 'echasnovski/mini.statusline',
    checkout = 'stable'
  },
  {
    source = 'echasnovski/mini.indentscope',
    checkout = 'stable'
  }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

now(function()
  require('mini.indentscope').setup({
    draw = {
      delay = 0,
      animation = function(_, _)
        return 0
      end,
    },
    mappings = {
      goto_top = "[i",
      goto_bottom = "]i",
    },
    options = {
      border = "both",
    },
    symbol = "│",
  })

  require('mini.statusline').setup()
  require('mini.git').setup()
  require('mini.pairs').setup()

  -- git status is requested through fuzzy plug
  vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<cr>", Keymap_opts)
  vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", Keymap_opts)
  vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", Keymap_opts)
  vim.keymap.set("n", "<leader>gid", "<cmd>Git diff<cr>", Keymap_opts)
  vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin", Keymap_opts)
end)
-- MINI UTILS
