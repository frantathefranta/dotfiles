-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

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
  use "Pocco81/AutoSave.nvim"
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
  use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
  use 'jiangmiao/auto-pairs'
use({
  "NTBBloodbath/galaxyline.nvim",
  -- your statusline
  config = function()
    require("galaxyline.themes.eviline")
  end,
  -- some optional icons
  requires = { "kyazdani42/nvim-web-devicons", opt = true }
})
use{'ms-jpq/coq_nvim', branch = 'coq'}
use{'ms-jpq/coq.artifacts', branch = 'artifacts'}
use{'ms-jpq/coq.thirdparty', branch = '3p'}
use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
        }
    end,
    requires = "nvim-lua/plenary.nvim"
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

