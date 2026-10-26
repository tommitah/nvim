(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

[(tx :f-person/git-blame.nvim
     {:event :VeryLazy
      :opts {:enabled false}
      :keys [(tx :<leader>gb ":GitBlameToggle<CR>" keymap-opts)]})
 (tx :NeogitOrg/neogit
     {:dependencies [(tx :sindrets/diffview.nvim
                         {:cmd [:DiffviewOpen
                                :DiffviewFileHistory
                                :DiffviewClose
                                :DiffviewToggleFiles
                                :DiffviewFocusFiles
                                :DiffviewRefresh]})]
      :keys [(tx :<leader>gg ":Neogit<CR>" keymap-opts)]})
 (tx :justinmk/guh.nvim)]
