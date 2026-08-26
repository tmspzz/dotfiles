-- Colorscheme, matched to the Ghostty terminal aesthetic (GitHub Dark + blur).
--
-- Truecolor terminals (Ghostty): projekt0n/github-nvim-theme "github_dark",
-- with a TRANSPARENT background so Ghostty's background-opacity + blur show
-- through Neovim instead of being covered by an opaque theme background.
--
-- macOS Terminal.app has no truecolor, so it keeps built-in `habamax`
-- (full 256-color, opaque -- transparency/blur aren't in play there).
--
-- Detection must match the `termguicolors` logic in lua/config/options.lua.

local truecolor = vim.env.COLORTERM == "truecolor" or vim.env.COLORTERM == "24bit"

return {
  -- GitHub's official Neovim themes, matching the Ghostty "GitHub Dark" palette.
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true, -- let the terminal background (opacity + blur) show through
      },
      -- Keep the editor transparent, but give floating windows / pickers
      -- (Space ss, Space /, completion, etc.) a solid, slightly-raised surface
      -- with a visible border so their edges are clearly defined.
      groups = {
        all = {
          NormalFloat = { bg = "#161b22" },
          FloatBorder = { fg = "#484f58", bg = "#161b22" },
          FloatTitle = { fg = "#e6edf3", bg = "#161b22" },
          -- Snacks picker windows (they link to these by default)
          SnacksPicker = { bg = "#161b22" },
          SnacksPickerBorder = { fg = "#484f58", bg = "#161b22" },
          SnacksPickerList = { bg = "#161b22" },
          SnacksPickerInput = { bg = "#161b22" },
          SnacksPickerPreview = { bg = "#161b22" },
          SnacksPickerBox = { bg = "#161b22" },
        },
      },
    },
    config = function(_, opts)
      require("github-theme").setup(opts)
    end,
  },

  -- Tell LazyVim which colorscheme to load.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = truecolor and "github_dark" or "habamax",
    },
  },
}
