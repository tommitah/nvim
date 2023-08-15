local M = {}

M.setup = function()
    local icons = require("plugins.icons")
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
        -- virtual_text = true,
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

    -- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    -- 	border = 'rounded'
    -- })
    --
    -- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    -- 	border = 'rounded'
    -- })
end

M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set("n", "rr", function()
    -- 	return ":IncRename " .. vim.fn.expand("<cword>")
    -- end, { expr = true })
    vim.keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
    -- vim.keymap.set("n", "rr", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>fr", "<cmd>Lspsaga lsp_finder<CR>", opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", ":TroubleToggle<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

    -- virtual text shows types
    -- require("virtualtypes").on_attach()
end

-- FOR CMP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

function M.enable_format_on_save()
    vim.cmd([[
	augroup format_on_save
	  autocmd!
	  autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
	augroup end
	]])
    vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
    if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
        vim.cmd("au! " .. name)
    end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("lsp_config").toggle_format_on_save()' ]])

return M
