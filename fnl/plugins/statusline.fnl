(import-macros {: tx} :config.macros)

[; (tx :adelarsq/neoline.vim)
 (tx :sschleemilch/slimline.nvim
     {:opts {:style :fg
             :bold true
             :configs {:path {:hl {:primary :label}}
                       :git {:hl {:primary :Function}}
                       :filetype_lsp {:hl {:primary :String}}}}})]

; minimal
; {:style :fg :spaces {:components "" :left "" :right ""}
