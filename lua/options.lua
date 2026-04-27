-- [nfnl] fnl/options.fnl
local keymap_opts = {noremap = true, silent = true}
_G.vim.opt.showmode = false
_G.vim.opt.ignorecase = true
_G.vim.opt.wrap = false
_G.vim.opt.cursorline = true
_G.vim.opt.number = true
_G.vim.opt.signcolumn = "yes:1"
_G.vim.opt.scrolloff = 8
_G.vim.opt.expandtab = true
_G.vim.opt.tabstop = 2
_G.vim.opt.softtabstop = 2
_G.vim.opt.shiftwidth = 2
_G.vim.opt.list = true
_G.vim.opt.guicursor = "n-v-c-i:block"
_G.vim.opt.swapfile = false
_G.vim.keymap.set({"n", "v"}, "<leader>P", "\"+p", keymap_opts)
_G.vim.keymap.set({"n", "v"}, "<leader>Y", "\"+y", keymap_opts)
_G.vim.g.disable_autoformat = false
_G.vim.opt.listchars:append("space:\226\139\133")
return {["keymap-opts"] = keymap_opts}
