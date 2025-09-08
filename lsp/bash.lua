return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "csh", "ksg", "sh", "zsh" },
	root_markers = { ".git" },
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
}
