vim.api.nvim_set_hl(0, "RefIdentifier", { fg = "#50fa7b", bold = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "md" },
	callback = function()
		-- vim.fn.matchadd("RefIdentifier", "\\v\\]\\zs\\[[^]]+\\]") -- the whole [label]
		vim.fn.matchadd("RefNumberOnly", "\\v\\[\\zs\\d+\\ze\\]") -- the number only
		vim.api.nvim_set_hl(0, "RefNumberOnly", { fg = "#ff79c6", bold = false })
	end,
})

-- highlight the inline code in markdown
vim.api.nvim_set_hl(
	0,
	"@ref.number.markdown_inline",
	{ fg = "#ff79c6", bold = true }
)

-- highlight the labels in markdown links
vim.api.nvim_set_hl(0, "@ref.number.markdown", { fg = "#ff79c6", bold = false })
