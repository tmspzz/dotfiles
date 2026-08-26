-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Mouse: LazyVim already sets `mouse = "a"` and `clipboard = "unnamedplus"`.
-- These refine the mouse behaviour:
opt.mousemodel = "popup_setpos"   -- right-click moves the cursor and opens a context menu
opt.mousescroll = "ver:3,hor:0"   -- 3 lines per wheel notch, no accidental horizontal scroll
-- (clipboard is left to LazyVim: it sets `unnamedplus` locally and OSC 52 over SSH)

-- New splits open to the right / below (feels natural with mouse-driven panes)
opt.splitright = true
opt.splitbelow = true

-- Keep a little breathing room around the cursor while scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Truecolor only in terminals that actually support it (Ghostty/iTerm2/WezTerm
-- export COLORTERM=truecolor). macOS Terminal.app does NOT support 24-bit color,
-- so there we fall back to its 256-color palette instead of sending broken
-- truecolor codes. Pairs with the conditional colorscheme in lua/plugins/colorscheme.lua.
opt.termguicolors = vim.env.COLORTERM == "truecolor" or vim.env.COLORTERM == "24bit"

-- Only run Prettier where the project actually has a Prettier config file.
-- Keeps conform.nvim from reformatting repos that use Biome, oxfmt, or nothing
-- at all. (Rust is unaffected: rustfmt is driven by rust-analyzer.)
vim.g.lazyvim_prettier_needs_config = true
