-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- Lazy load debug only when needed
	keys = {
		"<F5>",
		"<F1>",
		"<F2>",
		"<F3>",
		"<leader>b",
		"<leader>B",
		"<F7>",
		"<space>?",
	},
	cmd = {
		"DapToggleBreakpoint",
		"DapContinue",
		"DapStepInto",
		"DapStepOver",
		"DapStepOut",
	},
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Installs the debug adapters for you
		{ "williamboman/mason.nvim", version = "1.11.0" },
		"jay-babu/mason-nvim-dap.nvim",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require "dap"
		local dapui = require "dapui"

		require("mason-nvim-dap").setup {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"delve",
			},
		}

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set(
			"n",
			"<F5>",
			dap.continue,
			{ desc = "Debug: Start/Continue" }
		)
		vim.keymap.set(
			"n",
			"<F1>",
			dap.step_into,
			{ desc = "Debug: Step Into" }
		)
		vim.keymap.set(
			"n",
			"<F2>",
			dap.step_over,
			{ desc = "Debug: Step Over" }
		)
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set(
			"n",
			"<leader>b",
			dap.toggle_breakpoint,
			{ desc = "Debug: Toggle Breakpoint" }
		)
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
		end, { desc = "Debug: Set Breakpoint" })

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup {
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		}

		-- local function expand_cargo(option)
		-- 	if option == "${cargo:program}" then
		-- 		-- ...
		-- 	end
		-- 	return option
		-- end

		-- dap.adapters.codelldb = {
		-- 	type = "server",
		-- 	port = "${port}",
		-- 	executable = {
		-- 		command = "/usr/bin/codelldb",
		-- 		args = { "--port", "${port}" },
		-- 	},
		-- 	-- enrich_config = function(config, on_config)
		-- 	-- 	on_config(vim.tbl_map(expand_cargo, config))
		-- 	-- end,
		-- }

		dap.configurations.rust = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input(
						"Path to executable: ",
						vim.fn.getcwd() .. "/target/debug/",
						"file"
					)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		vim.keymap.set(
			"n",
			"<F7>",
			dapui.toggle,
			{ desc = "Debug: See last session result." }
		)

		-- Eval var under cursor
		vim.keymap.set("n", "<space>?", function()
			require("dapui").eval(nil, { enter = true })
		end)

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()
	end,
}
