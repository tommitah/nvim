-- GENERIC KEYMAPS
-- THIS IS TECHNICALLY AN EXPORTED CONFIG VARIABLE
Keymap_opts = { noremap = true, silent = true }

vim.keymap.set('', '<Space>', '<Nop>', Keymap_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>so', ':update<CR> :source<CR>')

-- VISUAL MODE: Move highlighted text block
vim.keymap.set('v', '<C-J>', ":m '>+1<CR>gv=gv", Keymap_opts)
vim.keymap.set('v', '<C-K>', ":m '>-2<CR>gv=gv", Keymap_opts)
-- stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', Keymap_opts)
vim.keymap.set('v', '>', '>gv', Keymap_opts)

vim.keymap.set({ 'n', 'v' }, 'n', 'nzzzv', Keymap_opts)
vim.keymap.set({ 'n', 'v' }, 'N', 'Nzzzv', Keymap_opts)

-- language formatting
vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format, Keymap_opts)

-- tabs (useful with clj repl for example)
vim.keymap.set('n', '<leader>>', function()
  vim.cmd('tabnext')
end, Keymap_opts)
vim.keymap.set('n', '<leader><', function()
  vim.cmd('tabprevious')
end, Keymap_opts)

-- GENERIC KEYMAPS
