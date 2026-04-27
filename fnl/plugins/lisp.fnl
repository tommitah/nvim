(import-macros {: tx} :config.macros)

[(tx :Olical/nfnl)
 (tx :Olical/conjure
     {:event :VeryLazy :init #(tset _G.vim.g "conjure#mapping#doc_word" false)})
 (tx :tpope/vim-dispatch)
 (tx :radenling/vim-dispatch-neovim)
 (tx :julienvincent/nvim-paredit {:config #(: (require :nvim-paredit) :setup)})
 (tx :clojure-vim/vim-jack-in)]
