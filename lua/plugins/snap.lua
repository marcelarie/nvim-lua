return {
	"camspiers/snap",
	enabled = false,
	config = function()
		-- Basic example config
		local snap = require "snap"
		snap.maps {
			{
				"<Leader>sf",
				function()
					snap.run {
						producer = snap.get "consumer.fzf"(
							snap.get "producer.ripgrep.file"
						),
						select = snap.get("select.file").select,
						multiselect = snap.get("select.file").multiselect,
						views = { snap.get "preview.file" },
					}
				end,
			},
			{
				"<Leader>sF",
				snap.config.file { producer = "ripgrep.file", preview = false },
			},
			{
				"<Leader>sg",
				function()
					snap.run {
						producer = snap.get "producer.ripgrep.vimgrep",
						steps = {
							{
								consumer = snap.get "consumer.fzf",
								config = { prompt = "FZF>" },
							},
						},
						select = snap.get("select.file").select,
						multiselect = snap.get("select.file").multiselect,
						views = { snap.get "preview.file" },
					}
				end,
			},
			{
				"<Leader>sb",
				function()
					snap.run {
						producer = snap.get "consumer.fzf"(
							snap.get "producer.vim.buffer"
						),
						select = snap.get("select.file").select,
						multiselect = snap.get("select.file").multiselect,
						views = { snap.get "preview.file" },
					}
				end,
			},
		}
	end,
}
