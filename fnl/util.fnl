(fn print-active-lsp-clients []
  (each [_ client (ipairs (vim.lsp.get_clients))]
    (print client.name)))

{: print-active-lsp-clients}
