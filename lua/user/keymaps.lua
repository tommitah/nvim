-- used often in remaps in this scope
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
-- remap leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Source blazingly fast
keymap("n", "<leader>so", ":source ~/.config/nvim/init.lua<CR>", opts)

-- move in GIANT leaps
keymap("n", "<Down>", "10j", opts)
keymap("v", "<Down>", "10j", opts)
keymap("n", "<Up>", "10k", opts)
keymap("v", "<Up>", "10k", opts)

-- Move with alt+hjkl
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- VISUAL MODE: Move highlighted text blocks
keymap("v", "<C-J>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-K>", ":m '<-2<CR>gv=gv", opts)

-- Telescope
keymap("n","<leader>ff","<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",opts)
keymap("n","<leader>fg","<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown{previewer = false})<cr>",opts)
keymap("n","<leader>.","<cmd>lua require('telescope.builtin').quickfix()<cr>",opts)
keymap("n","gr","<cmd>lua require('telescope.builtin').lsp_references()<cr>",opts)
keymap("n","gd","<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",opts)
keymap("n","gi","<cmd>lua require('telescope.builtin').lsp_implementations()<cr>",opts)

-- Telescope file browser
keymap("n", "<C-n>", ":Telescope file_browser<CR>", opts)
-- Telescope change source directory
keymap("n", "<C-D>", ":Telescope cder<CR>", opts)

-- Harpoon
keymap("n","<leader>=","<cmd>lua require('harpoon.mark').add_file()<cr>",opts)
keymap("n","<leader>-","<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",opts)
keymap("n","<leader>7","<cmd>lua require('harpoon.ui').nav_file(1)<cr>",opts)
keymap("n","<leader>8","<cmd>lua require('harpoon.ui').nav_file(2)<cr>",opts)
keymap("n","<leader>9","<cmd>lua require('harpoon.ui').nav_file(3)<cr>",opts)
keymap("n","<leader>0","<cmd>lua require('harpoon.ui').nav_file(4)<cr>",opts)

-- Toggleterm
-- keymap("n","<leader>ö","<cmd>exe v:count1 . Toggleterm<CR>",opts)


















