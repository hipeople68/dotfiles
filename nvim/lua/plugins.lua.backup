return require('packer').startup(function()
    
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Color scheme
	use {'catppuccin/nvim', as = 'catppuccin'}

	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	
	--status bar
	use { 'nvim-lualine/lualine.nvim', 
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	--navigation
	use {
		'ggandor/leap.nvim',
		requires = { {'tpope/vim-repeat'} }
	}

	--file tree
	use {'kyazdani42/nvim-tree.lua', 
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		tag = 'nightly' 
	}
	
	--autopairs
	use {
		"windwp/nvim-autopairs",
		--config = function() require("nvim-autopairs").setup {} end
	}

	--telescope
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		  requires = { {'nvim-lua/plenary.nvim'} }
	}

	--whichkey
	use {
		'folke/which-key.nvim'
	}

	--bufferline
	--use {
	--	'akinsho/bufferline.nvim',tag = "v3.*", 
	--	requires = 'kyazdani42/nvim-web-devicons'
	--}
	
	--completion and snippets
	--remember to work on this
	use 'neovim/nvim-lspconfig'
end)
