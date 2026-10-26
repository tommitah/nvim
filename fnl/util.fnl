(fn print-active-lsp-clients []
  (each [_ client (ipairs (vim.lsp.get_clients))]
    (print client.name)))

(fn lazy-require [name]
  "Stand-in for `require` that defers loading `name` until a field is accessed.
  Works at lazy.nvim spec time, when plugins are not on the runtimepath yet."
  (setmetatable {} {:__index (fn [_ key] (. (require name) key))}))

{: print-active-lsp-clients : lazy-require}
