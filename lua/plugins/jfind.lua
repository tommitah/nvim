local jfind = require("jfind")

jfind.setup({
    exclude = {
        ".git",
        "node_modules",
        "target",
        "build",
        "dist",
        "assets",
        "public",
    },
    border = "single",
    tmux = true,
    formatPaths = true,
    -- key = "<leader>ff"
    key = "<c-f>"
})
