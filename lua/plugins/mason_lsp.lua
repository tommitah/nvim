-- lsp
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "tailwindcss",
        "jsonls",
        "rust_analyzer",
    },
})

local icons = require("plugins.icons")
require("lsp_config").setup()
local on_attach = require("lsp_config").on_attach
local capabilities = require("lsp_config").capabilities

-- for JS/TS
local typescript_tools = require("typescript-tools")
typescript_tools.setup({
    on_attach = on_attach
})
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
-- require("lspconfig").tailwindcss.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
-- })
require("lspconfig").eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end
})
require("lspconfig").jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- completion
local cmp = require("cmp")
local luasnip = require("luasnip")
local kind_icons = icons.kind

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        -- ROUND BORDERS ON COMPLETION
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<S-TAB>"] = cmp.mapping.select_prev_item(),
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-s>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    }),
    formatting = {
        format = require("lspkind").cmp_format(),
        -- formatting = {
        --   fields = { "kind", "abbr", "menu" },
        --    format = function(entry, vim_item)
        --      -- Kind icons
        --      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        --
        --      if entry.source.name == "cmp_tabnine" then
        --        -- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
        --        -- menu = entry.completion_item.data.detail .. " " .. menu
        --        -- end
        --        vim_item.kind = icons.misc.Robot
        --      end
        --      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        --      -- NOTE: order matters
        --      vim_item.menu = ({
        --        nvim_lsp = "[LSP]",
        --        nvim_lua = "[Nvim]",
        --        luasnip = "[Snippet]",
        --        buffer = "[Buffer]",
        --        path = "[Path]",
        --
        --        -- nvim_lsp = "",
        --        -- nvim_lua = "",
        --        -- luasnip = "",
        --        -- buffer = "",
        --        -- path = "",
        --        -- emoji = "",
        --      })[entry.source.name]
        --      return vim_item
        --    end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "cmp_tabnine" },
        { name = "path" },
        { name = "crates" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        -- ghost_text = true,
        -- native_menu = true,
    },
})

require("lsp_signature").setup({
    bind = true,
    hint_prefix = "$ ",
    floating_window = false,
    handler_opts = {
        border = "rounded",
    },
})
