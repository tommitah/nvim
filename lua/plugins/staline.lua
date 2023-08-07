local staline = require 'staline'
-- local stabline = require 'stabline'

local staline_opts = {
    sections = {
        left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
        mid = {},
        right = { 'file_name', 'line_column' }
    },
    mode_colors = {
        i = "#d4be98",
        n = "#84a598",
        c = "#8fbf7f",
        v = "#fc802d",
    },
    defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " "
    }
}
-- local stabline_opts = {
    -- style       = "bar", -- others: arrow, slant, bubble
    -- stab_left   = "┃",
    -- stab_right  = " ",
    --
    -- -- fg       = Default is fg of "Normal".
    -- -- bg       = Default is bg of "Normal".
    -- inactive_bg = "#1e2127",
    -- inactive_fg = "#aaaaaa",
    -- -- stab_bg  = Default is darker version of bg.,
    --
    -- font_active = "bold",
    -- exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
    -- stab_start  = "", -- The starting of stabline
    -- stab_end    = "",
    -- numbers     = function(bufn, n)
    --     return '*' .. n .. ' '
    -- end
    --
--     style = "slant",
--     bg = "#986fec",
--     fg = "black",
--     stab_right = ""
-- }

staline.setup(staline_opts)
-- stabline.setup(stabline_opts)