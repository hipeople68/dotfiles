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

--Treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	sync_install = true,
	highlight = {
		enable = true, 
		additional_vim_regex_highlighting = false, 
	}, 
}
