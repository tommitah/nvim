-- VANILLA OPTS
-- vim.opt.winborder = 'single'
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.expandtab = true

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.guicursor = 'n-v-c-i:block'
vim.opt.swapfile = false
-- vim.opt.cmdheight = 0
-- VANILLA OPTS

-- GENERIC KEYMAPS
-- THIS IS TECHNICALLY AN EXPORTED CONFIG VARIABLE
Keymap_opts = { noremap = true, silent = true }

vim.keymap.set("", "<Space>", "<Nop>", Keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")

-- VISUAL MODE: Move highlighted text block
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", Keymap_opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", Keymap_opts)
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", Keymap_opts)
vim.keymap.set("v", ">", ">gv", Keymap_opts)

vim.keymap.set({ "n", "v" }, "n", "nzzzv", Keymap_opts)
vim.keymap.set({ "n", "v" }, "N", "Nzzzv", Keymap_opts)

-- GENERIC KEYMAPS

local get_base_url = function(url)
  local plug_base_path = 'https://github.com/'
  return plug_base_path .. url
end
vim.cmd('packadd nvim.difftool')
vim.pack.add({
  { src = get_base_url 'rktjmp/lush.nvim' },
  { src = get_base_url 'rebelot/kanagawa.nvim' },
  { src = get_base_url 'Alligator/accent.vim' },
  { src = get_base_url 'zenbones-theme/zenbones.nvim' },
  { src = get_base_url 'maxmx03/solarized.nvim' },
  { src = get_base_url 'rose-pine/neovim' },
  { src = get_base_url 'vague2k/vague.nvim' },
  { src = get_base_url 'nvim-mini/mini.icons' },
  { src = get_base_url 'nvim-mini/mini.statusline' },
  { src = get_base_url 'nvim-mini/mini-git' },
  { src = get_base_url 'nvim-mini/mini.pairs' },
  { src = get_base_url 'nvim-mini/mini.completion' },
  { src = get_base_url 'nvim-mini/mini.diff' },
  { src = get_base_url 'nvim-mini/mini.pick' },
  { src = get_base_url 'nvim-lua/plenary.nvim' },
  -- { src = get_base_url 'nvim-telescope/telescope.nvim' },
  {
    src = get_base_url 'ThePrimeagen/harpoon',
    version = 'harpoon2'
  },
  { src = get_base_url 'stevearc/oil.nvim' },
  { src = get_base_url 'stevearc/quicker.nvim' },
  { src = get_base_url 'stevearc/conform.nvim' },
  { src = get_base_url 'ibhagwan/fzf-lua' },
  { src = get_base_url 'neovim/nvim-lspconfig' },
  -- {
  --   src = get_base_url 'saghen/blink.cmp',
  --   version = 'v1.4.1'
  -- },
  {
    src = get_base_url 'nvim-treesitter/nvim-treesitter',
    version = 'main'
  },
  {
    -- TREESITTER HTML TAG PLUG
    src = get_base_url 'windwp/nvim-ts-autotag',
  },
  { src = get_base_url 'jinh0/eyeliner.nvim' },
  -- { src = get_base_url 'lewis6991/gitsigns.nvim' },
  { src = get_base_url 'kylechui/nvim-surround' },
  { src = get_base_url 'nvim-orgmode/orgmode' },
  { src = get_base_url 'brenoprata10/nvim-highlight-colors' },
  { src = get_base_url 'copilotlsp-nvim/copilot-lsp' },
  { src = get_base_url 'zbirenbaum/copilot.lua' },
  { src = get_base_url 'CopilotC-Nvim/CopilotChat.nvim' },
})

require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = false,
    hide_during_completion = true,
    debounce = 75,
    trigger_on_accept = true,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      -- next = "<C-]>",
      -- prev = "<C-[>",
      -- dismiss = "<Esc>",
    },
  },
  -- nes = {
  --   enabled = false,
  --   keymap = {
  --     accept_and_goto = "<leader>np",
  --     accept = false,
  --     dismiss = "<Esc>",
  --   },
  -- },
})

require('CopilotChat').setup({
  model = 'gpt-5.1',
  temperature = 0.1,
  window = {
    layout = 'horizontal',
    width = 0.7,
  },
  auto_insert_mode = false,
})

require('nvim-highlight-colors').setup({})

