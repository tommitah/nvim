(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

[;; IMPORTANT to load this plugin in `lazy.lua` if using lazy package manager.
 ;; Otherwise we don't have access to nfnl modules like autoload.
 ;; Left it here so I'll remember it next time if I want to migrate to the builtin one again.
 (tx :Olical/nfnl)
 (tx :Olical/conjure {:event :VeryLazy
                      :init #(set vim.g.conjure#mapping#doc_word false)
                      :keys [(tx :<leader>re
                                 "<cmd>ConjureEval (user/reload)<cr>"
                                 keymap-opts)]})
 (tx :tpope/vim-dispatch)
 (tx :radenling/vim-dispatch-neovim)
 (tx :julienvincent/nvim-paredit {:config #(: (require :nvim-paredit) :setup)})
 (tx :clojure-vim/vim-jack-in)]
