local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- necessities, QOL
    -- TELESCOPE
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.telescope")
        end,
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("plugins.eyeliner")
        end,
    },
    -- ahem, not telescope but another finder
    {
        "jake-stewart/jfind.nvim",
        config = function()
            require("plugins.jfind")
        end,
    },
    -- /TELESCOPE
    "mbbill/undotree",
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter")
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
    "nvim-treesitter/refactor",
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("plugins.autotag")
        end,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "tjdevries/express_line.nvim",
        config = function()
            require("plugins.express_line")
        end,
    },
    "ThePrimeagen/harpoon",
    "nicwest/vim-http",
    ---------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    -- LSP (and completion and linters/formatters...)
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "rafamadriz/friendly-snippets",
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("plugins.mason_lsp")
        end,
    },
    "neovim/nvim-lspconfig",
    -- formatting and linting
    "jayp0521/mason-null-ls.nvim",
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.null-ls")
        end,
    },
    -- TS tools to replace tsserver? Check this out at some point
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
        config = function ()
            require("plugins.ts-tools")
        end
    },
    -- This is JUST for <RUST>!
    {
        "rust-lang/rust.vim",
        config = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "saecki/crates.nvim",
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require("plugins.rust")
        end,
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "ray-x/lsp_signature.nvim",
    },
    -- </RUST>
    {
        "onsails/lspkind.nvim",
        config = function()
            require("lspkind").init()
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },
    -- /LSP
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    ----------------------------------------------------------
    -- visual/cosmetic plugins
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup()
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        config = function()
            require("plugins.oil")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "lalitmee/cobalt2.nvim",
        dependencies = { "tjdevries/colorbuddy.nvim" },
        lazy = false,
        priority = 1000,
    },
    {
        "calind/selenized.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "echasnovski/mini.nvim",
        config = function()
            require("plugins.mini")
        end,
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "mcchrish/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
    },
    { "rose-pine/neovim" },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup()
        end,
    },
    {
        "catppuccin/nvim",
        config = function()
            require("plugins.catppuccin")
        end,
    },
    {
        "ramojus/mellifluous.nvim",
        config = function()
            require("plugins.mellifluous")
        end,
    },
    {
        "maxmx03/solarized.nvim",
        config = function()
            require("plugins.solarized")
        end,
    },
})
