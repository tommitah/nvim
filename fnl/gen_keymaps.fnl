(local {: keymap-opts} (require :options))

(vim.keymap.set "" :<Space> :<Nop> keymap-opts)
(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(vim.keymap.set :n :<leader>so ":update<CR> :source<CR>")
;; VISUAL MODE: Move highlighted text block
(vim.keymap.set :v :<C-J> ":m '>+1<CR>gv=gv" keymap-opts)
(vim.keymap.set :v :<C-K> ":m '>-2<CR>gv=gv" keymap-opts)
;; stay in visual mode when indenting
(vim.keymap.set :v "<" :<gv keymap-opts)
(vim.keymap.set :v ">" :>gv keymap-opts)
(vim.keymap.set [:n :v] :n :nzzzv keymap-opts)
(vim.keymap.set [:n :v] :N :Nzzzv keymap-opts)
;; language formatting
(vim.keymap.set [:n :v] :<leader>lf vim.lsp.buf.format keymap-opts)
;; tabs (useful with clj repl for example)
(vim.keymap.set :n :<leader>> (lambda [] (vim.cmd :tabnext)) keymap-opts)
(vim.keymap.set :n :<leader>< (lambda [] (vim.cmd :tabprevious)) keymap-opts)
