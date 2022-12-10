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
		config = function() require 'plugins.telescope' end }
	use {
		'nvim-telescope/telescope-file-browser.nvim',
		'zane-/cder.nvim',
		'nvim-telescope/telescope-project.nvim'
	}
	-- /TELESCOPE

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require 'plugins.indent' end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require 'plugins.treesitter' end
	}
	use 'nvim-treesitter/playground'

	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}

	use {
		'windwp/nvim-ts-autotag',
		config = function () require 'plugins.autotag' end
	}

	-- TODO: something wrong here
	use {
		'kylechui/nvim-surround',
		tag = '*',
		config = function () require('nvim-surround').setup() end
	}

	use {
		'anuvyklack/pretty-fold.nvim',
		config = function () require('pretty-fold').setup() end
	}

	use {
		'lewis6991/gitsigns.nvim',
		config = function () require('gitsigns').setup() end
	}


	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function () require 'plugins.toggleterm' end
	}

	use 'tjdevries/express_line.nvim'

	use 'ThePrimeagen/harpoon'
	use 'jiangmiao/auto-pairs'
	-- use 'alvan/vim-closetag'
	use 'j-hui/fidget.nvim'
	use 'nicwest/vim-http'


----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------
----------------------------------------------------------

	-- LSP (and completion)
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

	use {
		'onsails/lspkind.nvim',
		config = function () require('lspkind').init() end
	}

	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('trouble').setup() end
	}

	use {
		'glepnir/lspsaga.nvim',
		branch = 'main',
		config = function () require 'plugins.lspsaga' end
	}

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
	use 'brenoprata10/nvim-highlight-colors'
	use 'AlessandroYorba/Alduin'
	use 'AlessandroYorba/Despacio'
	use 'louisboilard/pyramid.nvim'
	use {
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function () require 'plugins.catppuccin' end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
