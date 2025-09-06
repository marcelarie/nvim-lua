
-- require "profiler"
require "global"
require "options"

require "lazy-bootstrap"
require "lazy-plugins"

require "treesitter-setup"
require "commands"
require "keymaps"
require "autocmd"
require "color-settings"
require "sys-clip"
require "tmux"
require "lsp"
-- require "ziggy"
-- require "zig-official-color"
-- require "lsp-setup" -- needs to be migrated

-- -- features
require "features.persistend-qfl"
require "features.update-fe-version"

-------------------------------------------------------------------------------
-- -- vim: ts=2 sts=2 sw=2 et
