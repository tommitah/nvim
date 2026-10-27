-- [nfnl] fnl/options.fnl
local keymap_opts = {noremap = true, silent = true}
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.wrap = false
local function _1_()
  vim.opt_local.wrap = true
  return nil
end
vim.api.nvim_create_autocmd("FileType", {pattern = {"markdown", "text", "norg", "neorg", "org"}, callback = _1_})
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
local function _2_()
  vim.bo.tabstop = 4
  vim.bo.softtabstop = 4
  vim.bo.shiftwidth = 4
  vim.bo.expandtab = true
  return nil
end
vim.api.nvim_create_autocmd("FileType", {pattern = "java", callback = _2_})
vim.opt.list = true
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.swapfile = false
vim.g.disable_autoformat = false
return {["keymap-opts"] = keymap_opts}
