local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = "neovim/nvim-lspconfig"
}

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
end

local diagnostics = function()
  local icons = require("config.visual.icons")
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config({
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

function M.config()
  local mason = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local typescript_tools = require("typescript-tools")
  local coq = require("coq")
  diagnostics()

  mason.setup({
    ensure_installed = {
      "lua_ls",
    }
  })
  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    coq.lsp_ensure_capabilities()
  })
  typescript_tools.setup({
    on_attach = on_attach,
    settings = {
      include_completions_with_insert_text = false
    },
    coq.lsp_ensure_capabilities()
  })
  vim.g.coq_settings = {
    keymap = { jump_to_mark = "<C-s>" },
    clients = {
      paths = {
        path_seps = { "/" },
      },
      buffers = { match_syms = true },
    },
    display = {
      pum = {
        y_max_len = 5,
      },
    }
  }
  vim.cmd('COQnow -s')
end

return M
