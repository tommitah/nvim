local success, solarized = pcall(require, "solarized")

vim.o.background = "dark"

solarized.setup({
    transparent = true,
    -- theme = "vim",
    theme = "neo",
    -- theme = "vscode",
})

-- vim.cmd.colorscheme("solarized")
