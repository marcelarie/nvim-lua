local M = { path = {} }

function M.get_typescript_server_path(root_dir)
	local project_roots = vim.fs.find(
		"node_modules",
		{ path = root_dir, upward = true, limit = math.huge }
	)
	for _, project_root in ipairs(project_roots) do
		local typescript_path = project_root .. "/typescript"
		local stat = vim.loop.fs_stat(typescript_path)
		if stat and stat.type == "directory" then
			return typescript_path .. "/lib"
		end
	end
	return ""
end

return M
