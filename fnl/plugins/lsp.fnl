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

(_G.vim.api.nvim_create_autocmd :LspAttach
                                {:group (_G.vim.api.nvim_create_augroup :lsp_attach_disable_ruff_hover
                                                                        {:clear true})
                                 :callback (fn [args]
                                             (let [client (_G.vim.lsp.get_client_by_id args.data.client_id)]
                                               (when client
                                                 (when (= client.name :ruff)
                                                   ;; Disable hover in favor of Pyright
                                                   (set client.server_capabilities.hoverProvider
                                                        false)))))
                                 :desc "LSP: Disable hover capability from Ruff"})

[(tx :neovim/nvim-lspconfig
     {:init (fn []
              (_G.vim.lsp.enable [:lua_ls
                                  :tsc
                                  ;; :ts_ls
                                  ;; :tsgo
                                  ; :oxlint
                                  ;; new go implementation of tsserver
                                  :marksman
                                  :clojure_lsp
                                  :jsonls
                                  :fennel_language_server
                                  :eslint
                                  :basedpyright
                                  :ruff
                                  ; :biome
                                  ;; :jdtls is owned by nvim-java (see its config below)
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
              (_G.vim.lsp.config :ruff {})
              (_G.vim.lsp.config :basedpyright {})
              (_G.vim.lsp.config :tsgo {}) ; (_G.vim.lsp.config :oxlint {})
              (_G.vim.lsp.config :eslint {})
              (_G.vim.lsp.config :biome {})
              (_G.vim.lsp.config :marksman {})
              ;; (_G.vim.lsp.config :gopls {})
              ;; (_G.vim.lsp.config :rust_analyzer {})
              ;; (_G.vim.lsp.config :bacon_ls {})
              (_G.vim.lsp.config :jsonls {})
              (_G.vim.lsp.config :clojure_lsp {})
              (_G.vim.lsp.config :fennel_language_server {}))})
 (tx :mfussenegger/nvim-dap)
 ;; remember to run 'cargo build --release' in the git dir for this plugin
 (tx :saghen/blink.cmp
     {:version :1.*
      :build "cargo build --release"
      :opts {:fuzzy {:implementation :rust}}})
 (tx :JavaHello/spring-boot.nvim
     {:version :218c0c26c14d99feca778e4d13f5ec3e8b1b60f0
      :dependencies [(tx :nvim-java/nvim-java
                         {:ft :java
                          :dependencies [(tx :MunifTanjim/nui.nvim)
                                         (tx :mfussenegger/nvim-dap)]
                          :config (fn []
                                    ;; nvim-java owns jdtls. It runs JDTLS 1.54 on its own
                                    ;; bundled OpenJDK 25 (required to *launch* the server).
                                    ((. (require :java) :setup))
                                    ;; JDTLS runs on OpenJDK 25, but this project uses
                                    ;; Gradle 4.4 which only runs on Java 8. nvim-java forces
                                    ;; JAVA_HOME=OpenJDK25 into the env, so we must explicitly
                                    ;; point the Gradle importer at Zulu 8. The runtime entry
                                    ;; (JavaSE-1.8) sets the compile/target JDK; the
                                    ;; import.gradle.java.home sets the JVM that runs Gradle.
                                    (_G.vim.lsp.config :jdtls
                                                       {:settings {:java {:configuration {:runtimes [{:name :JavaSE-1.8
                                                                                                      :path :/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
                                                                                                      :default true}]}
                                                                          :import {:gradle {:java {:home :/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home}}}}}})
                                    (_G.vim.lsp.enable :jdtls))})]})
 ; {:src (plug->git :JavaHello/spring-boot.nvim)
 ;  :version :218c0c26c14d99feca778e4d13f5ec3e8b1b60f0}
 ; {:src (plug->git :nvim-java/nvim-java)}
 ]
