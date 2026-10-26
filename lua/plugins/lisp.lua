-- [nfnl] fnl/plugins/lisp.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
local function _2_()
  vim.g["conjure#mapping#doc_word"] = false
  return nil
end
local function _3_()
  return require("nvim-paredit"):setup()
end
return {{"Olical/nfnl"}, {"Olical/conjure", event = "VeryLazy", init = _2_, keys = {{"<leader>re", "<cmd>ConjureEval (user/reload)<cr>", keymap_opts}}}, {"tpope/vim-dispatch"}, {"radenling/vim-dispatch-neovim"}, {"julienvincent/nvim-paredit", config = _3_}, {"clojure-vim/vim-jack-in"}}
