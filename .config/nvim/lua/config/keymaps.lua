-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Option/Alt+Backspace deletes the previous word (like macOS apps). Ctrl-W still works.
-- (Ghostty sends Option as Alt via macos-option-as-alt.)
map({ "i", "c" }, "<M-BS>", "<C-w>", { desc = "Delete previous word" })

-- IDE-style mouse navigation (like RustRover / VS Code), powered by the LSP.
-- Ctrl+Click a symbol -> jump to its definition. The <LeftMouse> first moves the
-- cursor to what you clicked, then the LSP jumps.
map("n", "<C-LeftMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition (Ctrl+Click)" })
-- Ctrl+Right-Click -> jump back to where you came from (LSP jumps set the jumplist).
map("n", "<C-RightMouse>", "<C-o>", { desc = "Jump back" })

-- Cmd+/ comment toggle. Ghostty sends <C-_> (0x1f) for Cmd+/; some terminals
-- send <C-/>. Map both, using Neovim's built-in `gc` commenting so it's
-- mode-aware: whole line in normal mode, the selection in visual mode.
for _, key in ipairs({ "<C-_>", "<C-/>" }) do
  map("n", key, "gcc", { remap = true, desc = "Toggle comment" })
  map("x", key, "gc", { remap = true, desc = "Toggle comment" })
  map("i", key, "<Esc>gcca", { remap = true, desc = "Toggle comment" })
end
