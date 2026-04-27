-- [nfnl] fnl/plugins/lisp.fnl
local function _1_()
  _G.vim.g["conjure#mapping#doc_word"] = false
  return nil
end
local function _2_()
  return require("nvim-paredit"):setup()
end
return {{"Olical/nfnl"}, {"Olical/conjure", event = "VeryLazy", init = _1_}, {"tpope/vim-dispatch"}, {"radenling/vim-dispatch-neovim"}, {"julienvincent/nvim-paredit", config = _2_}, {"clojure-vim/vim-jack-in"}}
