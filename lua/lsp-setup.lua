-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
	-- NOTE: Remember that lua is a real programming language, and as such it is possible
	-- to define small helper and utility functions so you don't have to repeat yourself
	-- many times.
	--
	-- In this case, we create a function that lets us more easily define mappings specific
	-- for LSP related items. It sets the mode, buffer and description for us each time.
	-- Copy content of client to clipboard

	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>a", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gp", function()
		vim.cmd "vsplit"
		-- denols does not work with telescope lsp_definitions
		if client.name == "denols" then
			vim.lsp.buf.definition()
		else
			require("telescope.builtin").lsp_definitions()
		end
	end, "[G]oto Definition [S]plit")

	nmap(
		"gd",
		-- denols does not work with telescope lsp_definitions
		client.name == "denols" and vim.lsp.buf.definition
			or require("telescope.builtin").lsp_definitions,
		"[G]oto [D]efinition"
	)

	nmap(
		"<leader>gd",
		-- denols does not work with telescope lsp_definitions
		client.name == "denols" and vim.lsp.buf.definition
			or require("telescope.builtin").lsp_definitions,
		"[G]oto [D]efinition"
	)
	nmap(
		"gr",
		client.name == "denols" and vim.lsp.buf.references
			or require("telescope.builtin").lsp_references,
		"[G]oto [R]eferences"
	)
	nmap(
		"gI",
		require("telescope.builtin").lsp_implementations,
		"[G]oto [I]mplementation"
	)
	nmap(
		"<leader>D",
		require("telescope.builtin").lsp_type_definitions,
		"Type [D]efinition"
	)
	nmap(
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		"[D]ocument [S]ymbols"
	)
	nmap(
		"<leader>ws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		"[W]orkspace [S]ymbols"
	)

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	nmap(
		"<Leader>z",
		vim.diagnostic.open_float,
		"Check current line for errors"
	)
	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap(
		"<leader>wa",
		vim.lsp.buf.add_workspace_folder,
		"[W]orkspace [A]dd Folder"
	)
	nmap(
		"<leader>wr",
		vim.lsp.buf.remove_workspace_folder,
		"[W]orkspace [R]emove Folder"
	)
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	client.server_capabilities.documentFormattingProvider = true

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format {
			filter = function(client)
				return client.name ~= "lua_ls"
			end,
		}
	end, { desc = "Format current buffer with LSP" })
end

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
	rust_analyzer = {
		cargo = {
			allFeatures = true,
		},
		diagnostics = {
			enable = true,
			experimental = {
				enable = true,
			},
		},
	},
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
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
			on_attach = on_attach,
			autostart = config.autostart,
			settings = config.settings,
			root_dir = config.root_dir,
			filetypes = config.filetypes,
			single_file_support = config.single_file_support,
		}
	end,
}

-- vim.diagnostic.config {
-- 	update_in_insert = false,
-- }

-- vim: ts=2 sts=2 sw=2 et
