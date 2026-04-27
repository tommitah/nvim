(local {: keymap-opts} (require :options))

(_G.vim.keymap.set "" :<Space> :<Nop> keymap-opts)
(set _G.vim.g.mapleader " ")
(set _G.vim.g.maplocalleader " ")
(_G.vim.keymap.set :n :<leader>so ":update<CR> :source<CR>")
;; VISUAL MODE: Move highlighted text block
(_G.vim.keymap.set :v :<C-J> ":m '>+1<CR>gv=gv" keymap-opts)
(_G.vim.keymap.set :v :<C-K> ":m '>-2<CR>gv=gv" keymap-opts)
;; stay in visual mode when indenting
(_G.vim.keymap.set :v "<" :<gv keymap-opts)
(_G.vim.keymap.set :v ">" :>gv keymap-opts)
(_G.vim.keymap.set [:n :v] :n :nzzzv keymap-opts)
(_G.vim.keymap.set [:n :v] :N :Nzzzv keymap-opts)
;; language formatting
(_G.vim.keymap.set [:n :v] :<leader>lf _G.vim.lsp.buf.format keymap-opts)
;; tabs (useful with clj repl for example)
(_G.vim.keymap.set :n :<leader>> (lambda [] (_G.vim.cmd :tabnext)) keymap-opts)
(_G.vim.keymap.set :n :<leader>< (lambda [] (_G.vim.cmd :tabprevious))
                   keymap-opts)
