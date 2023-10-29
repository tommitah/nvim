vim.loader.enable() -- TODO: check this
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.termguicolors = true
vim.opt.guifont = "JetBrainsMono Nerd Font:h16"
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

if vim.g.neovide then
  local glob = vim.g
  glob.neovide_remember_window_size = true
  glob.neovide_cursor_animation_length = 0.0
  glob.neovide_refresh_rate = 120
  glob.neovide_transparency = 0.90
end

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
