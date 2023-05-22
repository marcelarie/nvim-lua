-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/marcelmanzanares2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/marcelmanzanares2/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/marcelmanzanares2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/marcelmanzanares2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/marcelmanzanares2/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["NeoRoot.lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/NeoRoot.lua",
    url = "https://github.com/nyngwang/NeoRoot.lua"
  },
  ["alpha-nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["better-escape.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/better-escape.nvim",
    url = "https://github.com/max397574/better-escape.nvim"
  },
  ["bufpreview.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/bufpreview.vim",
    url = "https://github.com/kat0h/bufpreview.vim"
  },
  ["calendar-vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/calendar-vim",
    url = "https://github.com/renerocksai/calendar-vim"
  },
  ["carbon.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/carbon.nvim",
    url = "https://github.com/SidOfc/carbon.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcinnamon\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n�\2\0\0\5\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0005\4\t\0=\4\5\3=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\26server_opts_overrides\15suggestion\1\0\4\vaccept\n<M-l>\fdismiss\n<C-]>\tnext\n<M-]>\tprev\n<M-[>\1\0\3\rdebounce\3K\fenabled\2\17auto_trigger\1\npanel\1\0\1\25copilot_node_command\tnode\vkeymap\1\0\5\14jump_prev\a[[\14jump_next\a]]\vaccept\t<CR>\topen\v<M-CR>\frefresh\agr\1\0\2\17auto_refresh\1\fenabled\2\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["crazy8.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/crazy8.nvim",
    url = "https://github.com/zsugabubus/crazy8.nvim"
  },
  ["denops.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/denops.vim",
    url = "https://github.com/vim-denops/denops.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["easypick.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/easypick.nvim",
    url = "https://github.com/axkirillov/easypick.nvim"
  },
  falcon = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-conflict.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["glance-vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/glance-vim",
    url = "https://github.com/tani/glance-vim"
  },
  ["glow.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tglow\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim",
    url = "https://github.com/eddyekofo94/gruvbox-flat.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/npxbr/gruvbox.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["heirline.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/heirline.nvim",
    url = "https://github.com/rebelot/heirline.nvim"
  },
  ["html-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/html-snippets",
    url = "https://github.com/ChristianChiarulli/html-snippets"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["instant.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(let g:instant_username = \"USERNAME\"\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/instant.nvim",
    url = "https://github.com/jbyuki/instant.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["kat.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/kat.nvim",
    url = "https://github.com/katawful/kat.nvim"
  },
  ["lighthaus.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lighthaus.nvim",
    url = "https://github.com/mrjones2014/lighthaus.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["ltex-extra.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/ltex-extra.nvim",
    url = "https://github.com/barreiroleo/ltex-extra.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/melange",
    url = "https://github.com/savq/melange"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["modus-theme-vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/modus-theme-vim",
    url = "https://github.com/ishan9299/modus-theme-vim"
  },
  monarized = {
    config = { "\27LJ\2\nZ\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\27monarized_kitty_colors\22monarized_lualine\6g\bvim\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/monarized",
    url = "https://github.com/jhchabran/monarized"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  neorg = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["no-clown-fiesta.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/no-clown-fiesta.nvim",
    url = "https://github.com/aktersnurra/no-clown-fiesta.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-FeMaco.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfemaco\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-FeMaco.lua",
    url = "https://github.com/AckslD/nvim-FeMaco.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-docs-view"] = {
    commands = { "DocsViewToggle" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\nwidth\3<\rposition\nright\nsetup\14docs-view\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/nvim-docs-view",
    url = "https://github.com/amrbashir/nvim-docs-view"
  },
  ["nvim-highlight-colors"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-lsp",
    url = "https://github.com/neovim/nvim-lsp"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-lsputils",
    url = "https://github.com/RishabhRD/nvim-lsputils"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-luapad",
    url = "https://github.com/rafcamlet/nvim-luapad"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-solarized-lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-solarized-lua",
    url = "https://github.com/ishan9299/nvim-solarized-lua"
  },
  ["nvim-surround"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-test"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-test\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-test",
    url = "https://github.com/klen/nvim-test"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-trevJ.lua"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-trevJ.lua",
    url = "https://github.com/AckslD/nvim-trevJ.lua"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["open.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/open.nvim",
    url = "https://github.com/ofirgall/open.nvim"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/shaunsingh/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["peek.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/peek.nvim",
    url = "https://github.com/toppair/peek.nvim"
  },
  ["persisted.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/persisted.nvim",
    url = "https://github.com/olimorris/persisted.nvim"
  },
  ["persistence.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["sad.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/sad.nvim",
    url = "https://github.com/ray-x/sad.nvim"
  },
  ["sg.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/sg.nvim",
    url = "https://github.com/tjdevries/sg.nvim"
  },
  ["smart-pairs"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/smart-pairs",
    url = "https://github.com/ZhiyuanLck/smart-pairs"
  },
  ["sort.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tsort\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/sort.nvim",
    url = "https://github.com/sQVe/sort.nvim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["substitute.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/substitute.nvim",
    url = "https://github.com/gbprod/substitute.nvim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telekasten.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim",
    url = "https://github.com/dhruvmanila/telescope-bookmarks.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-http.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-http.nvim",
    url = "https://github.com/barrett-ruth/telescope-http.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["text-case.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\5\0009\0\6\0009\0\a\0'\2\f\0'\3\t\0'\4\n\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Telescope\6v\1\0\1\tdesc\14Telescope\26TextCaseOpenTelescope\bga.\6n\20nvim_set_keymap\bapi\bvim\19load_extension\14telescope\nsetup\rtextcase\frequire\0" },
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tree-sitter-just"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/tree-sitter-just",
    url = "https://github.com/IndianBoy42/tree-sitter-just"
  },
  ["trim.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/trim.nvim",
    url = "https://github.com/cappyzawa/trim.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["typst.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/typst.vim",
    url = "https://github.com/kaarmu/typst.vim"
  },
  undotree = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vCoolor.vim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vCoolor.vim",
    url = "https://github.com/KabbAmine/vCoolor.vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-ai"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-ai",
    url = "https://github.com/madox2/vim-ai"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-gruvbox8",
    url = "https://github.com/lifepillar/vim-gruvbox8"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-lsp-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-lsp-snippets",
    url = "https://github.com/thomasfaingnaert/vim-lsp-snippets"
  },
  ["vim-monokai-pro"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-monokai-pro",
    url = "https://github.com/phanviet/vim-monokai-pro"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-react-snippets",
    url = "https://github.com/mlaursen/vim-react-snippets"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-system-copy"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-system-copy",
    url = "https://github.com/christoomey/vim-system-copy"
  },
  ["vim-tridactyl"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-tridactyl",
    url = "https://github.com/tridactyl/vim-tridactyl"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  vimtex = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/jubnzv/virtual-types.nvim"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets",
    url = "https://github.com/dsznajder/vscode-es7-javascript-react-snippets"
  },
  ["winbar.nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/winbar.nvim",
    url = "https://github.com/fgheng/winbar.nvim"
  },
  ["zk-nvim"] = {
    loaded = true,
    path = "/Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/start/zk-nvim",
    url = "https://github.com/mickael-menu/zk-nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^sqlite"] = "sqlite.lua"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: mkdir.nvim
time([[Config for mkdir.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
time([[Config for mkdir.nvim]], false)
-- Config for: glow.nvim
time([[Config for glow.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tglow\frequire\0", "config", "glow.nvim")
time([[Config for glow.nvim]], false)
-- Config for: nvim-FeMaco.lua
time([[Config for nvim-FeMaco.lua]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfemaco\frequire\0", "config", "nvim-FeMaco.lua")
time([[Config for nvim-FeMaco.lua]], false)
-- Config for: nvim-test
time([[Config for nvim-test]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-test\frequire\0", "config", "nvim-test")
time([[Config for nvim-test]], false)
-- Config for: sort.nvim
time([[Config for sort.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\tsort\frequire\0", "config", "sort.nvim")
time([[Config for sort.nvim]], false)
-- Config for: instant.nvim
time([[Config for instant.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0(let g:instant_username = \"USERNAME\"\bcmd\bvim\0", "config", "instant.nvim")
time([[Config for instant.nvim]], false)
-- Config for: monarized
time([[Config for monarized]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\3\0K\0\1\0\27monarized_kitty_colors\22monarized_lualine\6g\bvim\0", "config", "monarized")
time([[Config for monarized]], false)
-- Config for: text-case.nvim
time([[Config for text-case.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\5\0009\0\6\0009\0\a\0'\2\f\0'\3\t\0'\4\n\0005\5\r\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Telescope\6v\1\0\1\tdesc\14Telescope\26TextCaseOpenTelescope\bga.\6n\20nvim_set_keymap\bapi\bvim\19load_extension\14telescope\nsetup\rtextcase\frequire\0", "config", "text-case.nvim")
time([[Config for text-case.nvim]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-cmp ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'DocsViewToggle', function(cmdargs)
          require('packer.load')({'nvim-docs-view'}, { cmd = 'DocsViewToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-docs-view'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('DocsViewToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typ ++once lua require("packer.load")({'typst.vim'}, { ft = "typ" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'smart-pairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]], true)
vim.cmd [[source /Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]]
time([[Sourcing ftdetect script at: /Users/marcelmanzanares2/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
