local date_pattern = "(%d%d)%-(%d%d)" -- m, d
local datetime_pattern = date_pattern .. " (%d+):(%d%d)" -- m, d, h, min
local datetime12_pattern = datetime_pattern .. " (%a%a)" -- m, d, h, min, am/pm
local fulldate_pattern = "(%d%d%d%d)%-" .. date_pattern -- y, m, d
local fulldatetime_pattern = "(%d%d%d%d)%-" .. datetime_pattern -- y, m, d, h, min
local fulldatetime12_pattern = fulldatetime_pattern .. " (%a%a)" -- y, m, d, h, min, am/pm

require("due_nvim").setup({
	prescript = "due: ", -- prescript to due data
	prescript_hi = "Comment", -- highlight group of it
	due_hi = "String", -- highlight group of the data itself
	ft = "*.md", -- filename template to apply aucmds :)
	today = "TODAY", -- text for today's due
	today_hi = "Character", -- highlight group of today's due
	overdue = "OVERDUE", -- text for overdued
	overdue_hi = "Error", -- highlight group of overdued
	date_hi = "Conceal", -- highlight group of date string

	pattern_start = "<", -- start for a date string pattern
	pattern_end = ">", -- end for a date string pattern
	-- lua patterns: in brackets are 'groups of data', their order is described
	-- accordingly. More about lua patterns: https://www.lua.org/pil/20.2.html
	date_pattern = date_pattern, -- m, d
	datetime_pattern = datetime_pattern, -- m, d, h, min
	datetime12_pattern = datetime12_pattern, -- m, d, h, min, am/pm
	fulldate_pattern = fulldate_pattern, -- y, m, d
	fulldatetime_pattern = fulldatetime_pattern, -- y, m, d, h, min
	fulldatetime12_pattern = fulldatetime12_pattern, -- y, m, d, h, min, am/pm
	-- idk how to allow to define the order by config yet,
	-- but you can help me figure it out...

	regex_hi = "\\d*-*\\d\\+-\\d\\+\\( \\d*:\\d*\\( \\a\\a\\)\\?\\)\\?",
	-- vim regex for highlighting, notice double
	-- backslashes cuz lua strings escaping

	-- update_rate = use_clock_time and (use_seconds and 1000 or 60000) or 0,
	-- selects the rate due clocks will update in
	-- milliseconds. 0 or less disables it

	use_clock_time = false, -- display also hours and minutes
	use_clock_today = false, -- do it instead of TODAY
	use_seconds = false, -- if use_clock_time == true, display seconds
	-- as well
	default_due_time = "midnight", -- if use_clock_time == true, calculate time
	-- until option on specified date. Accepts
	-- "midnight", for 23:59:59, or noon, for
	-- 12:00:00
})
