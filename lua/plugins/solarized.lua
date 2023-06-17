local success, solarized = pcall(require, "solarized")

vim.o.background = "dark"

solarized:setup {
    config = {
        -- theme = "vim",
        theme = "neovim",
        -- theme = "vscode",
        transparent = true,
    }
}
