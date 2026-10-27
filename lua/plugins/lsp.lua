-- [nfnl] fnl/plugins/lsp.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
local function _2_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _2_, keymap_opts)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, keymap_opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, keymap_opts)
vim.keymap.set("n", "rr", vim.lsp.buf.rename, keymap_opts)
local function _3_()
  return vim.diagnostic.jump({count = 1, float = true})
end
vim.keymap.set("n", "<C-n>", _3_, keymap_opts)
local function _4_()
  return vim.diagnostic.jump({count = -1, float = true})
end
vim.keymap.set("n", "<C-p>", _4_, keymap_opts)
vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, keymap_opts)
local function _5_(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
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
vim.api.nvim_create_autocmd("LspAttach", {group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", {clear = true}), callback = _5_, desc = "LSP: Disable hover capability from Ruff"})
local function _8_()
  vim.lsp.enable({"lua_ls", "tsc", "marksman", "clojure_lsp", "jsonls", "fennel_ls", "eslint", "basedpyright", "ruff"})
  vim.lsp.config("lua_ls", {settings = {Lua = {workspace = {library = vim.api.nvim_get_runtime_file("", true)}}}})
  vim.lsp.config("ruff", {})
  vim.lsp.config("basedpyright", {})
  vim.lsp.config("eslint", {})
  vim.lsp.config("marksman", {})
  vim.lsp.config("jsonls", {})
  return vim.lsp.config("clojure_lsp", {})
end
local function _9_()
  require("java").setup()
  vim.lsp.config("jdtls", {settings = {java = {configuration = {runtimes = {{name = "JavaSE-1.8", path = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home", default = true}}}, import = {gradle = {java = {home = "/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"}}}}}})
  return vim.lsp.enable("jdtls")
end
return {{"neovim/nvim-lspconfig", init = _8_}, {"mfussenegger/nvim-dap"}, {"saghen/blink.cmp", build = "cargo build --release", opts = {fuzzy = {implementation = "rust"}}, version = "1.*"}, {"JavaHello/spring-boot.nvim", dependencies = {{"nvim-java/nvim-java", config = _9_, dependencies = {{"MunifTanjim/nui.nvim"}, {"mfussenegger/nvim-dap"}}, ft = "java"}}, version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0"}}
