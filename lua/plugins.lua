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
	"nvim-telescope/telescope-file-browser.nvim",
	"zane-/cder.nvim",
	"nvim-telescope/telescope-project.nvim",
	-- /TELESCOPE
	"mbbill/undotree",
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	config = function()
	-- 		require("plugins.noice")
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	},
	"nvim-treesitter/playground",
	"nvim-treesitter/refactor",

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("plugins.autotag")
		end,
	},

	{
		"kylechui/nvim-surround",
		-- tag = "*",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		-- tag = "*",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"tjdevries/express_line.nvim",
		config = function()
			require("plugins.express_line")
		end,
	},
	-- {
	-- 	"windwp/windline.nvim",
	-- 	config = function()
	-- 		-- require("wlsample.vscode")
	-- 		require("wlsample.vscode")
	-- 	end,
	-- },
	"ThePrimeagen/harpoon",
	"jiangmiao/auto-pairs",
	"nicwest/vim-http",
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
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
		-- version = "<CurrentMajor>.*",
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
	{
		"folke/neodev.nvim",
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
	-- </RUST>
	-- This is JUST for scala
	-- {
	-- 	"scalameta/nvim-metals",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("plugins.metals")
	-- 	end,
	-- },
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init()
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
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
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("plugins.lspsaga")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	},
	"jubnzv/virtual-types.nvim",
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
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("plugins.presence")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.tree")
		end,
	},
	-- {
	-- 	"sidebar-nvim/sidebar.nvim",
	-- 	config = function()
	-- 		require("sidebar-nvim").setup({ open = true })
	-- 	end,
	-- },
	"igorgue/danger",
	"folke/tokyonight.nvim",
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
		"svrana/neosolarized.nvim",
		dependencies = {
			"tjdevries/colorbuddy.vim",
		},
		lazy = false,
		priority = 1000,
	},
	{
		"ishan9299/nvim-solarized-lua",
		lazy = false,
		priority = 1000,
	},
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},
	"AlessandroYorba/Alduin",
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
	},
	"AlessandroYorba/Despacio",
	"louisboilard/pyramid.nvim",
	"nyoom-engineering/oxocarbon.nvim",
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"luisiacc/gruvbox-baby",
		branch = "main",
		lazy = false,
		priority = 1000,
	},
	{
		"kvrohit/rasmus.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"ramojus/mellifluous.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		lazy = false,
		priority = 1000,
	},
	{
		"lewpoly/sherbet.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "bluz71/vim-moonfly-colors", branch = "cterm-compat" },
	{ "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
	{ "pineapplegiant/spaceduck", branch = "main" },
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
})
