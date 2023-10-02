--aliases
local opt = vim.opt
local fn = vim.fn
local execute = vim.api.nvim_command

--Lazy.nvim
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

--plugin/extension thingies
require('plugins')

--options
opt.linebreak = true
opt.number = true
opt.tgc = true
opt.termguicolors = true

--lazy.nvim
require("lazy").setup("plugins")

--status bar
require('lualine').setup()

----autopairs
require('nvim-autopairs').setup()

--file explorer
require'nvim-tree'.setup {
}

----navigation
require('leap').add_default_mappings()
--
----telescope
require('telescope').setup()
--
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
