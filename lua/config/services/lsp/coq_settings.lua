vim.g.coq_settings = {
  keymap = { jump_to_mark = "<C-s>" },
  clients = {
    paths = {
      path_seps = { "/" },
    },
    buffers = { match_syms = true },
  },
  display = {
    pum = {
      y_max_len = 5,
    },
  }
}
