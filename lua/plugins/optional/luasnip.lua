return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	-- Lazy load on insert mode to improve startup
	event = "InsertEnter",
	config = function()
		local luasnip = require "luasnip"
		local extras = require "luasnip.extras"

		-- Only load what we actually use
		local s = luasnip.snippet
		local t = luasnip.text_node
		local i = luasnip.insert_node
		local f = luasnip.function_node

		-- Minimal config for better performance
		luasnip.config.set_config {
			history = false, -- Disable history for better performance
			update_events = "TextChangedI", -- Only update on insert changes
			enable_autosnippets = false, -- Disable autosnippets for performance
		}

		-- Load essential snippets immediately (lightweight)
		luasnip.add_snippets("all", {
			-- Simple date snippets without shell execution
			s("date", t(os.date "%d-%m-%Y")),
			s("date_iso", t(os.date "%Y-%m-%d")),
			s("date_time", t(os.date "%Y-%m-%d %H:%M:%S")),
		})

		luasnip.add_snippets("gitcommit", {
			s(
				{ trig = "feat", name = "feat", dscr = "A new feature ✨" },
				t "feat: "
			),
			s(
				{ trig = "fix", name = "fix", dscr = "A bug fix 🐛" },
				t "fix: "
			),
			s({
				trig = "docs",
				name = "docs",
				dscr = "Documentation only changes 📚",
			}, t "docs: "),
			s({
				trig = "style",
				name = "style",
				dscr = "Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)  🔷",
			}, t "style: "),
			s({
				trig = "refactor",
				name = "refactor",
				dscr = "A code change that neither fixes a bug nor adds a feature 📦",
			}, t "refactor: "),
			s({
				trig = "perf",
				name = "perf",
				dscr = "A code change that improves performance 🚀",
			}, t "perf: "),
			s({
				trig = "test",
				name = "test",
				dscr = "Adding missing tests or correcting existing tests 🆘",
			}, t "test: "),
			s({
				trig = "chore",
				name = "chore",
				dscr = "Other changes that don't modify src or test files ♻️",
			}, t "chore: "),
			s({
				trig = "revert",
				name = "revert",
				dscr = "Reverts a previous commit  ⏪️",
			}, t "revert: "),
			s({
				trig = "build",
				name = "build",
				dscr = "Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm) 🛠️",
			}, t "build: "),
			s({
				trig = "ci",
				name = "ci",
				dscr = "Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs) ⚙️",
			}, t "ci: "),
		})

		-- Load shared snippets immediately (used across multiple filetypes)
		local shared_snippets = {
			s("pi", t "<!-- prettier-ignore -->"),
			s("to", { t "- [ ] ", i(1) }),
			s("bold", { t "**", i(1, "text"), t "**" }),
		}
		luasnip.add_snippets("markdown", shared_snippets)
		luasnip.add_snippets("telekasten", shared_snippets)
		luasnip.add_snippets("norg", shared_snippets)

		-- Essential Lua snippet for config editing
		luasnip.add_snippets("lua", {
			s("key", {
				t 'vim.keymap.set("',
				i(1, ""),
				t '", "<leader>',
				i(2, ""),
				t ", function() ",
				i(3, ""),
				t " end)",
			}),
		})

		-- Optimized keymaps using Lua API instead of vim.cmd
		vim.keymap.set("i", "<C-k>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				return "<C-k>"
			end
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<C-j>", function()
			luasnip.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })

		-- Minimal language configuration - only load what you actively use
		local ENABLED_LANGUAGES = {
			"lua", -- Essential for Neovim config
			"markdown", -- Documentation and notes
			-- Add more languages as needed:
			-- "javascript", "typescript", "python", "rust", "go", etc.
		}

		-- Global function to enable additional languages
		_G.luasnip_enable_lang = function(lang)
			if vim.tbl_contains(ENABLED_LANGUAGES, lang) then
				print(lang .. " already enabled")
				return
			end

			table.insert(ENABLED_LANGUAGES, lang)

			-- Load VSCode snippets for this language
			require("luasnip.loaders.from_vscode").lazy_load {
				include = { lang },
			}

			-- Load custom snippets if any
			local custom_snippets = get_custom_snippets(lang)
			if #custom_snippets > 0 then
				luasnip.add_snippets(lang, custom_snippets)
			end

			print("Enabled snippets for: " .. lang)
		end

		-- Custom snippets per language
		local function get_custom_snippets(lang)
			local snippets = {
				javascript = {
					s("cl", { t "console.log(", i(1, ""), t ");" }),
				},
				typescript = {
					s("cl", { t "console.log(", i(1, ""), t ");" }),
				},
				python = {
					s("pr", { t "print(", i(1, ""), t ")" }),
				},
				rust = {
					s("pr", { t 'println!("{:?}", ', i(1, "foo"), t ");" }),
				},
				perl = {
					s("st", { t "$self->_stash($", i(1, "value"), t ");" }),
				},
				go = {
					s("pr", { t 'fmt.Printf("%+v\\n", ', i(1, ""), t ")" }),
				},
			}
			return snippets[lang] or {}
		end

		-- Load only enabled languages
		vim.defer_fn(function()
			-- Load VSCode snippets only for enabled languages
			if #ENABLED_LANGUAGES > 0 then
				require("luasnip.loaders.from_vscode").lazy_load {
					include = ENABLED_LANGUAGES,
				}

				-- Load custom snippets for enabled languages
				for _, lang in ipairs(ENABLED_LANGUAGES) do
					local custom = get_custom_snippets(lang)
					if #custom > 0 then
						luasnip.add_snippets(lang, custom)
					end
				end
			end
		end, 300) -- Faster loading since we're doing less

		-- Create user commands for managing languages
		vim.api.nvim_create_user_command("LuaSnipEnable", function(opts)
			luasnip_enable_lang(opts.args)
		end, {
			nargs = 1,
			complete = function()
				return {
					"javascript",
					"typescript",
					"python",
					"rust",
					"go",
					"perl",
					"java",
					"c",
					"cpp",
				}
			end,
		})

		vim.api.nvim_create_user_command("LuaSnipList", function()
			print(
				"Enabled languages: " .. table.concat(ENABLED_LANGUAGES, ", ")
			)
		end, {})
	end,
}
