-- VANILLA OPTS
-- vim.opt.winborder = 'single'
vim.cmd('packadd nvim.difftool')
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = 'yes:1'
vim.opt.scrolloff = 8
vim.opt.expandtab = true

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.guicursor = 'n-v-c-i:block'
vim.opt.swapfile = false

-- yank/paste from os clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+p', Keymap_opts)
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+y', Keymap_opts)

vim.g.disable_autoformat = false
-- vim.opt.cmdheight = 0
-- VANILLA OPTS
