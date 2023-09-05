vim.loader.enable()
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.termguicolors = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h14"
vim.opt.showmode = false
vim.opt.ignorecase = true

vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"

-- this is for the dots in tab and line endings
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vimscript sadness...
vim.cmd([[
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
