-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  vim.cmd("set background=dark")
  vim.cmd.colorscheme("alabaster")
  for _, group in ipairs({"Normal", "NormalNC", "SignColumn", "EndOfBuffer"}) do
    vim.api.nvim_set_hl(0, group, {bg = "none"})
  end
  vim.api.nvim_set_hl(0, "LineNr", {bg = "none", fg = "#3d3d3d"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#26343a"})
  vim.api.nvim_set_hl(0, "FloatBorder", {bg = "#26343a", fg = "#3d4f57"})
  vim.api.nvim_set_hl(0, "Whitespace", {fg = "#2e3a3c"})
  for _, group in ipairs({"String", "TSString", "@string", "@AlabasterString"}) do
    vim.api.nvim_set_hl(0, group, {bg = "#1d292b", fg = "#95cb82"})
  end
  for _, group in ipairs({"Comment", "TSComment", "@comment"}) do
    vim.api.nvim_set_hl(0, group, {bg = "#2b2a1d", fg = "#dfdf8e"})
  end
  for _, group in ipairs({"@AlabasterDefinition", "@lsp.typemod.function.definition", "@lsp.typemod.function.declaration", "@lsp.typemod.method.declaration"}) do
    local hl = vim.api.nvim_get_hl(0, {name = group, link = false})
    hl.bg = "#1d252b"
    vim.api.nvim_set_hl(0, group, hl)
  end
  for _, group in ipairs({"Delimiter", "TSPunctBracket", "TSPunctDelimiter", "@punctuation.bracket", "@punctuation.delimiter"}) do
    vim.api.nvim_set_hl(0, group, {fg = "#5c5c5c"})
  end
  for _, group in ipairs({"@keyword.coroutine", "@function.macro", "@lsp.type.macro.clojure"}) do
    vim.api.nvim_set_hl(0, group, {link = "@keyword.operator"})
  end
  return nil
end
return {{"brenoprata10/nvim-highlight-colors"}, {"dchinmay2/alabaster.nvim", init = _1_}}
