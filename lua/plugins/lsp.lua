-- [nfnl] fnl/plugins/lsp.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
local function _2_()
  return _G.vim.lsp.buf.hover({border = "rounded"})
end
_G.vim.keymap.set("n", "K", _2_, keymap_opts)
_G.vim.keymap.set("n", "gI", _G.vim.lsp.buf.implementation, keymap_opts)
_G.vim.keymap.set("n", "gd", _G.vim.lsp.buf.definition, keymap_opts)
_G.vim.keymap.set("n", "gr", _G.vim.lsp.buf.references, keymap_opts)
_G.vim.keymap.set("n", "gt", _G.vim.lsp.buf.type_definition, keymap_opts)
_G.vim.keymap.set("n", "rr", _G.vim.lsp.buf.rename, keymap_opts)
local function _3_()
  return _G.vim.diagnostic.jump({count = 1, float = true})
end
_G.vim.keymap.set("n", "<C-n>", _3_, keymap_opts)
local function _4_()
  return _G.vim.diagnostic.jump({count = -1, float = true})
end
_G.vim.keymap.set("n", "<C-p>", _4_, keymap_opts)
_G.vim.keymap.set({"n", "v"}, "<leader>ca", _G.vim.lsp.buf.code_action, keymap_opts)
local function _5_()
  _G.vim.lsp.enable({"lua_ls", "tsgo", "marksman", "clojure_lsp", "jsonls", "fennel_language_server", "eslint", "biome", "jdtls"})
  _G.vim.lsp.config("lua_ls", {settings = {Lua = {workspace = {library = _G.vim.api.nvim_get_runtime_file("", true)}}}})
  _G.vim.lsp.config("fennel_language_server", {default_config = {settings = {fennel = {workspace = {library = _G.vim.api.nvim_get_runtime_file("", true)}, diagnostics = {globals = {"vim"}}}}}})
  _G.vim.lsp.config("tsgo", {})
  _G.vim.lsp.config("eslint", {})
  _G.vim.lsp.config("biome", {})
  _G.vim.lsp.config("marksman", {})
  _G.vim.lsp.config("jsonls", {})
  _G.vim.lsp.config("clojure_lsp", {})
  _G.vim.lsp.config("fennel_language_server", {})
  return _G.vim.lsp.config("jdtls", {})
end
return {{"neovim/nvim-lspconfig", init = _5_}, {"mfussenegger/nvim-dap"}, {"saghen/blink.cmp", build = "cargo build --release", opts = {fuzzy = {implementation = "rust"}}, version = "1.*"}}
