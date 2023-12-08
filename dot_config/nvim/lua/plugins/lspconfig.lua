return {
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
{{- if ne .uid "1144" }}
				marksman = {},
				lua_ls = {},
				pyright = {},
				ansiblels = {},
				yamlls = {},
				dockerls = {},
				rust_analyzer = {},
				docker_compose_language_service = {},
				awk_ls = {},
{{- end -}}
				bashls = {},
			},
		},
	},
  { "pearofducks/ansible-vim" },
}
