-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  _G.vim.cmd("set background=dark")
  _G.vim.cmd.colorscheme("alabaster")
  for _, group in ipairs({"Normal", "NormalNC", "SignColumn", "EndOfBuffer"}) do
    _G.vim.api.nvim_set_hl(0, group, {bg = "none"})
  end
  _G.vim.api.nvim_set_hl(0, "LineNr", {bg = "none", fg = "#3d3d3d"})
  _G.vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#26343a"})
  _G.vim.api.nvim_set_hl(0, "FloatBorder", {bg = "#26343a", fg = "#3d4f57"})
  _G.vim.api.nvim_set_hl(0, "Whitespace", {fg = "#2e3a3c"})
  for _, group in ipairs({"String", "TSString", "@string", "@AlabasterString"}) do
    _G.vim.api.nvim_set_hl(0, group, {bg = "#1d292b", fg = "#95cb82"})
  end
  for _, group in ipairs({"Comment", "TSComment", "@comment"}) do
    _G.vim.api.nvim_set_hl(0, group, {bg = "#2b2a1d", fg = "#dfdf8e"})
  end
  for _, group in ipairs({"@AlabasterDefinition", "@lsp.typemod.function.definition", "@lsp.typemod.function.declaration", "@lsp.typemod.method.declaration"}) do
    local hl = _G.vim.api.nvim_get_hl(0, {name = group, link = false})
    hl.bg = "#1d252b"
    _G.vim.api.nvim_set_hl(0, group, hl)
  end
  for _, group in ipairs({"Delimiter", "TSPunctBracket", "TSPunctDelimiter", "@punctuation.bracket", "@punctuation.delimiter"}) do
    _G.vim.api.nvim_set_hl(0, group, {fg = "#5c5c5c"})
  end
  for _, group in ipairs({"@keyword.coroutine", "@function.macro", "@lsp.type.macro.clojure"}) do
    _G.vim.api.nvim_set_hl(0, group, {link = "@keyword.operator"})
  end
  return nil
end
return {{"rktjmp/lush.nvim"}, {"rebelot/kanagawa.nvim", opts = {transparent = true, compile = true, background = {dark = "dragon"}}}, {"zenbones-theme/zenbones.nvim"}, {"dchinmay2/alabaster.nvim", init = _1_}, {"maxmx03/solarized.nvim", opts = {transparent = {enabled = true}, palette = "selenized", variant = "summer"}}, {"vague2k/vague.nvim", opts = {transparent = true}}, {"brenoprata10/nvim-highlight-colors"}, {"kungfusheep/mfd.nvim"}, {"webhooked/kanso.nvim", opts = {transparent = true, compile = true, background = {dark = "mist", light = "pearl"}}}, {"folke/tokyonight.nvim", opts = {style = "storm", transparent = true}}}
