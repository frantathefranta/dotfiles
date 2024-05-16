return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "yaml" })
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/SchemaStore.nvim",
			version = false, -- last release is way too old
		},
		opts = {
			setup = {
				yamlls = function()
					require("lazyvim.util").lsp.on_attach(function(client, bufnr)
						if client.name == "yamlls" and vim.bo.filetype == "helm" then
							vim.lsp.stop_client(bufnr, client.id)
						end
					end)
				end,
			},
			-- make sure mason installs the server
			servers = {
				yamlls = {
					-- Have to add this for yamlls to understand that we support line folding
					capabilities = {
						textDocument = {
							foldingRange = {
								dynamicRegistration = false,
								lineFoldingOnly = true,
							},
						},
					},
					-- lazy-load schemastore when needed
					on_new_config = function(new_config)
						new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
						vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
					end,
					settings = {
						redhat = { telemetry = { enabled = false } },
						yaml = {
							keyOrdering = false,
							format = {
								enable = true,
							},
							validate = true,
							hover = true,
							completion = true,
							schemaStore = {
								-- Must disable built-in schemaStore support to use
								-- schemas from SchemaStore.nvim plugin
								enable = false,
								-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
								url = "",
							},
							schemas = {
								["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
								["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
								["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
								["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
								["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
								["https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json"] = "ks.{yml,yaml}",
								["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
								["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
								["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
								["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
								-- ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
								-- ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
								-- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
								-- kubernetes = "*.yaml",
							},
						},
					},
				},
			},
		},
	},
	{
		"someone-stole-my-name/yaml-companion.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		ft = { "yaml" },
		opts = {
			builtin_matchers = {
				kubernetes = { enabled = true },
			},
			-- You need to declare schemas here and in lspconfig.settings.yaml.schemas to get them to show up in lualine
			schemas = {
				{
					name = "Kustomization",
					uri = "https://json.schemastore.org/kustomization.json",
				},
				{
					name = "Fluxtomization",
					uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json",
				},
				{
					name = "GitHub Workflow",
					uri = "https://json.schemastore.org/github-workflow.json",
				},
				{
					name = "Kubernetes 1.30.1",
					uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.1-standalone-strict/all.json",
				},
			},
			lspconfig = {
				flags = {
					debounce_text_changes = 150,
				},
				settings = {
					yaml = {
						validate = true,
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemaDownload = { enable = true },
						schemas = {},
						trace = { server = "debug" },
						-- schemas = {
						--   ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
						-- },
					},
				},
			},
		},
		config = function(_, opts)
			local cfg = require("yaml-companion").setup(opts)
			require("lspconfig")["yamlls"].setup(cfg)
			require("telescope").load_extension("yaml_schema")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, {
				function()
					return require("yaml-companion").get_buf_schema(0)
				end,
				cond = function()
					local schema = require("yaml-companion").get_buf_schema(0)
					if schema.result[1].name == "none" then
						return ""
					end
					return schema.result[1].name
				end,
			})
		end,
	},
}
