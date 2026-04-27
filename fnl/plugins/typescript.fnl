(import-macros {: tx} :config.macros)
(local {: keymap-opts} (require :options))

(tx :dmmulroy/tsc.nvim
    {:opts {;; use tsgo as the compiler
            :bin_name :tsgo}
     :keys [(tx :<leader>to ":TSCOpen<cr>" keymap-opts)
            (tx :<leader>tsc ":TSC<cr>" keymap-opts)]})
