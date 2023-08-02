local indent_scope = require("mini.indentscope")
local pairs = require("mini.pairs")
local comment = require("mini.comment")
-- local cmp = require("mini.completion")

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
-- local cmp_opts = {
--     window = {
--         info = { height = 25, width = 80, border = 'none' },
--         signature = { height = 25, width = 80, border = 'none' }
--     },
--     lsp_completion = {
--         source_func = 'omnifunc',
--     }
-- }

indent_scope.setup(indent_scope_opts)
pairs.setup(pairs_opts)
comment.setup(comment_opts)
-- cmp.setup(cmp_opts)
