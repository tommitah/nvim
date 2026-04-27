-- [nfnl] fnl/plugins/typescript.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
return {"dmmulroy/tsc.nvim", keys = {{"<leader>to", ":TSCOpen<cr>", keymap_opts}, {"<leader>tsc", ":TSC<cr>", keymap_opts}}, opts = {bin_name = "tsgo"}}
