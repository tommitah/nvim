require('util')

vim.pack.add({
  {
    src = get_url('ThePrimeagen/harpoon'),
    version = 'harpoon2',
  },
  { src = get_url('stevearc/oil.nvim') },
  { src = get_url('stevearc/quicker.nvim') },
  { src = get_url('stevearc/conform.nvim') },
  { src = get_url('ibhagwan/fzf-lua') },
  { src = get_url('jinh0/eyeliner.nvim') },
  { src = get_url('kylechui/nvim-surround') },
  { src = get_url('nvim-orgmode/orgmode') },
})

require('oil').setup({
  view_options = {
    show_hidden = true,
  },
})
vim.keymap.set('n', '-', '<cmd>Oil<cr>', Keymap_opts)

-- quickfix is automagically populated when you `:grep` something,
-- <C-q> in fzf populates with fzf output
local quicker = require('quicker')
quicker.setup()
vim.keymap.set('n', '<leader>q', quicker.toggle, Keymap_opts)
vim.keymap.set('n', '<leader>rq', quicker.refresh, Keymap_opts)
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz', Keymap_opts)
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz', Keymap_opts)
-- note that this doesn't clear the loclist
vim.keymap.set('n', '<leader>cq', '<cmd>call setqflist([])<cr>', Keymap_opts)

local harpoon = require('harpoon')
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, Keymap_opts)
vim.keymap.set('n', '<leader>p', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, Keymap_opts)
vim.keymap.set('n', '<leader>6', function()
  harpoon:list():select(1)
end, Keymap_opts)
vim.keymap.set('n', '<leader>7', function()
  harpoon:list():select(2)
end, Keymap_opts)
vim.keymap.set('n', '<leader>8', function()
  harpoon:list():select(3)
end, Keymap_opts)
vim.keymap.set('n', '<leader>9', function()
  harpoon:list():select(4)
end, Keymap_opts)
vim.keymap.set('n', '<leader>0', function()
  harpoon:list():select(5)
end, Keymap_opts)
-- wtf is up with these?
-- vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-n>", function() harpoon:list():next() end)

local fzf_lua = require('fzf-lua')
fzf_lua.setup({
  keymap = {
    fzf = {
      ['ctrl-q'] = 'select-all+accept',
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
      layout = 'vertical',
    },
  },
})

vim.keymap.set('n', '<leader>ff', fzf_lua.files, Keymap_opts)
vim.keymap.set('n', '<leader>fg', fzf_lua.live_grep, Keymap_opts)
vim.keymap.set('n', '<leader>fG', fzf_lua.live_grep_resume, Keymap_opts)
vim.keymap.set({ 'n', 'v' }, '<leader>f*', fzf_lua.grep_cword, Keymap_opts)
-- vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, opts)
-- vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
-- GIT STATUS
vim.keymap.set('n', '<leader>gs', fzf_lua.git_status, Keymap_opts)
vim.keymap.set('n', '<leader>gB', fzf_lua.git_bcommits, Keymap_opts)
vim.keymap.set('n', '<leader>gC', fzf_lua.git_commits, Keymap_opts)
vim.keymap.set({ 'n', 'v' }, '<leader>fv', fzf_lua.grep_visual, Keymap_opts)
vim.keymap.set('n', '<leader>bb', fzf_lua.buffers, Keymap_opts)
vim.keymap.set('n', '<leader>Q', fzf_lua.quickfix, Keymap_opts)
vim.keymap.set('n', '<leader>dW', fzf_lua.diagnostics_workspace, Keymap_opts)
vim.keymap.set('n', '<leader>dD', fzf_lua.diagnostics_document, Keymap_opts)
vim.keymap.set('n', '<leader>ga', '<cmd>Git add %<cr>', Keymap_opts)
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', Keymap_opts)
vim.keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', Keymap_opts)
vim.keymap.set('n', '<leader>gid', '<cmd>Git diff<cr>', Keymap_opts)
-- vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin", Keymap_opts)

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    rust = { 'rustfmt', lsp_format = 'fallback' },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end,
})
require('eyeliner').setup({
  highlight_on_key = true,
  dim = true,
})
require('nvim-surround').setup()

-- use orgmode for note taking and todo lists inside neovim
---@diagnostic disable-next-line: missing-fields
require('orgmode').setup({
  org_agenda_files = '~/development/notes/orgfiles/**/*',
  org_default_notes_file = '~/development/notes/orgfiles/refile.org',
})

vim.keymap.set('n', '<leader>ot', ':lua Org.capture.t()<cr>', Keymap_opts)
