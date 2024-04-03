if pcall(require, "blame") then
	vim.api.nvim_create_user_command("GitBlameClassic", function()
		pcall(vim.cmd "ToggleBlame window")
	end, {})
end

-- create a command to toggle the quickfix window
vim.api.nvim_create_user_command(
	"TSImportAll",
	typescript_server_import_all,
	{}
)
