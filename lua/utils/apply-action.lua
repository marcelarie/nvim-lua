local M = {}

-- helper that applies the chosen action and tells you if it worked
function M.apply(action, cid)
	if action.edit then
		return vim.lsp.util.apply_workspace_edit(
			action.edit,
			vim.lsp.get_client_by_id(cid).offset_encoding
		)
	elseif action.command then
		vim.lsp.buf.execute_command(action.command)
		return true
	end
end

return M
