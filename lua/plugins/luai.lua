return {
	"tjdevries/luai.nvim",
	enabled = false,
	config = function()
		-- Required:
		require("luai").setup {
			-- Right now, I only support anthropic because we use some of the caching stuff.
			-- I don't care, you can send a PR and maybe I won't reject (but likely will).
			token = "ANTHROPIC_TOKEN",
		}
	end,
}
