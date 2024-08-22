return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local otter = require "otter"

		otter.setup {
			lsp = {
				-- `:h events` that cause the diagnostics to update. Set to:
				-- { "BufWritePost", "InsertLeave", "TextChanged" } for less performant
				-- but more instant diagnostic updates
				diagnostic_update_events = { "BufWritePost" },
				-- function to find the root dir where the otter-ls is started
				root_dir = function(_, bufnr)
					return vim.fs.root(bufnr or 0, {
						".git",
						"_quarto.yml",
						"package.json",
					}) or vim.fn.getcwd(0)
				end,
			},
			buffers = {
				-- if set to true, the filetype of the otterbuffers will be set.
				-- otherwise only the autocommand of lspconfig that attaches
				-- the language server will be executed without setting the filetype
				set_filetype = false,
				-- write <path>.otter.<embedded language extension> files
				-- to disk on save of main buffer.
				-- usefule for some linters that require actual files
				-- otter files are deleted on quit or main buffer close
				write_to_disk = false,
			},
			strip_wrapping_quote_characters = { "'", '"', "`" },
			-- otter may not work the way you expect when entire code blocks are indented (eg. in Org files)
			-- When true, otter handles these cases fully.
			handle_leading_whitespace = true,
		}

		vim.api.nvim_create_user_command("OtterActivate", function()
			require("otter").activate()
		end, {
			desc = "Activate otter.nvim",
		})
	end,
}
