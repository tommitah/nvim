(import-macros {: tx} :config.macros)

(tx :folke/noice.nvim {:event :VeryLazy
                       :opts {:lsp {:override {:vim.lsp.util.convert_input_to_markdown_lines true
                                               :vim.lsp.util.stylize_markdown true}}
                              :cmdline {:enabled true :view :cmdline}
                              :messages {:enabled true}}})
