(import-macros {: tx} :config.macros)

[; (tx :nvim-mini/mini.statusline
 ;     {:config #(: (require :mini.statusline) :setup)})
 (tx :nvim-mini/mini-git {:config #(: (require :mini.git) :setup)})
 (tx :nvim-mini/mini.pairs {:config #(: (require :mini.pairs) :setup)})
 (tx :nvim-mini/mini.diff {:config #(: (require :mini.diff) :setup)})
 (tx :nvim-mini/mini.cmdline {:config #(: (require :mini.cmdline) :setup)})]
