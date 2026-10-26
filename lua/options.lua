-- [nfnl] fnl/options.fnl
local keymap_opts = {noremap = true, silent = true}
_G.vim.opt.showmode = false
_G.vim.opt.ignorecase = true
_G.vim.opt.wrap = false
local function _1_()
  _G.vim.opt_local.wrap = true
  return nil
end
_G.vim.api.nvim_create_autocmd("FileType", {pattern = {"markdown", "text", "norg", "neorg"}, callback = _1_})
_G.vim.opt.cursorline = true
_G.vim.opt.number = true
_G.vim.opt.signcolumn = "yes:1"
_G.vim.opt.scrolloff = 8
_G.vim.opt.expandtab = true
_G.vim.opt.tabstop = 2
_G.vim.opt.softtabstop = 2
_G.vim.opt.shiftwidth = 2
local function _2_()
  _G.vim.bo.tabstop = 4
  _G.vim.bo.softtabstop = 4
  _G.vim.bo.shiftwidth = 4
  _G.vim.bo.expandtab = true
  return nil
end
_G.vim.api.nvim_create_autocmd("FileType", {pattern = "java", callback = _2_})
_G.vim.opt.list = true
_G.vim.opt.guicursor = "n-v-c-i:block"
_G.vim.opt.swapfile = false
_G.vim.keymap.set({"n", "v"}, "<leader>P", "\"+p", keymap_opts)
_G.vim.keymap.set({"n", "v"}, "<leader>Y", "\"+y", keymap_opts)
_G.vim.g.disable_autoformat = false
return {["keymap-opts"] = keymap_opts}
