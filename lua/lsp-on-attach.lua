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
			vim.lsp.buf.definition()
			-- require("telescope.builtin").lsp_definitions()
		end
	end, "[G]oto Definition [S]plit")

	nmap(
		"gd",
		-- denols does not work with telescope lsp_definitions
		vim.lsp.buf.definition,
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

	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

	---@diagnostic disable-next-line: duplicate-set-field
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		if not contents or vim.tbl_isempty(contents) then
			return
		end

		local link_index = 0 -- Start from 0 to match your format
		local references = {}
		local unique_refs = {} -- Map to keep track of unique URLs

		-- Process lines to convert inline links to reference-style links
		for i, line in ipairs(contents) do
			-- Pattern to match markdown links: [text](url)
			contents[i] = line:gsub("%[(.-)%]%((.-)%)", function(text, url)
				local ref

				-- Check if the URL has already been referenced
				if unique_refs[url] then
					ref = string.format("[%d]", unique_refs[url]) -- Reuse existing reference index
				else
					ref = string.format("[%d]", link_index)
					unique_refs[url] = link_index -- Store the unique reference index
					table.insert(
						references,
						string.format("[%d]: %s", link_index, url)
					)
					link_index = link_index + 1
				end

				return string.format("[%s]%s", text, ref)
			end)
		end

		-- Merge lines only when they contain a link and wrap to the next line
		local merged_contents = {}
		local i = 1
		while i <= #contents do
			local current_line = contents[i]
			local next_line = contents[i + 1]

			-- Check if the current line ends with a link and the next line continues without a break
			if
				next_line
				and current_line:match "%[%d+%]$"
				and next_line:match "^%S"
			then
				-- Merge the current line with the next line
				current_line = current_line .. " " .. next_line
				i = i + 1 -- Skip the next line since it's already merged
			end

			table.insert(merged_contents, current_line)
			i = i + 1
		end

		-- Add an empty line before appending the references
		table.insert(merged_contents, "")

		-- Append unique references to the contents
		for _, ref in ipairs(references) do
			table.insert(merged_contents, ref)
		end

		-- Calculate max_width as the length of the longest line
		local max_width = 0
		for _, line in ipairs(merged_contents) do
			local line_length = #line
			if line_length > max_width then
				max_width = line_length
			end
		end

		-- Calculate max_height as total lines - number of references
		local total_lines = #merged_contents
		local number_of_references = #references
		local max_height = total_lines - number_of_references

		if number_of_references > 0 then
			-- Reduce max_height by 2 to account for the empty line and the references
			max_height = max_height - 2
		end

		-- Debug
		-- print("Processed contents:", vim.inspect(merged_contents))
		-- print("Calculated max_width:", max_width)
		-- print("Calculated max_height:", max_height)

		-- Set max_width and max_height in opts
		opts = opts or {}
		opts.max_width = max_width
		opts.max_height = max_height

		return orig_util_open_floating_preview(
			merged_contents,
			syntax,
			opts,
			...
		)
	end
end

M.on_attach = on_attach
return M
