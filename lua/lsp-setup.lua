local lsp_setup = require "lsp-on-attach"
local lsp_on_attach = lsp_setup.on_attach

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	-- clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {
	-- 	cargo = {lsp
	-- 		allFeatures = true,
	-- 	},
	-- 	diagnostics = {
	-- 		enable = true,
	-- 		experimental = {
	-- 			enable = true,
	-- 		},
	-- 	},
	-- },
	ts_ls = {
		-- single_file_support = false,
		root_dir = require("lspconfig").util.root_pattern "yarn.lock"
			or require("lspconfig").util.root_pattern(
				"package.json",
				"tsconfig.json",
				"jsconfig.json",
				".git"
			),
	},
	-- html = { filetypes = { 'html', 'twig', 'hbs'} },
	eslint = { filetypes = { "javascript", "typescript", "typescriptreact" } },
	html = { filetypes = { "html", "twig", "hbs" } },
	harper_ls = {
		autostart = true,
		filetypes = {
			"md",
			"typ",
			"markdown",
		},
	},
	-- grammarly = {
	-- 	filetypes = { "markdown", "md", "typ" },
	-- },
	marksman = { autostart = false },
	-- zk = {
	--   autostart = true,
	-- },
	denols = {
		settings = {
			deno = {
				enable = true,
				unstable = true,
				lint = true,
				codeLens = {
					implementations = true,
					references = true,
				},
				suggest = {
					imports = {
						hosts = {
							["https://deno.land"] = true,
						},
					},
				},
			},
		},
		root_dir = require("lspconfig").util.root_pattern(
			"deno.json",
			"deno.jsonc"
		),
	},
	-- llm_ls = {
	-- 	model = "codellama:7b",
	-- 	url = "http://localhost:11434", -- llm-ls uses "/api/generate"
	-- 	-- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
	-- 	request_body = {
	-- 		-- Modelfile options for the model you use
	-- 		options = {
	-- 			temperature = 0.2,
	-- 			top_p = 0.95,
	-- 		},
	-- 	},
	-- },

	mdx_analyzer = {
		filetypes = { "mdx" },
	},

	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}

-- Setup neovim lua configuration
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		local config = servers[server_name] or {}

		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
			on_attach = lsp_on_attach,
			autostart = config.autostart,
			settings = config.settings,
			root_dir = config.root_dir,
			filetypes = config.filetypes,
			single_file_support = config.single_file_support,
		}
	end,
}

-- vim: ts=2 sts=2 sw=2 et
