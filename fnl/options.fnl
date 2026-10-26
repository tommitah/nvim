;; VANILLA OPTS
;; (set vim.opt.winborder :single)
;; (when (not vim.g.neovide)
;;   (vim.cmd "packadd nvim.difftool"))

(local keymap-opts {:noremap true :silent true})

(set vim.opt.showmode false)
(set vim.opt.ignorecase true)
;; Generically wrap should be false (for code files)
(set vim.opt.wrap false)
;; Specifically set wrap to true for "natural language" documents
(vim.api.nvim_create_autocmd :FileType
                             {:pattern [:markdown :text :norg :neorg]
                              ;; unsure if norg or neorg
                              :callback (fn []
                                          (set vim.opt_local.wrap true))})

(set vim.opt.cursorline true)
(set vim.opt.number true)
(set vim.opt.signcolumn "yes:1")
(set vim.opt.scrolloff 8)
(set vim.opt.expandtab true)

;; (set vim.opt.tabstop 4)
;; (set vim.opt.softtabstop 4)
;; (set vim.opt.shiftwidth 4)
(set vim.opt.tabstop 2)
(set vim.opt.softtabstop 2)
(set vim.opt.shiftwidth 2)

;; Use 4-space indent for Java (overrides the global 2 above, buffer-local)
(vim.api.nvim_create_autocmd :FileType
                             {:pattern :java
                              :callback (fn []
                                          (set vim.bo.tabstop 4)
                                          (set vim.bo.softtabstop 4)
                                          (set vim.bo.shiftwidth 4)
                                          (set vim.bo.expandtab true))})

(set vim.opt.list true)
(set vim.opt.guicursor "n-v-c-i:block")
(set vim.opt.swapfile false)

;; yank/paste from os clipboard
(vim.keymap.set [:n :v] :<leader>P "\"+p" keymap-opts)
(vim.keymap.set [:n :v] :<leader>Y "\"+y" keymap-opts)

(set vim.g.disable_autoformat false)
;; VANILLA OPTS

; (: vim.opt.listchars :append "space:⋅")

;; export keymap options
{: keymap-opts}
