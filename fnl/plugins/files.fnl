(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

(fn fzf [method]
  #((. (require :fzf-lua) method)))

(fn quicker [method]
  #((. (require :quicker) method)))

[(tx :stevearc/oil.nvim
     {:opts {:view_options {:show_hidden true}
             :win_options {:signcolumn "yes:2"}}
      :keys [(tx "-" :<cmd>Oil<CR> keymap-opts)]})
 (tx :refractalize/oil-git-status.nvim
     {:opts {:show_ignored true} :dependencies [(tx :stevearc/oil.nvim)]})
 (tx :JezerM/oil-lsp-diagnostics.nvim {:dependencies [(tx :stevearc/oil.nvim)]})
 (tx :otavioschwanck/arrow.nvim
     {:dependencies [(tx :nvim-tree/nvim-web-devicons)]
      :opts {:show_icons true
             :leader_key :<leader>p
             :buffer_leader_key :<leader>P}})
 (tx :stevearc/quicker.nvim
     {:opts {}
      :keys [(tx :<leader>q (quicker :toggle) keymap-opts)
             ;; note that this doesn't clear the loclist
             (tx :<leader>cq "<cmd>call setqflist([])<cr>" keymap-opts)
             (tx :<C-k> :<cmd>cprev<CR>zz keymap-opts)
             (tx :<C-j> :<cmd>cnext<CR>zz keymap-opts)]})
 (tx :stevearc/conform.nvim
     {:opts {:formatters_by_ft {:lua [:stylua]
                                ; :javascript [:prettierd :prettier]
                                ; :javascriptreact [:prettierd :prettier]
                                ; :typescript [:prettierd :prettier]
                                ; :typescriptreact [:prettierd :prettier]
                                :javascript [:prettierd]
                                :javascriptreact [:prettierd]
                                :typescript [:prettierd]
                                :typescriptreact [:prettierd]
                                :rust [:rustfmt :lsp_format :fallback]
                                ; :clojure [:zprint]
                                ; :clj [:zprint]
                                ; :cljs [:zprint]
                                ; :cljc [:zprint]
                                ; :edn [:zprint]
                                :clojure [:cljstyle]
                                :clj [:cljstyle]
                                :cljs [:cljstyle]
                                :cljc [:cljstyle]
                                :edn [:cljstyle]
                                :fennel [:fnlfmt]}
             :format_on_save (fn [bufnr]
                               (when (not (or _G.vim.g.disable_autoformat
                                              (. _G.vim.b bufnr
                                                 :disable_autoformat)))
                                 {:timeout_ms 500 :lsp_format :fallback}))
             :formatters {:zprint {:map {:comma? false}}}}})
 (tx :ibhagwan/fzf-lua
     {:opts {:ui_select true
             :keymap {:fzf {:ctrl-q :select-all+accept}}
             ;; :actions {:files {"ctrl-q" fzf-lua.actions.file_sel_to_qf}}
             :winopts {;; :split "belowright new"
                       :fullscreen true
                       :preview {:border :none
                                 :vertical "down:50%"
                                 :layout :vertical}}}
      :keys [(tx :<leader>ff (fzf :files) keymap-opts)
             (tx :<leader>fg (fzf :live_grep) keymap-opts)
             (tx :<leader>fG (fzf :live_grep_resume) keymap-opts)
             (tx :<leader>f* (fzf :grep_cword) :mode [:n :v] keymap-opts)
             ;; GIT STATUS
             (tx :<leader>gs (fzf :git_status) keymap-opts)
             (tx :<leader>gB (fzf :git_bcommits) keymap-opts)
             (tx :<leader>gC (fzf :git_commits) keymap-opts)
             (tx :<leader>fv (fzf :grep_visual) :mode [:n :v] keymap-opts)
             (tx :<leader>bb (fzf :buffers) keymap-opts)
             (tx :<leader>Q (fzf :quickfix) keymap-opts)
             (tx :<leader>dW (fzf :diagnostics_workspace) keymap-opts)
             (tx :<leader>dD (fzf :diagnostics_document) keymap-opts)
             (tx :<leader>ga "<cmd>Git add %<cr>" keymap-opts)
             (tx :<leader>gc "<cmd>Git commit<cr>" keymap-opts)
             (tx :<leader>gl "<cmd>Git log<cr>" keymap-opts)
             (tx :<leader>gid "<cmd>Git diff<cr>" keymap-opts)]})
 (tx :jinh0/eyeliner.nvim
     {:opts {:highlight_on_key true
             :dim true
             :disabled_filetypes [;; disable eyeliner movements so toggling stuff in orgmode isn't a hassle
                                  :orgagenda]}})
 (tx :kylechui/nvim-surround)
 (tx :nvim-orgmode/orgmode
     {:opts {:org_agenda_files "~/development/notes/orgfiles/**/*"
             :org_default_notes_file "~/development/notes/orgfiles/refile.org"}
      :keys [(tx :<leader>ot ":lua Org.capture.t()<cr>" keymap-opts)]})
 ; (tx :kokusenz/deltaview.nvim {:dependencies [(tx :kokusenz/delta.lua)]})
 (tx :folke/todo-comments.nvim)]
