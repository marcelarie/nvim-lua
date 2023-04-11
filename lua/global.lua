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
