local opts = { noremap = true, silent = true }

-- leader
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VISUAL MODE: Move highlighted text block
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", opts)
-- stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- FZF lua
local fzf_lua = require("fzf-lua")
vim.keymap.set("n", "<leader>ff", fzf_lua.files, opts)
vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep, opts)
vim.keymap.set("n", "<leader>f*", fzf_lua.grep_cword, opts)
vim.keymap.set("n", "gD", fzf_lua.lsp_definitions, opts)
vim.keymap.set("n", "gr", fzf_lua.lsp_references, opts)
vim.keymap.set({ "n", "v" }, "<leader>fv", fzf_lua.grep_visual, opts)
vim.keymap.set("n", "<leader>bb", fzf_lua.buffers ,opts)
vim.keymap.set("n", "<leader>.", fzf_lua.quickfix, opts)

-- TELESCOPE
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
-- vim.keymap.set("n", "<leader>cc", builtin.commands, opts)
-- vim.keymap.set("n", "<leader>.", builtin.quickfix, opts)
-- vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
-- vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
-- vim.keymap.set("n", "gr", builtin.lsp_references, opts)
-- vim.keymap.set("n", "<leader>cs", builtin.colorscheme, opts)
-- vim.keymap.set("n", "<leader>bb", builtin.buffers, opts)

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Gitsigns
vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<cr>")
vim.keymap.set("n", "<leader>gp", ":Gitsigns prev_hunk<cr>")
vim.keymap.set("n", "<leader>gw", ":Gitsigns preview_hunk_inline<cr>")
vim.keymap.set("n", "<leader>gf", ":Gitsigns diffthis<cr>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<cr>")

-- Harpoon
vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
vim.keymap.set("n", "<leader>p", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.keymap.set("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
vim.keymap.set("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
vim.keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
vim.keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
-- refactoring
vim.keymap.set("x", "<leader>re", ":Refactor extract ", opts)
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", opts)
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", opts)
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", opts)
vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", opts)
vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

-- OIL
vim.keymap.set("n", "-", "<cmd>Oil<cr>", opts)
vim.keymap.set("n", "<leader>-", "<cmd>lua MiniFiles.open()<cr>", opts)

vim.keymap.set("n", "<leader>FF", "<cmd>lua MiniPick.builtin.files({ tool = 'git' })<cr>", opts)

-- Inc-rename
vim.keymap.set("n", "rr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- spectre
vim.keymap.set("n", "<leader>S", "<cmd>lua require(\"spectre\").toggle()<cr>", opts)
vim.keymap.set("n", "<leader>sw", "<cmd>lua require(\"spectre\").open_visual({select_word=true})<cr>", opts)
vim.keymap.set("v", "<leader>sw", "<cmd>lua require(\"spectre\").open_visual()<cr>", opts)
vim.keymap.set("n", "<leader>sp", "<cmd>lua require(\"spectre\").open_file_search({select_word=true})<cr>", opts)
