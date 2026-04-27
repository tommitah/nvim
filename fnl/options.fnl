;; VANILLA OPTS
;; (set vim.opt.winborder :single)
;; (when (not vim.g.neovide)
;;   (vim.cmd "packadd nvim.difftool"))

(local keymap-opts {:noremap true :silent true})

(set _G.vim.opt.showmode false)
(set _G.vim.opt.ignorecase true)
(set _G.vim.opt.wrap false)
(set _G.vim.opt.cursorline true)
(set _G.vim.opt.number true)
(set _G.vim.opt.signcolumn "yes:1")
(set _G.vim.opt.scrolloff 8)
(set _G.vim.opt.expandtab true)

;; (set vim.opt.tabstop 4)
;; (set vim.opt.softtabstop 4)
;; (set vim.opt.shiftwidth 4)
(set _G.vim.opt.tabstop 2)
(set _G.vim.opt.softtabstop 2)
(set _G.vim.opt.shiftwidth 2)

(set _G.vim.opt.list true)
(set _G.vim.opt.guicursor "n-v-c-i:block")
(set _G.vim.opt.swapfile false)

;; yank/paste from os clipboard
(_G.vim.keymap.set [:n :v] :<leader>P "\"+p" keymap-opts)
(_G.vim.keymap.set [:n :v] :<leader>Y "\"+y" keymap-opts)

(set _G.vim.g.disable_autoformat false)
;; VANILLA OPTS

(: _G.vim.opt.listchars :append "space:⋅")

;; export keymap options
{: keymap-opts}
