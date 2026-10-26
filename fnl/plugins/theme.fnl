(import-macros {: tx} :config.macros)

[(tx :rktjmp/lush.nvim)
 (tx :rebelot/kanagawa.nvim {:opts {:transparent true
                                    :compile true
                                    :background {;;:dark :wave
                                                 :dark :dragon}}
                             ; :init #(do
                             ;          (_G.vim.cmd "set background=dark")
                             ;          (_G.vim.cmd.colorscheme :kanagawa))
                             })
 (tx :zenbones-theme/zenbones.nvim ; {:init #(do
     ;           (set _G.vim.g.zenbones
     ;                {:lightness :dim :transparent_background true})
     ;           (_G.vim.cmd "set background=light") ; (_G.vim.cmd "set background=dark")
     ;           (_G.vim.cmd.colorscheme :zenbones))}
     )
 (tx :dchinmay2/alabaster.nvim
     {:init #(do
               (_G.vim.cmd "set background=dark")
               (_G.vim.cmd.colorscheme :alabaster)
               ;; alabaster has no config; force transparency by clearing
               ;; the background on the core groups after the scheme loads.
               (each [_ group (ipairs [:Normal
                                       :NormalNC
                                       :SignColumn
                                       :EndOfBuffer])]
                 (_G.vim.api.nvim_set_hl 0 group {:bg :none}))
               ;; Line numbers: transparent bg + a dim gray base color.
               (_G.vim.api.nvim_set_hl 0 :LineNr {:bg :none :fg "#3d3d3d"})
               ;; Floats (e.g. K hover docs): lighter bg so they stand out
               ;; from the transparent editor instead of blending in.
               (_G.vim.api.nvim_set_hl 0 :NormalFloat {:bg "#26343a"})
               (_G.vim.api.nvim_set_hl 0 :FloatBorder
                                       {:bg "#26343a" :fg "#3d4f57"})
               ;; listchars dots (space:⋅): dim gray so they're subtle.
               (_G.vim.api.nvim_set_hl 0 :Whitespace {:fg "#2e3a3c"})
               ;; Keep alabaster's normal string fg (#95cb82) but add a
               ;; subtle dark background to set strings apart.
               (each [_ group (ipairs [:String
                                       :TSString
                                       "@string"
                                       "@AlabasterString"])]
                 (_G.vim.api.nvim_set_hl 0 group {:bg "#1d292b" :fg "#95cb82"}))
               ;; Keep alabaster's normal comment fg (#dfdf8e) but add a
               ;; subtle darker yellow background.
               (each [_ group (ipairs [:Comment :TSComment "@comment"])]
                 (_G.vim.api.nvim_set_hl 0 group {:bg "#2b2a1d" :fg "#dfdf8e"}))
               ;; Function definitions: alabaster doesn't use `Function` for
               ;; these. Its queries capture definition names as
               ;; @AlabasterDefinition, and LSP semantic tokens use the
               ;; typemod groups, so the darker blue bg goes there. Merge
               ;; into the existing hl so alabaster's own fg is kept.
               (each [_ group (ipairs ["@AlabasterDefinition"
                                       "@lsp.typemod.function.definition"
                                       "@lsp.typemod.function.declaration"
                                       "@lsp.typemod.method.declaration"])]
                 (let [hl (_G.vim.api.nvim_get_hl 0 {:name group :link false})]
                   (set hl.bg "#1d252b")
                   (_G.vim.api.nvim_set_hl 0 group hl)))
               ;; Dim punctuation (brackets/delimiters: ().{}[] ,; etc.)
               ;; to a muted gray so it recedes from the code.
               (each [_ group (ipairs [:Delimiter
                                       :TSPunctBracket
                                       :TSPunctDelimiter
                                       "@punctuation.bracket"
                                       "@punctuation.delimiter"])]
                 (_G.vim.api.nvim_set_hl 0 group {:fg "#5c5c5c"}))
               ;; Coroutine keywords (await/async/yield) and macro *calls*
               ;; (clojure ->, let, doto, etc. captured as @function.macro;
               ;; this does NOT affect defmacro definitions) aren't styled by
               ;; alabaster; link them to @keyword.operator so they match
               ;; `new` (the muted teal-gray operator color).
               (each [_ group (ipairs ["@keyword.coroutine"
                                       "@function.macro"
                                       ;; LSP semantic token wins over treesitter (priority
                                       ;; 125 vs 100), so override it here too.
                                       "@lsp.type.macro.clojure"])]
                 (_G.vim.api.nvim_set_hl 0 group {:link "@keyword.operator"})))})
 (tx :maxmx03/solarized.nvim {:opts {:transparent {:enabled true}
                                     :palette :selenized
                                     :variant :summer}
                              ; :init #(do
                              ;          (_G.vim.cmd.colorscheme :solarized))
                              })
 (tx :vague2k/vague.nvim {:opts {:transparent true}
                          ; :init #(_G.vim.cmd.colorscheme :vague)
                          })
 (tx :brenoprata10/nvim-highlight-colors)
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
 (tx :folke/tokyonight.nvim {:opts {:style :storm :transparent true}
                             ; :init #(do
                             ;          (_G.vim.cmd "set background=dark")
                             ;          (_G.vim.cmd.colorscheme :tokyonight))
                             })]
