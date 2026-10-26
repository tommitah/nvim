(import-macros {: tx} :config.macros)

[(tx :nvim-neotest/neotest {:dependencies [;; basic deps
                                           (tx :nvim-neotest/nvim-nio)
                                           (tx :antoinemadec/FixCursorHold.nvim)
                                           ;; test runners
                                           (tx :adrigzr/neotest-mocha)
                                           (tx :marilari88/neotest-vitest)]
                            :opts {:adapters {:neotest-vitest {}
                                              :neotest-mocha {:command "npm test --"}}
                                   ; :adapters [(: (require :neotest-vitest) :setup)
                                   ;            (: (require :neotest-mocha) :setup)]
                                   }})]
