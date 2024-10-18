vim.o.termguicolors = true
-- vim.o.background = "light"
vim.o.background = "dark"
vim.wo.colorcolumn = "80"

-- Set transparent background for Sonokai
-- vim.g.sonokai_transparent_background = 1

vim.cmd "set t_Co=256"

-- vim.g.falcon_background = 0
-- vim.g.falcon_lightline = 0
-- vim.g.falcon_inactive = 1
--
vim.cmd "colorscheme falcon"

vim.g.linefly_options = {
	with_search_count = false,
}

-- vim.cmd "colorscheme kanagawa-dragon"
-- vim.cmd "colorscheme citruszest"

-- transparent background
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

-- # List
-- | Color Scheme              | Description                                                                                                               |
-- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
-- | falcon                    | A dark color scheme with a focus on low contrast, making it easy on the eyes during long coding sessions.                 |
-- | apprentice                | A minimalistic color scheme with muted tones, designed to reduce visual noise and distraction.                            |
-- | citruszest                | A vibrant and refreshing color scheme with bright, citrus-inspired colors that bring energy to the workspace.             |
-- | forestbones               | A nature-inspired color scheme with earthy greens and browns, providing a calming and grounded environment.               |
-- | github_dark_colorblind    | A dark version of GitHub's color scheme, specifically adjusted to be accessible for colorblind users.                     |
-- | hybrid_reverse            | A reverse hybrid color scheme that combines light and dark elements for a balanced, modern look.                          |
-- | jellybeans                | A playful and colorful scheme with a variety of bright hues, reminiscent of jellybeans, adding a touch of fun to coding.  |
-- | kanagawa-dragon           | Inspired by Japanese art, this scheme features rich and deep colors with a traditional aesthetic.                         |
-- | kanagawa-bones            | Another variant of the Kanagawa theme, focusing on softer, bone-like colors for a more subdued look.                      |
-- | lunaperche                | A celestial-themed color scheme with cool, soothing colors that evoke the tranquility of the night sky.                   |
-- | tuscany-night             | Inspired by a trip to Italy. The colors are warm and inviting, reminiscent of the Tuscan countryside at night.            |
