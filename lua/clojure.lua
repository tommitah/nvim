require('util')

vim.pack.add({
  -- for fennel configs if I want to do that at some point.
  -- { src = get_url('Olical/aniseed') },
  { src = get_url('Olical/conjure') },
  { src = get_url('tpope/vim-dispatch') },
  { src = get_url('radenling/vim-dispatch-neovim') },
  { src = get_url('julienvincent/nvim-paredit') },
  { src = get_url('clojure-vim/vim-jack-in') },
})

-- remap K for doc word
vim.g['conjure#mapping#doc_word'] = false

require('nvim-paredit').setup()
