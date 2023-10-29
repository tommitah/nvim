-- lsp
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        -- "tsserver",
        "tailwindcss",
        "jsonls",
        "rust_analyzer",
        "gopls",
    },
})

local icons = require("plugins.icons")
require("lsp_config").setup()
local on_attach = require("lsp_config").on_attach
local capabilities = require("lsp_config").capabilities
local coq = require("coq")


-- for JS/TS
local typescript_tools = require("typescript-tools")
typescript_tools.setup({
    on_attach = on_attach,
    settings = {
        include_completions_with_insert_text = false
    },
    coq.lsp_ensure_capabilities()
})
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    coq.lsp_ensure_capabilities()
})
require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    coq.lsp_ensure_capabilities()
})
require("lspconfig").jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    coq.lsp_ensure_capabilities()
})
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    coq.lsp_ensure_capabilities()
})
require("lspconfig").ocamllsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    coq.lsp_ensure_capabilities()
})

vim.g.coq_settings = {
    keymap = {
        -- recommended = false,
        jump_to_mark = "<C-s>"
    },
    clients = {
        paths = {
            path_seps = { "/" },
        },
        buffers = { match_syms = true },
    },
    -- ["display.pum.y_max_len"] = 2,
    display = {
        pum = {
            y_max_len = 5,
        },
    }
}

vim.cmd('COQnow -s')

-- completion
-- local cmp = require("cmp")
-- local kind_icons = icons.kind
--
-- local check_backspace = function()
--     local col = vim.fn.col(".") - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
--
-- cmp.setup({
--     window = {
--         -- ROUND BORDERS ON COMPLETION
--         -- completion = cmp.config.window.bordered(),
--         -- documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--         ["<S-TAB>"] = cmp.mapping.select_prev_item(),
--         ["<TAB>"] = cmp.mapping.select_next_item(),
--         ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--         ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--         ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--         -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         ["<C-e>"] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close(),
--         }),
--         -- Accept currently selected item. If none selected, `select` first item.
--         -- Set `select` to `false` to only confirm explicitly selected items.
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-s>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif check_backspace() then
--                 fallback()
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--     }),
--     formatting = {
--         format = require("lspkind").cmp_format(),
--     },
--     sources = {
--         { name = "nvim_lsp" },
--         { name = "nvim_lua" },
--         { name = "cmp_tabnine" },
--         { name = "path" },
--         { name = "crates" },
--     },
--     confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false,
--     },
-- })
