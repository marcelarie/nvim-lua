-------------------- TREE-SITTER ---------------------------
-- :TSInstall c bash html json css javascript php lua python regex rust typescript query 

local ts = require 'nvim-treesitter.configs'
-- ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

ts.setup {                                                                                                                                                                                                  
  ensure_installed = 'maintained',
  highlight = {                                                                                                                                                                                                                           
    enable = true,                                                                                                                                                                                                                        
    custom_captures = {                                                                                                                                                                                                                   
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.                                                                                                                                                      
      ["foo.bar"] = "Identifier",                                                                                                                                                                                                         
    },                                                                                                                                                                                                                                    
  },                                                                                                                                                                                                                                      
  playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false -- Whether the query persists across vim sessions
    },
  incremental_selection = {                                                                                                                                                                                                               
    enable = true,                                                                                                                                                                                                                        
    keymaps = {                                                                                                                                                                                                                           
      init_selection = "gnn",                                                                                                                                                                                                             
      node_incremental = "grn",                                                                                                                                                                                                           
      scope_incremental = "grc",                                                                                                                                                                                                          
      node_decremental = "grm",                                                                                                                                                                                                           
    },                                                                                                                                                                                                                                   
  },                                                                                                                                                                                                                                      
   indent = {                                                                                                                                                                                                                             
    enable = true                                                                                                                                                                                                                         
  },                                                                                                                                                                                                                                      
}     


