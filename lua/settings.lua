-- vim.cmd [[ autocmd BufWritePost *.ts EslintFixAll ]]
-- vim.cmd [[ autocmd BufWritePost *.tsx EslintFixAll ]]

-- for scala, can take off
vim.opt_global.shortmess:remove("F")

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.termguicolors = true
vim.opt.guifont = "hermit:h13"
vim.opt.showmode = false
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
-- vim.opt.cmdheight = 0

vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- vimscript sadness...
vim.cmd([[
	let g:neovide_refresh_rate=140
	let g:neovide_transparency=0.92
	let g:termdebug_wide=1

	let g:python_indent = {}
	let g:python_indent.open_paren = 'shiftwidth() * 2'
	let g:python_indent.nested_paren = 'shiftwidth()'
	let g:python_indent.continue = 'shiftwidth() * 2'
	let g:python_indent.closed_paren_align_last_line = v:false

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
