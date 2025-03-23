local add, now = MiniDeps.add, MiniDeps.now

local plugs = {
  { source = 'stevearc/conform.nvim' }
}

for _, plug in ipairs(plugs) do
  add(plug)
end

now(function()
  vim.g.disable_autoformat = false

  require('conform').setup({
    formatters = {
      prettierd = {
        require_cwd = true
      },
    },
    formatters_by_ft = {
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    },
    format_on_save = function (bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end
  })
end)
