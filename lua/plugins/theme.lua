-- [nfnl] fnl/plugins/theme.fnl
local function _1_()
  _G.vim.cmd("set background=dark")
  return _G.vim.cmd.colorscheme("kanagawa")
end
return {{"rktjmp/lush.nvim"}, {"ntk148v/habamax.nvim"}, {"ember-theme/nvim", opts = {transparent = true}}, {"rebelot/kanagawa.nvim", init = _1_, opts = {transparent = true, compile = true, background = {dark = "dragon"}}}, {"Alligator/accent.vim"}, {"zenbones-theme/zenbones.nvim"}, {"maxmx03/solarized.nvim", opts = {transparent = {enabled = true}, palette = "selenized", variant = "summer"}}, {"rose-pine/neovim"}, {"vague2k/vague.nvim", opts = {transparent = true}}, {"brenoprata10/nvim-highlight-colors"}, {"AlexvZyl/nordic.nvim", opts = {transparent = {bg = true}}}, {"savq/melange-nvim"}, {"neanias/everforest-nvim"}, {"kungfusheep/mfd.nvim"}, {"webhooked/kanso.nvim", opts = {transparent = true, compile = true, background = {dark = "mist", light = "pearl"}}}, {"aymenhafeez/doric-themes.nvim"}, {"folke/tokyonight.nvim", opts = {style = "storm", transparent = true}}, {"sainnhe/gruvbox-material"}}
