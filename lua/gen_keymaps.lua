-- GENERIC KEYMAPS
-- THIS IS TECHNICALLY AN EXPORTED CONFIG VARIABLE
Keymap_opts = { noremap = true, silent = true }

vim.keymap.set("", "<Space>", "<Nop>", Keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VISUAL MODE: Move highlighted text block
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", Keymap_opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", Keymap_opts)
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", Keymap_opts)
vim.keymap.set("v", ">", ">gv", Keymap_opts)

vim.keymap.set({ "n", "v"}, "n", "nzzzv", Keymap_opts)
vim.keymap.set({ "n", "v"}, "N", "Nzzzv", Keymap_opts)
-- GENERIC KEYMAPS
