(import-macros {: tx} :config.macros)
(local {: autoload} (require :nfnl.module))
(local fzf (autoload :fzf-lua))

(local root-path "~/development/notes/work_wiki")

(fn wiki-root [path] (or vim.b.ultimate_wiki_root (vim.fn.expand path)))

[(tx :echaya/neowiki.nvim
     {:opts {:wiki_dirs [{:name :work_dev :path root-path}]}
      :keys [(tx :<leader>ww
                 ;; let's open tabs by default so we can close the wiki by :wq
                 "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>")
             (tx :<leader>wf #(fzf.files #{:cwd (wiki-root root-path)}))
             (tx :<leader>wg #(fzf.live_grep #{:cwd (wiki-root root-path)}))]
      :dependencies [(tx :tpope/vim-repeat) (tx :ibhagwan/fzf-lua)]})]
