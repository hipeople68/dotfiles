return require('packer').startup(function()
    
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Color scheme
	use 'shaunsingh/nord.nvim'

	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	
	--status bar
	use { 'nvim-lualine/lualine.nvim', 
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	--navigation
	use 'justinmk/vim-sneak'

	--file tree
	use {'kyazdani42/nvim-tree.lua', 
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		tag = 'nightly' 
	}

end)
