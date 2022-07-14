-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- auto apply config when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- apply colorscheme
vim.cmd[[colorscheme neon]]

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- mkdir
  use 'jghauser/mkdir.nvim'
  use 'tmux-plugins/vim-tmux'
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
}
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
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
        lspconfig.sumneko_lua.setup{}
	lspconfig.pyright.setup{}
	lspconfig.bashls.setup{}

	use({
	'CosmicNvim/cosmic-ui',
	requires = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
	config = function()
	require('cosmic-ui').setup()
	end,
	})

	use "rafamadriz/neon"

	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
        }
	if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

-- test

