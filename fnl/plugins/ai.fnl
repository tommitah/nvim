(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

[(tx :CopilotC-Nvim/CopilotChat.nvim
     {:build "make tiktoken"
      :dependencies [(tx :nvim-lua/plenary.nvim)]
      :opts {;; :model :gpt-5.1
             ;; heavier more capable model
             ; :model :claude-opus-4.6
             ;; cheaper model that's fine for most tasks
             :model :claude-sonnet-4.6
             :temperature 0.2
             :window {:layout :horizontal
                      ;; :width 0.7
                      :height 1}
             ;; fullscreen
             :auto_insert_mode false}
      :keys [(tx :<leader>co ":CopilotChatToggle<cr>" keymap-opts)]})]
