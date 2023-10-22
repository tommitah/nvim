local indent_scope = require "mini.indentscope"
local pairs = require "mini.pairs"
local comment = require "mini.comment"
local pick = require "mini.pick"
-- local files = require "mini.files"
-- local cmp = require "mini.completion"
-- local tabline = require "mini.tabline"
-- local cursorword = require "mini.cursorword"
local statusline = require "mini.statusline"

local pick_opts = {}
local statusline_opts = {}
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
-- local cursorword_opts = {
--     delay = 3000
-- }
local pairs_opts = {}
local comment_opts = {}
-- local tabline_opts = {}
-- local cmp_opts = {
--     window = {
--         info = { height = 25, width = 80, border = 'none' },
--         signature = { height = 25, width = 80, border = 'none' }
--     },
--     lsp_completion = {
--         source_func = 'completefunc',
--     }
-- }

statusline.setup(statusline_opts)
indent_scope.setup(indent_scope_opts)
pairs.setup(pairs_opts)
comment.setup(comment_opts)
pick.setup(pick_opts)
-- cmp.setup(cmp_opts)
-- tabline.setup(tabline_opts)
-- cursorword.setup(cursorword_opts)
-- files.setup()
