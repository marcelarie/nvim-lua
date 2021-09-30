-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/marcel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  LuaSnip = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-nvim-tags"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-treesitter"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["commented.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/commented.nvim"
  },
  ["contextprint.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/contextprint.nvim"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/crates.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  falcon = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/falcon"
  },
  ["focus.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-flat.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gruvbox-flat.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/harpoon"
  },
  ["html-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/html-snippets"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  melange = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/melange"
  },
  ["modus-theme-vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  neoformat = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neuron.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/neuron.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["numb.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lsp"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-solarized-lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-solarized-lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["refactoring.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/refactoring.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/registers.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-arecibo.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-arecibo.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trim.nvim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/trim.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vCoolor.vim"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vCoolor.vim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-convert-color-to"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-convert-color-to"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gruvbox8"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-gruvbox8"
  },
  ["vim-hexrgba"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-hexrgba"
  },
  ["vim-kitty"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-kitty"
  },
  ["vim-lsp-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-lsp-snippets"
  },
  ["vim-monokai-pro"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-monokai-pro"
  },
  ["vim-react-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-react-snippets"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-system-copy"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-system-copy"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimtex = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vimtex"
  },
  ["vscode-es7-javascript-react-snippets"] = {
    loaded = true,
    path = "/home/marcel/.local/share/nvim/site/pack/packer/start/vscode-es7-javascript-react-snippets"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
