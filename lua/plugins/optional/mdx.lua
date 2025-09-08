return {
	"davidmh/mdx.nvim",
	config = true,
	-- Only load for MDX files
	ft = { "mdx" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
