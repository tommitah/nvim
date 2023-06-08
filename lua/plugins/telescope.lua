local opts = {
    defaults = {
        file_ignore_patterns = { "node_modules", "target", "build" },
    },
    pickers = {
        find_files = { theme = "ivy" },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        },
        -- file_browser = {
        --     theme = "ivy",
        -- },
        -- cder = {
        --     dir_command = { "fd", "--hidden", "--type=d", ".", os.getenv("HOME") },
        --     previewer_command = "exa --color=always -a --icons",
        --     pager_command = 'bat --plain --paging=always --pager="less -RS"',
        -- },
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
}

require("telescope").setup(opts)
-- require("telescope").load_extension("file_browser")
-- require("telescope").load_extension("cder")
-- require("telescope").load_extension("project")
require("telescope").load_extension("ui-select")
-- require("telescope").load_extension("fzy_native")
