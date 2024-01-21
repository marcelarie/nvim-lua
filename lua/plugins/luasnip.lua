return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function()
		local luasnip = require "luasnip"
		local ext_opts = require "luasnip.util.ext_opts"

		local s = luasnip.snippet
		local sn = luasnip.snippet_node
		local isn = luasnip.indent_snippet_node
		local t = luasnip.text_node
		local i = luasnip.insert_node
		local f = luasnip.function_node
		local c = luasnip.choice_node
		local d = luasnip.dynamic_node
		local events = require "luasnip.util.events"

		local function duplicate(args)
			return args[1]
		end

		-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
		function bash(_, _, command)
			print(command)
			if not command then
				return nil
			end

			local file = io.popen(command, "r")
			local res = {}
			for line in file:lines() do
				table.insert(res, line)
			end
			return res
		end

		luasnip.config.set_config {
			history = true,
			update_events = "TextChanged,TextChangedI",
			-- ext_opts = {
			-- 	[require("luasnip.util.types").choiceNode] = {
			-- 		active = {
			-- 			virt_text = { { "🤔", "Yellow" } },
			-- 		},
			-- 	},
			-- },
			enable_autosnippets = true,
		}

		luasnip.add_snippets("all", {
			-- s("date_time_now", f(bash, {}, "date -u +'%Y-%m-%d %H:%M:%S'")),
			s("date_now", f(bash, {}, "date -u +'%Y-%m-%d'")),
			s("pwd", f(bash, {}, "pwd", i(0))),
			s({ trig = "d" }, { f(bash, {}, "date +%Y-%m-%d"), i(0) }),
			s("ls", f(bash, {}, "exa")),
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

		luasnip.add_snippets("perl", {
			s("st", { t "$self->_stash($", i(1, "value"), t ");" }),
			s("cl", { t "$self->clear_str($", i(1, "str"), t ");" }),
			s(
				"->map",
				{
					t "->map( sub ($",
					i(1, "el"),
					t { ") { ", "" },
					i(2),
					t "});",
				}
			),
			s("->each", {
				t "->each( sub ($",
				i(1, "el"),
				t { ", $i) { ", "" },
				i(2),
				t "});",
			}),
			s("->grep", { t "->grep(qr/", i(1, "regex"), t "/i)->first;" }),
			s("sub", { t "sub ", i(1, "routine"), t { " {", "}" } }),
		})

		luasnip.add_snippets("norg", {
			s({ name = "- [ ]", trig = "- [ ]" }, { t "- [ ] ", i(1, "todo") }),
		})

		luasnip.add_snippets("rust", {
			s("pr", { t 'println!("{:?}", ', i(1, "x"), t " )" }),
		})

		-- this two share the same snippets
		local shared_snippets = {
			s({
				trig = "pi",
				name = "pi",
				dscr = "Prettier ignore",
			}, t "<!-- prettier-ignore -->"),
			s({
				trig = "t",
				name = "t",
				dscr = "Todo box",
			}, t "- [ ] "),
			s({
				trig = "jt",
				name = "jt",
				dscr = "Jira Ticket",
			}, {
				t "Jira ticket: [",
				i(1, ""),
				t "](https://stuart-team.atlassian.net/browse/",
				t ")",
			}),
		}
		luasnip.add_snippets("markdown", shared_snippets)
		luasnip.add_snippets("telekasten", shared_snippets)

		luasnip.add_snippets("sh", {})

		-- luasnip.add_snippets("javascript", {
		-- 	s("cl", { t "console.log(", i(1, "var"), t ")" }),
		-- })
		-- luasnip.add_snippets("javascriptreact", {
		-- 	s("cl", { t "console.log(", i(1, "var"), t ")" }),
		-- })
		luasnip.add_snippets("typescript", {
			s("cl", { t "console.log(", i(1, ""), t ");" }),
		})
		luasnip.add_snippets("typescriptreact", {
			s("cl", { t "console.log(", i(1, ""), t ");" }),
		})

		-- WIP
		luasnip.add_snippets("lua", {
			s("key", {
				t 'vim.keymap.set("',
				i(1, ""),
				t '", "<leader>',
				i(2, ""),
				t ", function()",
				i(3, ""),
				t "end, { silent = true })",
			}),
		})

		vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'

  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]

		require("luasnip.loaders.from_vscode").lazy_load()

		-- require("luasnip").filetype_extend("javascript", { "html" })
		-- require("luasnip").filetype_extend("typescript", { "html", "javascript" })
		-- require("luasnip").filetype_extend("javascriptreact", { "html", "javascript" })
		-- require("luasnip").filetype_extend("typescriptreact", { "html", "javascript" })
		-- require("luasnip").filetype_extend("typescript", { "html", "javascript" })
		-- require("luasnip").filetype_extend("javascriptreact", { "html", "javascript" })
		-- require("luasnip").filetype_extend("typescriptreact", { "html", "javascript" })
	end,
}
