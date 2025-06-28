return {
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	  end,
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  }
	},

	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
	    "nvim-tree/nvim-web-devicons",
	  },
	  config = function()
	    require("nvim-tree").setup {}
	  end,
	},

	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.3',
		--or                              , branch = '0.1.x',
	      dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
	  'nvim-lualine/lualine.nvim',
		dependencies = {"nvim-tree/nvim-web-devicons"}
	},

	{
	    'windwp/nvim-autopairs',
	    event = "InsertEnter",
	    opts = {} -- this is equalent to setup({}) function
	},

	{
		"catppuccin/nvim", name = "catppuccin", priority = 1000 
	},

	{
		"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
		config = function () 
		      local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {"python", "rust", "lua", "vim", "vimdoc", "c", "query", "java", "latex", "css", "gdscript"},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
	},

	{
		"neovim/nvim-lspconfig"
	},

	{
		"ggandor/leap.nvim",
		lazy = false,
	},
}
