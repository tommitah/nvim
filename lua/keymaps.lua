local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- leader
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- move with alt+hjkl
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)

-- VISUAL MODE: Move highlighted text block
keymap('v', '<C-J>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<C-K>', ":m '>-2<CR>gv=gv", opts)

-- TELESCOPE
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>cc', builtin.commands, opts)
vim.keymap.set('n', '<leader>.', builtin.quickfix, opts)
vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
vim.keymap.set('n', 'gr', builtin.lsp_references, opts)

keymap('n', '<C-n>', ':Telescope file_browser<CR>', opts)
keymap('n', '<C-G>', ':Telescope cder<CR>', opts)
keymap('n', '<C-p>', ':Telescope project<CR>', opts)

-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Harpoon
keymap('n', '<leader>=', "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap('n', '<leader>-', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap('n', '<leader>7', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap('n', '<leader>8', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap('n', '<leader>9', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap('n', '<leader>0', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)

-- LSP toggle formatting on save
keymap('n', '<leader><C-f>', ':LspToggleAutoFormat<cr>', opts)
