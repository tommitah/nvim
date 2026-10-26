-- [nfnl] fnl/plugins/ai.fnl
local function _1_()
  return require("opencode").setup({ui = {window_width = 1, position = "current", use_vim_ui_select = true}})
end
return {{"sudo-tee/opencode.nvim", cmd = {"Opencode"}, config = _1_, dependencies = {{"nvim-lua/plenary.nvim"}, {"MeanderingProgrammer/render-markdown.nvim", ft = {"markdown", "Avante", "copilot-chat", "opencode_output"}, opts = {anti_conceal = {enabled = false}, file_types = {"markdown", "opencode_output"}}}, {"saghen/blink.cmp"}, {"ibhagwan/fzf-lua"}}, opts = {ui = {window_width = 1}}}}
