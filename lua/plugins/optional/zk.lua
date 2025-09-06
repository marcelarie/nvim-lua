return {
	"zk-org/zk-nvim",
	config = function()
		vim.env.ZK_NOTEBOOK_DIR = os.getenv "HOME" .. "/notes"

		require("zk").setup {
			picker = "telescope", -- "telescope", "fzf" or "select"
			lsp = {
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
				},
				auto_attach = {
					enabled = false,
					filetypes = { "markdown", "md" },
				},
			},
		}

		local notes_dir = "~/notes/"

		vim.keymap.set("n", "<Leader>zk", function()
			print "Notes opened"
			vim.cmd "ZkNotes"
		end, { desc = "Open notes" })

		vim.keymap.set("n", "<Leader>zn", function()
			print "New note created"
			vim.cmd "ZkNew"
		end, { desc = "Create new note" })

		vim.keymap.set("n", "<Leader>zw", function()
			print "Open work notes"
			vim.fn.chdir(notes_dir)
			vim.cmd "split"
			vim.cmd "e ix07-work-to-do-s.md"
			vim.fn.chdir "-"
		end, { desc = "Open work notes" })

		vim.keymap.set("n", "<Leader>zp", function()
			print "Open work notes"
			vim.fn.chdir(notes_dir)
			vim.cmd "split"
			vim.cmd "e hz98-personal-to-do-s.md"
			vim.fn.chdir "-"
		end, { desc = "Open personal notes" })
	end,
}
