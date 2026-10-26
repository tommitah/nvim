(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

[(tx :Olical/nfnl)
 (tx :Olical/conjure {:event :VeryLazy
                      :init #(tset _G.vim.g "conjure#mapping#doc_word" false)
                      :keys [(tx :<leader>re
                                 "<cmd>ConjureEval (user/reload)<cr>"
                                 keymap-opts)]})
 (tx :tpope/vim-dispatch)
 (tx :radenling/vim-dispatch-neovim)
 (tx :julienvincent/nvim-paredit {:config #(: (require :nvim-paredit) :setup)})
 (tx :clojure-vim/vim-jack-in)]
