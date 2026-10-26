-- [nfnl] fnl/gen_keymaps.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
vim.keymap.set("", "<Space>", "<Nop>", keymap_opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", keymap_opts)
vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", keymap_opts)
vim.keymap.set("v", "<", "<gv", keymap_opts)
vim.keymap.set("v", ">", ">gv", keymap_opts)
vim.keymap.set({"n", "v"}, "n", "nzzzv", keymap_opts)
vim.keymap.set({"n", "v"}, "N", "Nzzzv", keymap_opts)
vim.keymap.set({"n", "v"}, "<leader>lf", vim.lsp.buf.format, keymap_opts)
local function _2_()
  return vim.cmd("tabnext")
end
vim.keymap.set("n", "<leader>>", _2_, keymap_opts)
local function _3_()
  return vim.cmd("tabprevious")
end
return vim.keymap.set("n", "<leader><", _3_, keymap_opts)
