vim.cmd [[ autocmd BufWritePost *.ts EslintFixAll ]]

vim.opt.splitright = true
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.termguicolors = true
vim.opt.guifont = 'hermit:h16'
vim.opt.showmode = false
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:1'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- vimscript sadness...
vim.cmd([[
	let g:neovide_refresh_rate=140
	let g:neovide_transparency=0.90
	let g:termdebug_wide=1
	set guicursor=n-v-c-i:block
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
