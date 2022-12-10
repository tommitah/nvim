-- Use this initially, please clean it up though...
--
local g_set = vim.o
local w_set = vim.wo
local b_set = vim.bo

-- vim.cmd.nvim_create_autocmd("BufWritePre", {
-- 	pattern = {"*.tsx","*.ts","*.jsx","*.js"},
-- 	command = "EslintFixAll",
-- })

-- vim.cmd [[ autocmd BufWritePre <buffer> EslintFixAll ]]
vim.cmd [[ autocmd BufWritePost *.ts EslintFixAll ]]

-- g_set.cmdheight = 0
g_set.splitright = true
g_set.completeopt = 'menuone,noinsert,noselect'
g_set.termguicolors = true
-- g_set.guifont=JetBrains\ Mono\ Nerd\ Font:h16
-- g_set.guifont='JetBrainsMono Nerd Font:h16'
g_set.guifont = 'hermit:h16'
-- g_set.guifont='pt mono:h16'
g_set.showmode = false
g_set.ignorecase = true
-- g_set.smartcase = true
-- g_set.guifont='SF Mono:h16'

w_set.wrap = false
w_set.cursorline = true
w_set.number = true
w_set.relativenumber = true
w_set.signcolumn = 'yes:1'
-- w_set.colorcolumn = '92'
-- Relative 
-- b_set.tabstop=4
-- b_set.softtabstop=4
-- b_set.shiftwidth=4


-- vimscript sadness...
vim.cmd([[

	let g:neovide_refresh_rate=140
	let g:neovide_transparency=0.90

	let g:termdebug_wide=1

	set guicursor=n-v-c-i:block
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4

	nnoremap Y y$
	nnoremap n nzzzv
	nnoremap N Nzzzv
	inoremap , ,<c-g>u
	inoremap . .<c-g>u
	inoremap ! !<c-g>u
	inoremap ? ?<c-g>u

	inoremap <expr> <Tab>		pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab>	pumvisible() ? "\<C-p>" : "\<S-Tab>"
]])
