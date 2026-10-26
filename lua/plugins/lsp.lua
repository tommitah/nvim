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
local function _5_(args)
  local client = _G.vim.lsp.get_client_by_id(args.data.client_id)
  if client then
    if (client.name == "ruff") then
      client.server_capabilities.hoverProvider = false
      return nil
    else
      return nil
    end
  else
    return nil
  end
end
_G.vim.api.nvim_create_autocmd("LspAttach", {group = _G.vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", {clear = true}), callback = _5_, desc = "LSP: Disable hover capability from Ruff"})
local function _8_()
  _G.vim.lsp.enable({"lua_ls", "tsc", "marksman", "clojure_lsp", "jsonls", "fennel_language_server", "eslint", "basedpyright", "ruff"})
  _G.vim.lsp.config("lua_ls", {settings = {Lua = {workspace = {library = _G.vim.api.nvim_get_runtime_file("", true)}}}})
  _G.vim.lsp.config("fennel_language_server", {default_config = {settings = {fennel = {workspace = {library = _G.vim.api.nvim_get_runtime_file("", true)}, diagnostics = {globals = {"vim"}}}}}})
  _G.vim.lsp.config("ruff", {})
  _G.vim.lsp.config("basedpyright", {})
  _G.vim.lsp.config("tsgo", {})
  _G.vim.lsp.config("eslint", {})
  _G.vim.lsp.config("biome", {})
  _G.vim.lsp.config("marksman", {})
  _G.vim.lsp.config("jsonls", {})
  _G.vim.lsp.config("clojure_lsp", {})
  return _G.vim.lsp.config("fennel_language_server", {})
end
local function _9_()
  require("java").setup()
  _G.vim.lsp.config("jdtls", {settings = {java = {configuration = {runtimes = {{name = "JavaSE-1.8", path = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home", default = true}}}, import = {gradle = {java = {home = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"}}}}}})
  return _G.vim.lsp.enable("jdtls")
end
return {{"neovim/nvim-lspconfig", init = _8_}, {"mfussenegger/nvim-dap"}, {"saghen/blink.cmp", build = "cargo build --release", opts = {fuzzy = {implementation = "rust"}}, version = "1.*"}, {"JavaHello/spring-boot.nvim", dependencies = {{"nvim-java/nvim-java", config = _9_, dependencies = {{"MunifTanjim/nui.nvim"}, {"mfussenegger/nvim-dap"}}, ft = "java"}}, version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0"}}
