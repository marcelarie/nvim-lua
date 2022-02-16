require('lighthaus').setup({
  -- set true to use dark bg by default
  bg_dark = true,
  -- see colors.lua to see colors table, set overrides here to be merged with defaults
  colors = {
    -- black = '#0E0E10',
    black = '#111111',
    fg_nc_statusline = '#888888'
    -- bg = 'Red'
  },
  -- set to 'underline' to replace undercurl with underline
  -- or empty string '' to disable
  lsp_underline_style = 'undercurl',
})
