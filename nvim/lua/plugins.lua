return require('packer').startup(function()
    
	-- Packer can manage itself as an optional plugin
	use {'wbthomason/packer.nvim', opt = true}

	-- Color scheme
	use 'shaunsingh/nord.nvim'

	--treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
