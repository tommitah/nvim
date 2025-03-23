-- VANILLA OPTS
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- VANILLA OPTS

-- GENERIC KEYMAPS
local keymap_opts = { noremap = true, silent = true }
vim.keymap.set("", "<Space>", "<Nop>", keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VISUAL MODE: Move highlighted text block
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", keymap_opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", keymap_opts)
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", keymap_opts)
vim.keymap.set("v", ">", ">gv", keymap_opts)
-- GENERIC KEYMAPS

-- MINI.DEPS (package manager)
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })
-- MINI.DEPS

-- PLUGINS
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- MINI UTILS
add({
  source = 'echasnovski/mini.comment',
  checkout = 'stable'
})
add({
  source = 'echasnovski/mini.pairs',
  checkout = 'stable'
})
add({
  source = 'echasnovski/mini-git',
  checkout = 'stable'
})
add({
  source = 'echasnovski/mini.statusline',
  checkout = 'stable'
})
add({
  source = 'echasnovski/mini.indentscope',
  checkout = 'stable'
})

now(function()
  require('mini.indentscope').setup({
    draw = {
      delay = 0,
      animation = function(s, n)
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
    symbol = "|",
  })

  require('mini.statusline').setup()
  require('mini.git').setup()

  -- git status is requested through fuzzy plug
  vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<cr>", keymap_opts)
  vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", keymap_opts)
  vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", keymap_opts)
  vim.keymap.set("n", "<leader>gid", "<cmd>Git diff<cr>", keymap_opts)
  vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin", keymap_opts)
end)
-- MINI UTILS

-- TREESITTER
add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main'
})
-- TREESITTER HTML TAG PLUG
add({
  source = 'windwp/nvim-ts-autotag',
  checkout = 'main'
})
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

-- FILES
-- OIL
add({ source = 'stevearc/oil.nvim', })
now(function()
  require('oil').setup()
  vim.keymap.set('n', '-', '<cmd>Oil<cr>', keymap_opts)
end)
-- OIL

-- HARPOON
add({
  source = 'ThePrimeagen/harpoon',
  checkout = 'harpoon2',
  monitor = 'harpoon2',
  depends = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim'
  }
})
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
-- FILES

-- COLOR
add({ source = 'lewis6991/gitsigns.nvim' })
add({ source = 'rebelot/kanagawa.nvim', })
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

-- PLUGINS

