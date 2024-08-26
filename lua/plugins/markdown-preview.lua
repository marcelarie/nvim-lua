return {
	"iamcco/markdown-preview.nvim",
	cmd = {
		"MarkdownPreviewToggle",
		"MarkdownPreview",
		"MarkdownPreviewStop",
	},
	ft = { "markdown" },
	keys = {
		{
			"<leader>mp",
			"<cmd>MarkdownPreview<cr>",
			desc = "Preview markdown",
			mode = { "n", "v" },
		},
	},
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
