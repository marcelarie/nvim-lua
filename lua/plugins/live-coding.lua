-- Ethersync enables real-time collaborative editing of local text files. You
-- can use it for pair programming or note-taking, for example. It's the
-- missing real-time complement to Git!
--
-- More info here: https://github.com/ethersync/ethersync

return {
	"ethersync/ethersync-nvim",
	keys = { { "<leader>j", "<cmd>EthersyncJumpToCursor<cr>" } },
	lazy = false,
}
