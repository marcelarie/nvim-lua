-- function Dump(o)
-- 	if type(o) == "table" then
-- 		local s = "{ "
-- 		for k, v in pairs(o) do
-- 			if type(k) ~= "number" then
-- 				k = '"' .. k .. '"'
-- 			end
-- 			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
-- 		end
-- 		return s .. "} "
-- 	else
-- 		return tostring(o)
-- 	end
-- end

local function format_key(key)
	if type(key) ~= "number" then
		key = string.format('"%s"', tostring(key))
	end
	return key
end

local function dump_value(value)
	if type(value) == "table" then
		return string.format("{ %s }", Dump_table(value))
	else
		return tostring(value)
	end
end

function Dump_table(tbl)
	local s = ""
	for key, value in pairs(tbl) do
		s = s
			.. string.format("[%s] = %s, ", format_key(key), dump_value(value))
	end
	return s
end

function Dump(obj)
	if type(obj) == "table" then
		return string.format("{ %s }", Dump_table(obj))
	else
		return tostring(obj)
	end
end

local function lsp_diagnostic_toggle()
	local diagnostic_config
	local virtual_text_is_enabled = vim.diagnostic.config().virtual_text == true
	if virtual_text_is_enabled then
		diagnostic_config = Disable_lsp_virtual_text()
	else
		diagnostic_config = Enable_lsp_virtual_text()
	end
	return diagnostic_config, virtual_text_is_enabled
end

function Lsp_diagnostic_toggle_with_message(force_config)
	force_config = force_config or false
	local diagnostic_config = force_config and force_config
		or lsp_diagnostic_toggle()
	vim.diagnostic.config(diagnostic_config)
end
