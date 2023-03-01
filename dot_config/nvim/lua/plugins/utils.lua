return {
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	"Pocco81/auto-save.nvim",
	"fladson/vim-kitty",
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"awk",
				"comment",
				"bash",
				"dockerfile",
				"gitcommit",
				"gitignore",
				"make",
				"perl",
				"terraform",
				"toml",
				"toml",
				"help",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},
}
