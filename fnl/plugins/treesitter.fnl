(import-macros {: tx} :config.macros)

(vim.api.nvim_create_autocmd :FileType
                             {:pattern ["*"]
                              :callback #(vim.schedule #(pcall #(vim.treesitter.start)))})

[(tx :nvim-treesitter/nvim-treesitter
     {:main :nvim-treesitter.configs
      :branch :main
      :build ":TSUpdate"
      :config (fn []
                (let [ts (require :nvim-treesitter)
                      languages [:rust
                                 :vimdoc
                                 :lua
                                 :json
                                 :markdown
                                 :markdown_inline
                                 :javascript
                                 :typescript
                                 :tsx
                                 :html
                                 :yaml
                                 :python
                                 :clojure
                                 :java
                                 :fennel]]
                  (ts.install languages)))})
 (tx :windwp/nvim-ts-autotag)]
