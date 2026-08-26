local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Rust language support: rustaceanvim (rust-analyzer), crates.nvim, etc.
    { import = "lazyvim.plugins.extras.lang.rust" },
    -- TypeScript / JavaScript: vtsls LSP, inlay hints, move-to-file refactors.
    -- Set `vim.g.lazyvim_ts_lsp = "tsgo"` in options.lua to try the Go-based server.
    { import = "lazyvim.plugins.extras.lang.typescript" },
    -- JSON schemas for package.json / tsconfig.json / etc. (jsonls + SchemaStore).
    { import = "lazyvim.plugins.extras.lang.json" },
    -- ESLint as an LSP (diagnostics + `source.fixAll` on save).
    { import = "lazyvim.plugins.extras.linting.eslint" },
    -- Prettier via conform.nvim (only in projects that have a prettier config,
    -- see `lazyvim_prettier_needs_config` in options.lua).
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    -- Debugging: nvim-dap + UI. Brings js-debug-adapter for Node/browser, and
    -- also wires up codelldb for Rust via rustaceanvim.
    { import = "lazyvim.plugins.extras.dap.core" },
    -- Test runner UI (neotest). Rust works out of the box via rustaceanvim;
    -- for JS/TS add an adapter such as neotest-vitest or neotest-jest.
    { import = "lazyvim.plugins.extras.test.core" },
    -- Code outline / symbol map (functions, structs, ...) in a right-side panel.
    { import = "lazyvim.plugins.extras.editor.outline" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
