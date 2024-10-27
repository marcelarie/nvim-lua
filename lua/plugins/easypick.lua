return {
	"axkirillov/easypick.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = true,
	config = function()
		local easypick = require "easypick"

		easypick.setup {
			pickers = {
				-- Show changed files in the last 5 commits
				{
					name = "changed_files",
					command = "{ git diff --name-only && git log --pretty=format: --name-only HEAD~5..HEAD; } | sort | uniq",
					previewer = easypick.previewers.branch_diff {
						base_branch = "HEAD~5",
					},
					-- previewer = easypick.previewers.file_diff(),
					-- previewer = easypick.previewers.default(),
				},
				-- Show conflicts in the current branch
				{
					name = "conflicts",
					command = "git diff --name-only --diff-filter=U --relative",
					previewer = easypick.previewers.file_diff(),
				},
				-- Show staged files
				{
					name = "staged_files",
					command = "git diff --name-only --diff-filter=AM --cached --relative",
					previewer = easypick.previewers.file_diff(),
				},
				-- Show untracked files
				{
					name = "untracked_files",
					command = "git ls-files --others --exclude-standard --exclude=.gitignore",
					previewer = easypick.previewers.default(),
				},
				-- Show non staged files
				{
					name = "non_staged_files",
					command = "git diff --name-only --diff-filter=AM --relative",
					previewer = easypick.previewers.file_diff(),
				},
				-- Show all env files
				{
					name = "env_files",
					command = 'find . -type f -name ".env" | sort -V',
					previewer = easypick.previewers.default(),
				},
			},
		}

		-- vim.keymap.set("n", "<leader>rr", "<cmd>Easypick<CR>")
		-- vim.keymap.set("n", "<leader>cf", "<cmd>Easypick changed_files<CR>")
		-- vim.keymap.set("n", "<leader>mc", "<cmd>Easypick conflicts<CR>")
		-- vim.keymap.set("n", "<leader>es", "<cmd>Easypick staged_files<CR>")
		-- vim.keymap.set("n", "<leader>eu", "<cmd>Easypick untracked_files<CR>")
		-- vim.keymap.set("n", "<leader>en", "<cmd>Easypick non_staged_files<CR>")
	end,
	cmd = "Easypick",
	keys = {
		{ "<leader>rr", "<cmd>Easypick<CR>" },
		{ "<leader>cf", "<cmd>Easypick changed_files<CR>" },
		{ "<leader>mc", "<cmd>Easypick conflicts<CR>" },
		{ "<leader>es", "<cmd>Easypick staged_files<CR>" },
		{ "<leader>eu", "<cmd>Easypick untracked_files<CR>" },
		{ "<leader>en", "<cmd>Easypick non_staged_files<CR>" },
	},
}
