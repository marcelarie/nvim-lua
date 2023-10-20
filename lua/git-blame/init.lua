require("gitblame").setup {
	enabled = false,
	date_format = "%x",
	-- position = "left_align",
	-- message_template = "󰋇  <author> • <date> • <summary>",
	message_when_not_committed = "",
	highlight_group = "GitSignsCurrentLineBlame",

	-- By default the commands GitBlameOpenFileURL and GitBlameCopyFileURL open
	-- the current file at latest branch commit.
	-- use_blame_commit_file_urls = true,
}

vim.keymap.set(
	"n",
	"<Leader>gt",
	":GitBlameToggle<cr>",
	{ noremap = true, silent = false }
)

vim.keymap.set(
	"n",
	"<Leader>go",
	":GitBlameOpenFileURL<cr>",
	{ noremap = true, silent = false }
)
