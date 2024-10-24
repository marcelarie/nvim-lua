-------------------------------------------------------------------------------
--                                 Profiler                                  --
-------------------------------------------------------------------------------

local should_profile = os.getenv "NVIM_PROFILE"
if should_profile then
	require("profile").instrument_autocmds()
	if should_profile:lower():match "^start" then
		require("profile").start "*"
	else
		require("profile").instrument "*"
	end
end

local function toggle_profile()
	local prof = require "profile"
	if prof.is_recording() then
		prof.stop()
		vim.ui.input(
			{
				prompt = "Save profile to:",
				completion = "file",
				default = "profile.json",
			},
			function(filename)
				if filename then
					prof.export(filename)
					vim.notify(string.format("Wrote %s", filename))
				end
			end
		)
	else
		prof.start "*"
	end
end
vim.keymap.set("", "<f1>", toggle_profile)

-------------------------------------------------------------------------------
--                    Marcel Arie's neovim configuration                       |
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- To hide deprecation warning
---@diagnostic disable-next-line: duplicate-set-field
-- vim.deprecate = function() end

require "global"
require "options"

require "lazy-bootstrap"
require "lazy-plugins"
--
require "treesitter-setup"
require "commands"
require "keymaps"
require "autocmd"
require "color-settings"
require "tmux"
require "lsp-setup"

-------------------------------------------------------------------------------
-- vim: ts=2 sts=2 sw=2 et
