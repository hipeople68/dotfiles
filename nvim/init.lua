--aliases
local opt = vim.opt
local fn = vim.fn
local execute = vim.api.nvim_command

--Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

--plugin/extension thingies
require('plugins')

--options
opt.linebreak = true
opt.number = true
opt.tgc = true
opt.termguicolors = true

opt.tabstop = 4

--Treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	sync_install = true,
	highlight = {
		enable = true, 
		additional_vim_regex_highlighting = false, 
	}, 
}
--status bar
require('lualine').setup()

--autopairs
require('nvim-autopairs').setup()

--file explorer
require'nvim-tree'.setup {
}

--navigation
require('leap').add_default_mappings()

--telescope
require('telescope').setup()

--whichkey
require('which-key').setup {
	plugins = {
		spelling = {
			enabled=true,
			suggestions=10,
		},
	},
}

--bufferline
--require('bufferline').setup {
--}

--colorscheme
require('catppuccin').setup({
	flavour = 'mocha',
	intergrations = {
		treesitter = true,
		lualine = true,
		nvimtree = true,
		leap = true,
		telescope = true,
		which_key = true,
	}
})
vim.cmd[[colorscheme catppuccin]]
