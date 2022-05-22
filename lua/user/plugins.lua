local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Packer can manage itself here
	use 'wbthomason/packer.nvim'

	-- The most important of them all, the cocoNUTTIEST and OILIEST
	-- from the one and the only
	-- PRIME
	-- PRIMEAGEEEEN
	use { 'ThePrimeagen/harpoon' }

	-- for easy commenting
	 use {
	 'numToStr/Comment.nvim',
	 config = function()
		 require('Comment').setup()
	 end
	 }

	-- autopairing!
	use 'jiangmiao/auto-pairs'

	-- Web icons + colorscheme and lualine(statusline)
	use 'tjdevries/colorbuddy.vim'
	use 'kyazdani42/nvim-web-devicons'
	use 'Mofiqul/vscode.nvim'
	use 'tjdevries/gruvbuddy.nvim'
	use 'eemed/sitruuna.vim'
	use 'severij/vadelma'
	use 'kadekillary/skull-vim'
	use 'DAddYE/soda.vim'
	use 'nvim-lualine/lualine.nvim'

	-- Telescope, oiliest fzf there is
	-- plenary dependency!
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Telescope file browser, yowza
	use 'nvim-telescope/telescope-file-browser.nvim'

	-- Treesitter for better syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter'
	}
	-- ...and autoclose
	use {
		'windwp/nvim-ts-autotag'
	}

	--Luasnip
	use "L3MON4D3/LuaSnip"

	-- cmp
	use {
	    "hrsh7th/nvim-cmp",
	    -- commit = "dbc72290295cfc63075dab9ea635260d2b72f2e5",
	}
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-emoji"
	use "hrsh7th/cmp-nvim-lua"

	-- LSP
	use {
	'williamboman/nvim-lsp-installer',
	'neovim/nvim-lspconfig',
	'tamago324/nlsp-settings.nvim',
	'ray-x/lsp_signature.nvim',
	'jose-elias-alvarez/null-ls.nvim'
	}

	use {
	'lewis6991/gitsigns.nvim'
	}

	-- Better terminal integration
	use {"akinsho/toggleterm.nvim", tag = 'v1.*'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