local mini_git = require('mini.git')
local mini_icons = require('mini.icons')
local mini_statusline = require('mini.statusline')
local mini_pairs = require('mini.pairs')
local mini_completion = require('mini.completion')
local mini_diff = require('mini.diff')
local mini_pick = require('mini.pick')
mini_git.setup()
mini_icons.mock_nvim_web_devicons()
mini_icons.tweak_lsp_kind()
mini_statusline.setup()
mini_pairs.setup()
mini_completion.setup()
mini_diff.setup()
mini_pick.setup()
-- set as default picker
vim.ui.select = mini_pick.ui_select

-- vim.keymap.set("n", "<leader>ff", mini_pick.builtin.files, Keymap_opts)
-- vim.keymap.set("n", "<leader>fg", mini_pick.builtin.grep_live, Keymap_opts)
-- no clue why the lua version doesn't work
-- vim.keymap.set({ 'n', 'v' }, '<leader>f*', ':Pick grep pattern=\'<cword>\'<cr>', Keymap_opts)
-- vim.keymap.set({ "n", "v" }, "<leader>f*", function()
--   mini_pick.builtin.grep({
--     pattern = '<cword>'
--   })
-- end, Keymap_opts)
-- -- GIT STATUS
-- vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, Keymap_opts)
-- vim.keymap.set("n", "<leader>gs", function()
--   mini_pick.start({
--     source = {
--       items = {} -- TODO here we need to get the query output for Git status
--     }
--   })
-- end, Keymap_opts)
-- vim.keymap.set("n", "<leader>gB", fzf_lua.git_bcommits, Keymap_opts)
-- vim.keymap.set("n", "<leader>gC", fzf_lua.git_commits, Keymap_opts)
-- vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, Keymap_opts)
-- vim.keymap.set("n", "<leader>bb", fzf_lua.buffers, Keymap_opts)
-- vim.keymap.set("n", "<leader>Q", fzf_lua.quickfix, Keymap_opts)
-- vim.keymap.set("n", "<leader>dW", fzf_lua.diagnostics_workspace, Keymap_opts)
-- vim.keymap.set("n", "<leader>dD", fzf_lua.diagnostics_document, Keymap_opts)

require('oil').setup({
  view_options = {
    show_hidden = true,
  }
})
vim.keymap.set('n', '-', '<cmd>Oil<cr>', Keymap_opts)

-- quickfix is automagically populated when you `:grep` something,
-- <C-q> in fzf populates with fzf output
local quicker = require('quicker')
quicker.setup()
vim.keymap.set('n', '<leader>q', quicker.toggle, Keymap_opts)
vim.keymap.set('n', '<leader>rq', quicker.refresh, Keymap_opts)
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", Keymap_opts)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", Keymap_opts)
-- note that this doesn't clear the loclist
vim.keymap.set("n", "<leader>cq", "<cmd>call setqflist([])<cr>", Keymap_opts)

-- require('rose-pine').setup({
--   variant = 'main',
--   styles = {
--     italic = false,
--     transparency = true
--   }
-- })
-- vim.cmd.colorscheme 'rose-pine'
-- require('solarized').setup({
--   transparent = {
--     enabled = true
--   },
--   palette = 'selenized',
--   variant = 'summer'
-- })
-- vim.cmd.colorscheme 'solarized'
-- vim.cmd.colorscheme 'accent'
require('kanagawa').setup({
  transparent = true,
  background = {
    dark = 'wave'
  }
})
vim.cmd.colorscheme 'kanagawa'
-- require('vague').setup({
--   transparent = true
-- })
-- vim.cmd('colorscheme vague')
-- vim.g.zenbones = {
--   -- lightness = 'dim',
--   transparent_background = true
-- }
-- vim.cmd('set background=light')
-- vim.cmd.colorscheme 'zenbones'

-- require('blink.cmp').setup()

-- rust_analyzer
-- bacon_ls
-- cargo install --locked bacon bacon-ls
vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'gopls',
  'marksman',
  'rust_analyzer',
  'bacon_ls'
})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
})
vim.lsp.config('ts_ls', {})
vim.lsp.config('marksman', {})
vim.lsp.config('gopls', {})
vim.lsp.config('rust_analyzer', {})
vim.lsp.config('bacon_ls', {})

vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover({
    border = 'rounded'
  })
