-- [nfnl] fnl/plugins/ai.fnl
local _local_1_ = require("options")
local keymap_opts = _local_1_["keymap-opts"]
return {{"CopilotC-Nvim/CopilotChat.nvim", build = "make tiktoken", dependencies = {{"nvim-lua/plenary.nvim"}}, keys = {{"<leader>co", ":CopilotChatToggle<cr>", keymap_opts}}, opts = {model = "claude-sonnet-4.6", temperature = 0.2, window = {layout = "horizontal", height = 1}, auto_insert_mode = false}}}
