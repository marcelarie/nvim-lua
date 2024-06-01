local function colorname_disabled(colorname)
	for _, c in ipairs {
		"iceberg",
		"ayu",
		"edge",
		"nord",
		"palenight",
		"dracula",
		"nordfox"
	} do
		if string.lower(c) == string.lower(colorname) then
			return true
		end
	end
	return false
end

---@diagnostic disable-next-line: unused-local
local function filtered(color, spec)
	for _, c in ipairs(spec.color_names) do
		if colorname_disabled(c) then
			return false
		end
	end
	return true
end

return {
	"linrongbin16/colorbox.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	enabled = true,

	-- don't lazy load
	lazy = false,
	-- load with highest priority
	priority = 1000,

	build = function()
		require("colorbox").update()
	end,
	config = function()
		require("colorbox").setup {
			filter = filtered,
			-- filter = {
			-- 	"primary",
			-- 	---@diagnostic disable-next-line: unused-local
			-- 	function(color, spec)
			-- 		return spec.github_stars >= 1000
			-- 	end,
			-- },
		}
	end,
}
