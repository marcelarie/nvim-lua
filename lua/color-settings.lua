vim.o.termguicolors = true
-- vim.o.background = "light"
vim.o.background = "dark"
vim.cmd.set "t_Co=256"

-- For some reason falcon fails when setting a transparent background
-- vim.cmd.colorscheme "citruszest"
-- vim.cmd.colorscheme "falcon"

-- require("no-clown-fiesta").setup { transparent = true }
vim.cmd.colorscheme "no-clown-fiesta"
-- vim.cmd.colorscheme "lunaperche"
-- vim.g.apprentice_contrast_dark = "soft"
-- vim.cmd.colorscheme "apprentice"
-- require("ziggy").style()
-- require("zig-official-color").setup()

-- vim.api.nvim_set_hl(0, "SpecialKey", { fg = "#373737" })

-- # Favorite color schemes
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
-- | no-clown-fiesta           | A color scheme that aims to reduce visual noise and distraction by using a limited palette of soft, muted colors.         |
