-- GENERIC KEYMAPS
-- THIS IS TECHNICALLY AN EXPORTED CONFIG VARIABLE
keymap_opts = { noremap = true, silent = true }

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
