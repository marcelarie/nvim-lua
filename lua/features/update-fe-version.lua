local M = {}

local function normalize_ver(s)
	s = s or ""
	s = s:gsub("^%s+", ""):gsub("%s+$", ""):gsub("^v", "")
	return s
end

local function is_semver(s)
	s = normalize_ver(s)
	local major, _minor, _patch, rest = s:match "^(%d+)%.(%d+)%.(%d+)(.*)$"
	if not major then
		return false
	end
	if rest ~= "" then
		if
			not rest:match "^%-[0-9A-Za-z%.%-]+$"
			and not rest:match "^%+[0-9A-Za-z%.%-]+$"
			and not rest:match "^%-[0-9A-Za-z%.%-]+%+[0-9A-Za-z%.%-]+$"
		then
			return false
		end
	end
	return true
end

local function read_text(path)
	if vim.fn.filereadable(path) == 0 then
		return nil
	end
	return table.concat(vim.fn.readfile(path), "\n")
end

local function write_text(path, s)
	vim.fn.writefile(vim.split(s, "\n", { plain = true }), path)
end

local function update_package_json_version_text(path, newv)
	local s = read_text(path)
	if not s then
		error(path .. " not found")
	end
	local replaced
	s, replaced =
		s:gsub('("version"%s*:%s*")([^"]+)(")', "%1" .. newv .. "%3", 1)
	if replaced == 0 then
		error("version field not found in " .. path)
	end
	write_text(path, s)
end

local function update_package_lock_text(path, newv)
	local s = read_text(path)
	if not s then
		return
	end
	s = s:gsub('("version"%s*:%s*")([^"]+)(")', "%1" .. newv .. "%3", 1)
	local pk_start = s:find '%"packages%"%s*:%s*{'
	if pk_start then
		local head = s:sub(1, pk_start - 1)
		local tail = s:sub(pk_start)
		local empty_start = tail:find '%"%"%s*:%s*{'
		if empty_start then
			local before = tail:sub(1, empty_start - 1)
			local rest = tail:sub(empty_start)
			rest = rest:gsub(
				'("version"%s*:%s*")([^"]+)(")',
				"%1" .. newv .. "%3",
				1
			)
			s = head .. before .. rest
		end
	end
	write_text(path, s)
end

function M.UpdateFrontendPackageVersion(new_version)
	new_version = normalize_ver(new_version)
	if not is_semver(new_version) then
		error("Invalid semver: " .. new_version)
	end
	update_package_json_version_text("package.json", new_version)
	update_package_lock_text("package-lock.json", new_version)
	vim.notify("Version set to " .. new_version)
end

vim.api.nvim_create_user_command("UpdateFEVersion", function(opts)
	M.UpdateFrontendPackageVersion(opts.args)
end, { nargs = 1 })

return M