end, Keymap_opts)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, Keymap_opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, Keymap_opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, Keymap_opts)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, Keymap_opts)
vim.keymap.set("n", "rr", vim.lsp.buf.rename, Keymap_opts)
-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, Keymap_opts)
vim.keymap.set("n", "<C-n>", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, Keymap_opts)
vim.keymap.set("n", "<C-p>", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, Keymap_opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, Keymap_opts)
-- language formatting
vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, Keymap_opts)


local harpoon = require('harpoon')
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end, Keymap_opts)
vim.keymap.set('n', '<leader>p', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, Keymap_opts)
vim.keymap.set('n', '<leader>6', function() harpoon:list():select(1) end, Keymap_opts)
vim.keymap.set('n', '<leader>7', function() harpoon:list():select(2) end, Keymap_opts)
vim.keymap.set('n', '<leader>8', function() harpoon:list():select(3) end, Keymap_opts)
vim.keymap.set('n', '<leader>9', function() harpoon:list():select(4) end, Keymap_opts)
vim.keymap.set('n', '<leader>0', function() harpoon:list():select(5) end, Keymap_opts)
-- wtf is up with these?
-- vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-n>", function() harpoon:list():next() end)

local fzf_lua = require('fzf-lua')
fzf_lua.setup({
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
  -- actions = {
  --   files = {
  --     ['ctrl-q'] = fzf_lua.actions.file_sel_to_qf
  --   }
  -- },
  winopts = {
    -- split = 'belowright new'
    fullscreen = true,
    preview = {
      border = 'none',
      vertical = 'down:50%',
      layout = 'vertical'
    }
  }
})

vim.keymap.set("n", "<leader>ff", fzf_lua.files, Keymap_opts)
vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, Keymap_opts)
vim.keymap.set("n", "<leader>fG", fzf_lua.live_grep_resume, Keymap_opts)
vim.keymap.set({ "n", "v" }, "<leader>f*", fzf_lua.grep_cword, Keymap_opts)
-- vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, opts)
-- vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
-- GIT STATUS
vim.keymap.set("n", "<leader>gs", fzf_lua.git_status, Keymap_opts)
vim.keymap.set("n", "<leader>gB", fzf_lua.git_bcommits, Keymap_opts)
vim.keymap.set("n", "<leader>gC", fzf_lua.git_commits, Keymap_opts)
vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, Keymap_opts)
vim.keymap.set("n", "<leader>bb", fzf_lua.buffers, Keymap_opts)
vim.keymap.set("n", "<leader>Q", fzf_lua.quickfix, Keymap_opts)
vim.keymap.set("n", "<leader>dW", fzf_lua.diagnostics_workspace, Keymap_opts)
vim.keymap.set("n", "<leader>dD", fzf_lua.diagnostics_document, Keymap_opts)
vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<cr>", Keymap_opts)
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", Keymap_opts)
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", Keymap_opts)
vim.keymap.set("n", "<leader>gid", "<cmd>Git diff<cr>", Keymap_opts)
-- vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin", Keymap_opts)

-- local gitsigns = require('gitsigns')

-- gitsigns.setup()
-- vim.keymap.set("n", "<leader>gn", function()
--   gitsigns.nav_hunk('next')
-- end, Keymap_opts)
-- vim.keymap.set("n", "<leader>gp", function()
--   gitsigns.nav_hunk('prev')
-- end, Keymap_opts)
-- vim.keymap.set("n", "<leader>gw", gitsigns.preview_hunk_inline, Keymap_opts)
-- vim.keymap.set("n", "<leader>gf", gitsigns.diffthis, Keymap_opts)
-- vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, Keymap_opts)

---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua', 'vimdoc', 'json',
    'markdown', 'markdown_inline', 'tsx',
    'javascript', 'typescript', 'html'
  },
  highlight = { enable = true },
})
---@diagnostic disable-next-line: missing-fields
require('nvim-ts-autotag').setup({
  opts = {
    -- defaults
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false, -- enable for </
  },
})
require('eyeliner').setup({
  highlight_on_key = true,
  dim = true
})
require('nvim-surround').setup()

vim.g.disable_autoformat = false

require('conform').setup({
  formatters = {
    prettierd = {
      require_cwd = true
    },
  },
  formatters_by_ft = {
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end
})

-- use orgmode for note taking and todo lists inside neovim
require('orgmode').setup({
  org_agenda_files = '~/development/notes/orgfiles/**/*',
  org_default_notes_file = '~/development/notes/orgfiles/refile.org',
})

vim.keymap.set("n", "<leader>ot", ":lua Org.capture.t()<cr>", Keymap_opts)
