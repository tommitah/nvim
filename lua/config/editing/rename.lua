local M = {
  "smjonas/inc-rename.nvim"
}

function M.config()
  require("inc_rename").setup()
  vim.keymap.set("n", "rr", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true })
end

return M
