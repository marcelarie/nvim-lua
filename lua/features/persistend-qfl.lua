local M = {}
local qf_deleted_stack = {}

local DEFAULT_QF_PATH = vim.fn.stdpath "data" .. "/quickfix_list.txt"

M.DEFAULT_QF_PATH = DEFAULT_QF_PATH

function M.QfSave()
	local items = vim.fn.getqflist()
	if #items == 0 then
		return
	end
	local out = {}
	for _, it in ipairs(items) do
		table.insert(out, {
			filename = (it.bufnr and it.bufnr > 0)
					and vim.api.nvim_buf_get_name(it.bufnr)
				or it.filename,
			lnum = it.lnum,
			col = it.col,
			text = it.text,
			type = it.type,
		})
	end
	vim.fn.writefile({ vim.fn.json_encode(out) }, DEFAULT_QF_PATH)
	return DEFAULT_QF_PATH
end

function M.QfLoad(opts)
	opts = opts or {}
	if vim.fn.filereadable(DEFAULT_QF_PATH) == 0 then
		return
	end

	local content = table.concat(vim.fn.readfile(DEFAULT_QF_PATH), "\n")
	local ok, decoded = pcall(vim.fn.json_decode, content)
	if not ok or type(decoded) ~= "table" or #decoded == 0 then
		return
	end

	vim.fn.setqflist({}, "r", { items = decoded })

	local has_args = vim.fn.argc() > 0
	local should_open = (opts.open ~= false) and not has_args
	if not should_open then
		return
	end

	local curwin = vim.api.nvim_get_current_win()
	local qf_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_open = true
			break
		end
	end
	if not qf_open then
		vim.cmd "botright copen"
	end
	pcall(vim.api.nvim_set_current_win, curwin)
end

function M.QfDeletePersistentFile()
	local delete_file_action_result = vim.fn.delete(DEFAULT_QF_PATH)

	if delete_file_action_result ~= 0 then
		vim.notify(
			"Failed to delete: "
				.. DEFAULT_QF_PATH
				.. " (rc="
				.. tostring(delete_file_action_result)
				.. ")",
			vim.log.levels.WARN
		)
		return false
	end
	return true
end

function M.QfDelCurrentEntry()
	if vim.bo.filetype ~= "qf" then
		return
	end
	local idx = vim.fn.line "."
	local qf = vim.fn.getqflist()
	if idx < 1 or idx > #qf then
		return
	end

	table.insert(qf_deleted_stack, { idx = idx, item = qf[idx] })
	table.remove(qf, idx)

	vim.fn.setqflist({}, "r", { items = qf })
	if #qf == 0 then
		vim.cmd.cclose()
	end
end

function M.QfUndoDeletedEntry()
	if #qf_deleted_stack == 0 then
		return
	end
	local last = table.remove(qf_deleted_stack) -- pop
	local qf = vim.fn.getqflist()
	table.insert(qf, last.idx, last.item) -- re-insert
	vim.fn.setqflist({}, "r", { items = qf })
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		M.QfLoad()
	end,
})

vim.api.nvim_create_user_command("QfDeletePersistentFile", function(opts)
	M.QfDeletePersistentFile()
end, { nargs = "?" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "dd", function()
			M.QfDelCurrentEntry()
		end, { buffer = true, desc = "Delete quickfix entry" })

		vim.keymap.set("n", "u", function()
			M.QfUndoDeletedEntry()
		end, { buffer = true, desc = "Undo quickfix delete" })
	end,
})

return M
