-- [nfnl] fnl/plugins/git.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
return {{"f-person/git-blame.nvim", event = "VeryLazy", keys = {{"<leader>gb", ":GitBlameToggle<CR>", keymap_opts}}, opts = {enabled = false}}, {"NeogitOrg/neogit", dependencies = {{"sindrets/diffview.nvim", cmd = {"DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh"}}}, keys = {{"<leader>gg", ":Neogit<CR>", keymap_opts}}}, {"justinmk/guh.nvim"}}
