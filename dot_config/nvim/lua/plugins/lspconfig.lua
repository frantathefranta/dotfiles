return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				marksman = {},
				lua_ls = {},
				pyright = {},
				ansiblels = {},
				yamlls = {},
				dockerls = {},
				rust_analyzer = {},
				docker_compose_language_service = {},
				awk_ls = {},
				bashls = {},
			},
		},
	},
}
