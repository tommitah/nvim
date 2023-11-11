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
require "config.ui"
require "config.motion"
require "config.services"

require "config.lazy"

require "config.options"
require "config.keymaps"
