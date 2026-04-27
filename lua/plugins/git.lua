-- [nfnl] fnl/plugins/git.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
return {{"f-person/git-blame.nvim", event = "VeryLazy", keys = {{"<leader>gb", ":GitBlameToggle<CR>", keymap_opts}}, opts = {enabled = false}}, {"sindrets/diffview.nvim"}, {"NeogitOrg/neogit", keys = {{"<leader>gg", ":Neogit<CR>", keymap_opts}}}, {"pwntester/octo.nvim", dependencies = {{"nvim-tree/nvim-web-devicons"}}}}
