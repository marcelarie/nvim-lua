-- /// BASE ///.
require("plugins") -- ./lua/plugins.lua
require("settings") -- ./lua/settings.lua
require("colorscheme") -- ./lua/colorscheme.lua
require("aliases") -- ./lua/aliases.lua
require("globals") -- ./lua/globals.lua
require("autocommands") -- ./lua/autocommands.lua
require("impatient") -- ./lua/impatient/init.lua
-- /// REMAPS ///.
require("remaps") -- ./lua/remaps.lua
require("leader-remaps") -- ./lua/leader-remaps.lua

-- /// TREE & EXPLORERS ///.
require("plugins.lualine-status") -- ./lua/plugins/lualine-status/init.lua
require("plugins.nvim-tree") -- ./lua/plugins/nvim-tree/init.lua
require("vim-keybindings") -- ./lua/vim-keybindings/init.lua
--
-- /// NAVIGATION ///.
require("nv-telescope") -- ./lua/nv-telescope/init.lua
require("telescope-keybindings") -- ./lua/telescope-keybindings.lua

-- /// LS & SYNTAX ///.
require("plugins.cmp-setup") -- ./lua/plugins/cmp-setup/init.lua
require("plugins.treesitter") -- ./lua/plugins/treesitter/init.lua
require("lsp") -- ./lua/lsp/
require("lsp.lua") -- ./lua/lsp/lua.lua

-- /// Git ///
-- require("octo") -- ./lua/octo/init.lua
require("git-related") -- ./lua/git-related/init.lua
require("git-blame") -- ./lua/git-blame/init.lua
require("git-sings") -- ./lua/git-sings/init.lua
require("g-worktree") -- ./lua/g-worktree/init.lua
require("diff-view") -- ./lua/diff-view/init.lua

require("plugins.persistence") -- ./lua/plugins/persistence/init.lua
