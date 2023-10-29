LAZY_PLUGIN_SPEC = {}

function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require "config.files"
require "config.theme"
require "config.editing"
require "config.visual"
require "config.motion"
require "config.lsp_integration"

require "config.lazy"

require "config.options"
require "config.keymaps"
