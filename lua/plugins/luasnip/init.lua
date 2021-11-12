luasnip = require("luasnip")

local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local events = require("luasnip.util.events")

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
	local file = io.popen(command, "r")
	local res = {}
	for line in file:lines() do
		table.insert(res, line)
	end
	return res
end

luasnip.config.set_config({
	history = true,
	enable_autosnippets = true,
})

luasnip.snippets = {
	all = {
		s("date_today", f(bash, {}, "date")),
		s("pwd", f(bash, {}, "pwd")),
		s("ls", f(bash, {}, "exa")),
	},
	gitcommit = {
		s({ trig = "feat", name = "feat", dscr = "A new feature ✨" }, t("feat: ")),
		s({ trig = "fix", name = "fix", dscr = "A bug fix 🐛" }, t("fix: ")),
		s({ trig = "docs", name = "docs", dscr = "Documentation only changes 📚" }, t("docs: ")),
		s({
			trig = "style",
			name = "style",
			dscr = "Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)  🔷",
		}, t(
			"style: "
		)),
		s({
			trig = "refactor",
			name = "refactor",
			dscr = "A code change that neither fixes a bug nor adds a feature 📦",
		}, t(
			"refactor: "
		)),
		s({ trig = "perf", name = "perf", dscr = "A code change that improves performance 🚀" }, t("perf: ")),
		s(
			{ trig = "test", name = "test", dscr = "Adding missing tests or correcting existing tests 🆘" },
			t("test: ")
		),
		s(
			{ trig = "chore", name = "chore", dscr = "Other changes that don't modify src or test files ♻️" },
			t("chore: ")
		),
		s({ trig = "revert", name = "revert", dscr = "Reverts a previous commit  ⏪️" }, t("revert: ")),
		s({
			trig = "build",
			name = "build",
			dscr = "Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm) 🛠️",
		}, t(
			"build: "
		)),
		s({
			trig = "ci",
			name = "ci",
			dscr = "Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs) ⚙️",
		}, t(
			"ci: "
		)),
	},
	perl = {
		s("st", { t("$self->_stash($"), i(1, "value"), t(");") }),
		s("cl", { t("$self->clear_str($"), i(1, "str"), t(");") }),
		s("->map", { t("->map( sub ($"), i(1, "el"), t({ ") { ", "" }), i(2), t("});") }),
		s("->each", { t("->each( sub ($"), i(1, "el"), t({ ", $i) { ", "" }), i(2), t("});") }),
		s("sub", { t("sub "), i(1, "routine"), t({ " {", "}" }) }),
	},
	norg = {
		s({ name = "- [ ]", trig = "- [ ]" }, { t("- [ ] "), i(1, "todo") }),
	},
}

vim.cmd([[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'

  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]])

require("luasnip/loaders/from_vscode").lazy_load()
