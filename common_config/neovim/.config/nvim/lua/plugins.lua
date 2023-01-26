-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

-- auto apply config when plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Required dependencies for many plugins (telescope)
  use 'nvim-lua/plenary.nvim'
  -- Dev-icons dependencies
  use 'nvim-tree/nvim-web-devicons'
  -- mkdir
  use 'jghauser/mkdir.nvim'
  --dashboard
use {
  'glepnir/dashboard-nvim',
  -- event = 'VimEnter',
  config = function()
    require('dashboard')
  end,
  require = { {'nvim-tree/nvim-web-devicons'}}
}
  --kitty
  use "fladson/vim-kitty"

  -- theme
  use({
	'folke/tokyonight.nvim',
	config = function()
		require('expanded.tokyonight')
	end,
		})

  --telescope
  use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('expanded.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
	    {
		'nvim-telescope/telescope-file-browser.nvim',
		after = 'telescope.nvim',
		config = function()
			require('telescope').load_extension('file_browser')
		end,
	    },
        })


use ({
     {
	'nvim-treesitter/nvim-treesitter',
	event = 'CursorHold',
	run = ':TSUpdate',
	config = function()
		require('expanded.treesitter')
	end,
	},
	{ 'nvim-treesitter/playground', after = 'nvim-treesitter' },
	    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
	    { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
	    { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
	    { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        })
use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('expanded.indentline')
            end,
        })
  use 'tmux-plugins/vim-tmux'
--   use { 'ibhagwan/fzf-lua',
--   -- optional for icon support
--   requires = { 'kyazdani42/nvim-web-devicons' }
-- }
  use "Pocco81/auto-save.nvim"
--   use {
--   "folke/which-key.nvim",
--   config = function()
--     require("which-key").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end
-- }
  use ({
    'numToStr/Comment.nvim',
     event = 'BufRead',
    config = function()
        require('Comment').setup()
    end,
})
  use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
-- use({
--   "NTBBloodbath/galaxyline.nvim",
--   -- your statusline
--   config = function()
--     require("galaxyline.themes.eviline")
--   end,
--   -- some optional icons
--   requires = { "kyazdani42/nvim-web-devicons", opt = true }
-- })
-- use {'konapun/vacuumline.nvim', requires = {
--   'glepnir/galaxyline.nvim', branch = 'main',
--   'kyazdani42/nvim-web-devicons', opt = true
-- }, config = function() require('vacuumline').setup() end} -- Add this line to use defaults; otherwise, call `setup` with your config as described below wherever you configure your plugins
-- use {'datwaft/bubbly.nvim', config = function()
-- end
-- }
-- use{'ms-jpq/coq_nvim', branch = 'coq'}
-- use{'ms-jpq/coq.artifacts', branch = 'artifacts'}
-- use{'ms-jpq/coq.thirdparty', branch = '3p'}
-- use {
--     "nvim-neorg/neorg",
--     config = function()
--         require('neorg').setup {
--         }
--     end,
--     requires = "nvim-lua/plenary.nvim"
-- }
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
use {
	"pearofducks/ansible-vim",
	after='mason.nvim',
	}

	-- firenvim is used for embedding neovim in the browser
use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
}
	-- optional plugins based on the machine

use({ "m-pilia/vim-mediawiki", ft='mediawiki',
                config = function()
                    require('expanded.mediawiki')
                end,
	})
use {'neoclide/coc.nvim', branch = 'release', after='vim-mediawiki'}
use{'sirver/ultisnips', after='coc.nvim'}
use{'tpope/vim-surround', after='vim-mediawiki'}


	if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

