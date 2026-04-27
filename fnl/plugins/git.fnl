(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

[(tx :f-person/git-blame.nvim
     {:event :VeryLazy
      :opts {:enabled false}
      :keys [(tx :<leader>gb ":GitBlameToggle<CR>" keymap-opts)]})
 (tx :sindrets/diffview.nvim)
 (tx :NeogitOrg/neogit {:keys [(tx :<leader>gg ":Neogit<CR>" keymap-opts)]})
 (tx :pwntester/octo.nvim {:dependencies [(tx :nvim-tree/nvim-web-devicons)]})]
