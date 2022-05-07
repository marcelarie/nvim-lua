local function root()
	return vim.fn.getcwd()
end

require("lspconfig").zeta_note.setup {
	root_dir = root,
	cmd = { "/home/marcel/programs/zeta-note-bin" },
}
