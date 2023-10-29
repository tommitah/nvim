local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = "neovim/nvim-lspconfig"
}

function M.config()
  local mason = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local ts_tools = require("typescript-tools")
  local coq = require("coq")
  local opts = require("config.services.lsp.server_opts")

  opts.diagnostics()

  mason.setup({
    ensure_installed = {
      "lua_ls",
    }
  })
  lspconfig.lua_ls.setup({
    on_attach = opts.on_attach,
    coq.lsp_ensure_capabilities()
  })
  ts_tools.setup({
    on_attach = opts.on_attach,
    settings = {
      include_completions_with_insert_text = false
    },
    coq.lsp_ensure_capabilities()
  })
  require "config.services.lsp.coq_settings"
  vim.cmd('COQnow -s')
end

return M
