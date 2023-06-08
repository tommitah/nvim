local indent_scope = require("mini.indentscope")
local pairs = require("mini.pairs")
local comment = require("mini.comment")

local indent_scope_opts = {
    draw = {
        delay = 0,
        animation = function(s, n)
            return 0
        end,
    },
    mappings = {
        goto_top = "[i",
        goto_bottom = "]i",
    },
    options = {
        border = "both",
    },
    symbol = "|",
}

local pairs_opts = {}
local comment_opts = {}

indent_scope.setup(indent_scope_opts)
pairs.setup(pairs_opts)
comment.setup(comment_opts)
