local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- necessities, QOL
	-- TELESCOPE
	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require 'plugins.telescope' end
	}
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		'zane-/cder.nvim',
		'nvim-telescope/telescope-project.nvim'
	}
	-- /TELESCOPE

	use 'mbbill/undotree'

	use {
		'lewis6991/impatient.nvim',
		config = function() require('impatient') end
	}

	-- Neoscroll doesn't use the 'config = ' table
	use 'karb94/neoscroll.nvim'
	require('neoscroll').setup()
	-------------------------------------------------

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require 'plugins.indent' end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require 'plugins.treesitter' end
	}
	use 'nvim-treesitter/playground'
	use 'nvim-treesitter/refactor'

	use {
		'shortcuts/no-neck-pain.nvim',
		tag = '*'
	}

	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}

	use {
		'windwp/nvim-ts-autotag',
		config = function() require 'plugins.autotag' end
	}

	-- TODO: something wrong here
	use {
		'kylechui/nvim-surround',
		tag = '*',
		config = function() require('nvim-surround').setup() end
	}

	use {
		'anuvyklack/pretty-fold.nvim',
		config = function() require('pretty-fold').setup() end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns').setup() end
	}


	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function() require 'plugins.toggleterm' end
	}

	use 'tjdevries/express_line.nvim'

	use 'ThePrimeagen/harpoon'
	use 'jiangmiao/auto-pairs'
	-- use 'alvan/vim-closetag'
	-- use 'j-hui/fidget.nvim'
	use 'nicwest/vim-http'
	use {
		'simrat39/symbols-outline.nvim',
		config = function() require('symbols-outline').setup() end
	}

	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------

	-- LSP (and completion and linters/formatters...)
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	use {
		'williamboman/mason.nvim',
		config = function() require('mason').setup() end
	}
	use {
		'williamboman/mason-lspconfig.nvim',
		config = function() require 'plugins.mason_lsp' end
	}
	use 'neovim/nvim-lspconfig'

	-- formatting and linting
	use 'jayp0521/mason-null-ls.nvim'
	use {
		'jose-elias-alvarez/null-ls.nvim',
		config = function() require 'plugins.null-ls' end
	}

	use {
		'onsails/lspkind.nvim',
		config = function() require('lspkind').init() end
	}

	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('trouble').setup() end
	}

	use {
		'glepnir/lspsaga.nvim',
		branch = 'main',
		config = function() require 'plugins.lspsaga' end
	}

	use {
		'smjonas/inc-rename.nvim',
		config = function() require('inc_rename').setup() end
	}

	use 'jubnzv/virtual-types.nvim'

	-- use {
	-- 	'SmiteshP/nvim-navic',
	-- 	requires = 'neovim/nvim-lspconfig'
	-- }
	--
	-- use {
	-- 	'fgheng/winbar.nvim',
	-- 	-- config = function () require 'plugins.winbar' end
	-- }

	-- /LSP
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------

	-- visual/cosmetic plugins
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons'
		}
	}
	use {
		'folke/noice.nvim',
		config = function() require 'plugins.noice' end,
		requires = {
			'MunifTanjim/nui.nvim',
			-- 'rcarriga/nvim-notify',
		}
	}
	use 'rebelot/kanagawa.nvim'
	use 'AlessandroYorba/Alduin'
	use 'AlessandroYorba/Despacio'
	use 'louisboilard/pyramid.nvim'
	use 'nyoom-engineering/oxocarbon.nvim'
	use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
	use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
	use { 'pineapplegiant/spaceduck', branch = 'main' }
	use { 'rose-pine/neovim', as = 'rose-pine' }
	use {
		'brenoprata10/nvim-highlight-colors',
		config = function() require('nvim-highlight-colors').setup() end
	}
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function() require 'plugins.catppuccin' end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
