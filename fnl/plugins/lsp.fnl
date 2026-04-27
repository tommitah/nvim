(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

(_G.vim.keymap.set :n :K #(_G.vim.lsp.buf.hover {:border :rounded}) keymap-opts)

(_G.vim.keymap.set :n :gI _G.vim.lsp.buf.implementation keymap-opts)
(_G.vim.keymap.set :n :gd _G.vim.lsp.buf.definition keymap-opts)
(_G.vim.keymap.set :n :gr _G.vim.lsp.buf.references keymap-opts)
(_G.vim.keymap.set :n :gt _G.vim.lsp.buf.type_definition keymap-opts)
(_G.vim.keymap.set :n :rr _G.vim.lsp.buf.rename keymap-opts)
;; (_G.vim.keymap.set :n :<C-k> _G.vim.lsp.buf.signature_help keymap-opts)
(_G.vim.keymap.set :n :<C-n> #(_G.vim.diagnostic.jump {:count 1 :float true})
                   keymap-opts)

(_G.vim.keymap.set :n :<C-p> #(_G.vim.diagnostic.jump {:count -1 :float true})
                   keymap-opts)

(_G.vim.keymap.set [:n :v] :<leader>ca _G.vim.lsp.buf.code_action keymap-opts)

[(tx :neovim/nvim-lspconfig
     {:init (fn []
              (_G.vim.lsp.enable [:lua_ls
                                  ;; :ts_ls
                                  :tsgo
                                  ;; new go implementation of tsserver
                                  :marksman
                                  :clojure_lsp
                                  :jsonls
                                  :fennel_language_server
                                  :eslint
                                  :biome
                                  :jdtls
                                  ;; :rust_analyzer
                                  ;; :bacon_ls
                                  ])
              (_G.vim.lsp.config :lua_ls
                                 {:settings {:Lua {:workspace {:library (_G.vim.api.nvim_get_runtime_file ""
                                                                                                          true)}}}})
              (_G.vim.lsp.config :fennel_language_server
                                 {:default_config {:settings {:fennel {:workspace {:library (_G.vim.api.nvim_get_runtime_file ""
                                                                                                                              true)}
                                                                       :diagnostics {:globals [:vim]}}}}})
              ;; (_G.vim.lsp.config :ts_ls {})
              (_G.vim.lsp.config :tsgo {})
              (_G.vim.lsp.config :eslint {})
              (_G.vim.lsp.config :biome {})
              (_G.vim.lsp.config :marksman {})
              ;; (_G.vim.lsp.config :gopls {})
              ;; (_G.vim.lsp.config :rust_analyzer {})
              ;; (_G.vim.lsp.config :bacon_ls {})
              (_G.vim.lsp.config :jsonls {})
              (_G.vim.lsp.config :clojure_lsp {})
              (_G.vim.lsp.config :fennel_language_server {})
              (_G.vim.lsp.config :jdtls {}))})
 (tx :mfussenegger/nvim-dap)
 ;; remember to run 'cargo build --release' in the git dir for this plugin
 (tx :saghen/blink.cmp
     {:version :1.*
      :build "cargo build --release"
      :opts {:fuzzy {:implementation :rust}}})
 ; {:src (plug->git :JavaHello/spring-boot.nvim)
 ;  :version :218c0c26c14d99feca778e4d13f5ec3e8b1b60f0}
 ; {:src (plug->git :nvim-java/nvim-java)}
 ]
