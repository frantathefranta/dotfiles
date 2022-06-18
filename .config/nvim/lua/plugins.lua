-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- mkdir
  use 'jghauser/mkdir.nvim'
  -- making sure lsp-installer starts before lspconfig
  use
	  {
	  "williamboman/nvim-lsp-installer",
	  "neovim/nvim-lspconfig",
  }
  require("nvim-lsp-installer").setup {
  automatic_installation = true
	}

	local lspconfig = require('lspconfig')

	lspconfig.dockerls.setup{}
	lspconfig.ansiblels.setup{}
	lspconfig.vimls.setup{}
	lspconfig.terraformls.setup{}
	
	lspconfig.pyright.setup{}
	lspconfig.bashls.setup{}
  -- vim-games
  use 'ThePrimeagen/vim-be-good'
end)
-- test
-- auto apply config when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
