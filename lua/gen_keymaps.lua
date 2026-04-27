-- [nfnl] fnl/gen_keymaps.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
_G.vim.keymap.set("", "<Space>", "<Nop>", keymap_opts)
_G.vim.g.mapleader = " "
_G.vim.g.maplocalleader = " "
_G.vim.keymap.set("n", "<leader>so", ":update<CR> :source<CR>")
_G.vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", keymap_opts)
_G.vim.keymap.set("v", "<C-K>", ":m '>-2<CR>gv=gv", keymap_opts)
_G.vim.keymap.set("v", "<", "<gv", keymap_opts)
_G.vim.keymap.set("v", ">", ">gv", keymap_opts)
_G.vim.keymap.set({"n", "v"}, "n", "nzzzv", keymap_opts)
_G.vim.keymap.set({"n", "v"}, "N", "Nzzzv", keymap_opts)
_G.vim.keymap.set({"n", "v"}, "<leader>lf", _G.vim.lsp.buf.format, keymap_opts)
local function _2_()
  return _G.vim.cmd("tabnext")
end
_G.vim.keymap.set("n", "<leader>>", _2_, keymap_opts)
local function _3_()
  return _G.vim.cmd("tabprevious")
end
return _G.vim.keymap.set("n", "<leader><", _3_, keymap_opts)
