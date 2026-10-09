---
name: editor-neovim-lazyvim
description: "Neovim + LazyVim in Ghostty, mouse and Cmd-key use; limits the config does not show"
metadata:
  node_type: memory
  type: user
  originSessionId: 0dd6a025-12af-45cc-8a35-1ef14e902729
  modified: 2026-10-09T00:00:00.000Z
---

The user edits in Neovim with LazyVim inside Ghostty and wants it mouse-driven, with macOS Cmd-key shortcuts. The config
lives in the dotfiles repo ([[dotfiles-repo]]); read it there for keymaps, plugins and colours.

Limits that are not visible in the config:

- **Ghostty 1.3.1 rejects keybind prefixes** such as `performable:` with `InvalidAction`. So Cmd+C cannot copy a Neovim
  visual selection; use `y`. Revisit after a Ghostty upgrade.
- **Terminal.app has no truecolor.** Neovim picks `habamax` there and `github_dark` in Ghostty, based on `COLORTERM`.
- **The terminal does not pass Cmd+Click to Neovim**, so go-to-definition is Ctrl+Click.
- **Cmd+W closes the Ghostty tab and Cmd+Shift+W closes the buffer.** A terminal key cannot do both depending on
  context.
- **claudecode.nvim talks to Claude in a separate tmux pane** over the IDE protocol, not by pasting text. Pasting would
  submit on the trailing newline. Connect with `/ide` from the Claude pane in the same directory.
