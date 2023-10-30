local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = "neovim/nvim-lspconfig"
}

function M.config()
  local mason = require "mason-lspconfig"
  local lspconfig = require "lspconfig"
  local ts_tools = require "typescript-tools"
  local lspkind = require "lspkind"
  local opts = require "config.services.lsp.server_opts"

  local cmp = require "cmp"
  local icons = require "config.visual.icons"
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  opts.diagnostics()

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" })
    }),
    sources = cmp.config.sources({
      {
        name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
          if kind == "Text" then
            return false
          end
          return true
        end
      },
      { name = "path" }
    }),
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        before = function (entry, vim_item)
          return vim_item
        end
      })
    }
  })

  mason.setup({
    ensure_installed = {
      "lua_ls",
    }
  })
  lspconfig.lua_ls.setup({
    on_attach = opts.on_attach,
    capabilities = capabilities
    -- coq.lsp_ensure_capabilities()
  })
  ts_tools.setup({
    on_attach = opts.on_attach,
    settings = {
      include_completions_with_insert_text = false
    },
    capabilities = capabilities
    -- coq.lsp_ensure_capabilities()
  })
  -- require "config.services.lsp.coq_settings"
  -- vim.cmd('COQnow -s')

end

return M
