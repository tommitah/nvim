vim.loader.enable()
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.termguicolors = true
-- vim.opt.guifont = "hermit:h14"
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
vim.opt.showmode = false
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
-- vim.opt.cmdheight = 0

-- this is for the dots in tab and line endings
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

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
