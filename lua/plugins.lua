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
    {
        "sindrets/diffview.nvim"
    },
    {
        "stevearc/oil.nvim",
        opts = {},
        config = function()
            require("plugins.oil")
        end,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("fzf-lua").setup({
                winopts = { preview = { hidden = "hidden" } }
            })
        end
    },
    "mbbill/undotree",
    "nvim-pack/nvim-spectre",
    {
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("plugins.mini")
        end,
    },
    -- requires, 0.10.0, gives lsp/context breadcrumbs. could replace treesitter-context
    -- {
    --     "Bekaboo/dropbar.nvim"
    -- },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("plugins.eyeliner")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.treesitter")
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
    -- NOTE: works with treesitter, so no setup!
    "windwp/nvim-ts-autotag",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
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
    "ThePrimeagen/harpoon",
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end
    },
    {
        "ms-jpq/coq_nvim",
        branch = "coq"
    },
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts"
    },
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
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
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
        "tjdevries/gruvbuddy.nvim",
        dependencies = { "tjdevries/colorbuddy.nvim" },
        lazy = false,
        priority = 1000
    },
    {
        "ray-x/starry.nvim"
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
        "nyoom-engineering/oxocarbon.nvim",
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000
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
        "svrana/neosolarized.nvim",
    },
    {
        "projekt0n/caret.nvim",
    },
    {
        "neanias/everforest-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("plugins.everforest")
        end
    },
    {
        "alligator/accent.vim"
    },
    {
        "dotsilas/darcubox-nvim"
    },
    {
        "Verf/deepwhite.nvim"
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim"
        },
        config = function ()
            require('plugins.noice')
        end
    }
})
