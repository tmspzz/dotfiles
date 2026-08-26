-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Prose filetypes: hard-wrap to a target width (auto-wraps as you type via the
-- `t` formatoption; also reflow on demand with gqap / gqq / visual + gq).
-- Git commits follow the 50/72 convention; everything else uses 100.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("prose_textwidth", { clear = true }),
  pattern = { "markdown", "text", "gitcommit", "mail", "rst", "tex" },
  callback = function(ev)
    local is_commit = ev.match == "gitcommit"
    vim.opt_local.textwidth = is_commit and 72 or 100
    vim.opt_local.colorcolumn = is_commit and "50,72" or "100"
    vim.opt_local.formatoptions:append("t") -- auto-wrap text at textwidth
  end,
})
