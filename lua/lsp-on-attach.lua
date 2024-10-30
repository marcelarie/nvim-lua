local M = {}

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

M.on_attach = on_attach
return M
