(import-macros {: tx} :config.macros)

; (_G.vim.cmd.colorscheme :habamax)

[(tx :rktjmp/lush.nvim)
 (tx :ntk148v/habamax.nvim ; {:init #(do
     ;           (_G.vim.cmd.colorscheme :habamax.nvim))}
     )
 (tx :ember-theme/nvim {:opts {:transparent true}
                        ; :init #(do
                        ;          (_G.vim.cmd.colorscheme :ember))
                        })
 (tx :rebelot/kanagawa.nvim
     {:opts {:transparent true
             :compile true
             :background {;;:dark :wave
                          :dark :dragon}}
      :init #(do
               (_G.vim.cmd "set background=dark")
               (_G.vim.cmd.colorscheme :kanagawa))})
 (tx :Alligator/accent.vim)
 (tx :zenbones-theme/zenbones.nvim ; {:init #(do
     ;           (set _G.vim.g.zenbones
     ;                {:lightness :dim :transparent_background true})
     ;           (_G.vim.cmd "set background=light") ; (_G.vim.cmd "set background=dark")
     ;           (_G.vim.cmd.colorscheme :zenbones))}
     )
 (tx :maxmx03/solarized.nvim
     {:opts {:transparent {:enabled true} :palette :selenized :variant :summer}})
 (tx :rose-pine/neovim)
 (tx :vague2k/vague.nvim {:opts {:transparent true}
                          ; :init #(_G.vim.cmd.colorscheme :vague)
                          })
 (tx :brenoprata10/nvim-highlight-colors)
 (tx :AlexvZyl/nordic.nvim {:opts {:transparent {:bg true}}
                            ; :init #(do
                            ;          (_G.vim.cmd.colorscheme :nordic))
                            })
 (tx :savq/melange-nvim)
 (tx :neanias/everforest-nvim ; {:config (fn []
     ;            ((. (require :everforest) :setup) {:background :medium
     ;                                               :transparent_background_level 2}))
     ;  :init #(do
     ;           (_G.vim.cmd "set background=light")
     ;           (. (require :everforest) :load))})
     )
 (tx :kungfusheep/mfd.nvim ; {:init #(do
     ;           (_G.vim.cmd.colorscheme :mfd))}
     )
 (tx :webhooked/kanso.nvim {:opts {:transparent true
                                   :compile true
                                   :background {:dark :mist :light :pearl}}
                            ; :init #(do
                            ;          (_G.vim.cmd "set background=dark")
                            ;          (_G.vim.cmd.colorscheme :kanso-mist))
                            })
 (tx :aymenhafeez/doric-themes.nvim ; {:init #(do
     ;           (_G.vim.cmd.colorscheme :doric-oak))}
     )
 (tx :folke/tokyonight.nvim {:opts {:style :storm :transparent true}
                             ; :init #(do
                             ;          (_G.vim.cmd.colorscheme :tokyonight))
                             })
 ; (tx :ellisonleao/gruvbox.nvim
 ;     {:opts {:transparent_mode true}
 ;      :init #(do
 ;               (_G.vim.cmd "set background=dark")
 ;               (_G.vim.cmd.colorscheme :gruvbox))})
 (tx :sainnhe/gruvbox-material ; {:init #(do
     ;           (_G.vim.cmd "set background=dark")
     ;           (_G.vim.cmd.colorscheme :gruvbox-material))}
     )]
