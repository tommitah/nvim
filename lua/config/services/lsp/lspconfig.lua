local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip"
  }
}

function M.config()
  local mason = require "mason-lspconfig"
  local lspconfig = require "lspconfig"
  local ts_tools = require "typescript-tools"
  local lspkind = require "lspkind"
  local luasnip = require "luasnip"
  local opts = require "config.services.lsp.server_opts"

  local cmp = require "cmp"
  local icons = require "config.visual.icons"
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  opts.diagnostics()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace
      }),
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
      { name = "path" },
      { name = "luasnip" }
    }),
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        before = function(entry, vim_item)
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
