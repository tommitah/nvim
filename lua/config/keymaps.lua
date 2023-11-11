local opts = { noremap = true, silent = true }

-- VISUAL MODE: Move highlighted text block
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", opts)
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)
