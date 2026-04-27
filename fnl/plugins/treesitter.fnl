(import-macros {: tx} :config.macros)

(_G.vim.api.nvim_create_autocmd :FileType
                                {:pattern ["*"]
                                 :callback #(_G.vim.schedule #(pcall #(_G.vim.treesitter.start)))})

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
                                 :clojure
                                 :java
                                 :fennel]]
                  (ts.install languages)))})
 (tx :windwp/nvim-ts-autotag)]
