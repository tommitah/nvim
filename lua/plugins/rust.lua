require("lsp_config").setup()
local on_attach = require("lsp_config").on_attach
local capabilities = require("lsp_config").capabilities
local coq = require("coq")

local opts = {
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
    tools = {
        inlay_hints = {
            auto = false,
        },
    },
    coq.lsp_ensure_capabilities({})
}


require("rust-tools").setup(opts)
local crates = require("crates")
crates.setup()
crates.show()
