return {
	"camspiers/snap",
	config = function()
		-- Basic example config
		local snap = require "snap"
		snap.maps {
			{ "<Leader>sf", snap.config.file { producer = "ripgrep.file" } },
			-- { "<Leader>", snap.config.file { producer = "vim.oldfile" } },
			{
				"<Leader>sF",
				snap.config.file { producer = "ripgrep.file", preview = false },
			},
		}
	end,
}
