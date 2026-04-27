(fn print-active-lsp-clients []
  (each [_ client (ipairs (_G.vim.lsp.get_clients))]
    (print client.name)))

(print-active-lsp-clients)

{: print-active-lsp-clients}
