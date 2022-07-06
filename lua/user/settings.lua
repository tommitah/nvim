-- Use this initially, please clean it up though...
--
local g_set = vim.o
local w_set = vim.wo
local b_set = vim.bo

g_set.splitright = true
g_set.completeopt = 'menuone,noinsert,noselect'
g_set.termguicolors = true
-- g_set.guifont=JetBrains\ Mono\ Nerd\ Font:h16
g_set.guifont='JetBrainsMono Nerd Font:h16'
-- g_set.guifont='SF Mono:h16'

w_set.wrap = false
w_set.cursorline = true
w_set.number = true
-- w_set.relativenumber = true
w_set.signcolumn = 'yes:1'
-- w_set.colorcolumn = '92'

b_set.tabstop=4
b_set.softtabstop=4
b_set.shiftwidth=4

-- vimscript sadness...
vim.cmd([[
	let g:neovide_refresh_rate=140
	let g:neovide_transparency=0.97

	highlight Normal ctermbg=none
	highlight NonText ctermbg=none

	highlight Normal guibg=none
	highlight NonText guibg=none

	set guifont=JetBrains\ Mono\ Nerd\ Font:h16

	nnoremap Y y$
	nnoremap n nzzzv
	nnoremap N Nzzzv
	inoremap , ,<c-g>u
	inoremap . .<c-g>u
	inoremap ! !<c-g>u
	inoremap ? ?<c-g>u

	inoremap <expr> <Tab>		pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab>	pumvisible() ? "\<C-p>" : "\<S-Tab>"

	autocmd TermEnter term://*toggleterm#* tnoremap <silent><leader>ö <Cmd>exe v:count1 . "ToggleTerm"<CR>

	nnoremap <silent><leader>ö <Cmd>exe v:count1 . "ToggleTerm"<CR>
	inoremap <silent><leader>ö <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])















