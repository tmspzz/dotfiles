---
name: tmux-setup
description: "tmux config gotchas: never kill-server, options to re-set after TPM, continuum restore, C-j for Claude"
metadata:
  node_type: memory
  type: project
  originSessionId: 0dd6a025-12af-45cc-8a35-1ef14e902729
  modified: 2026-10-09T00:00:00.000Z
---

tmux config is `~/.config/tmux/tmux.conf`, versioned in [[dotfiles-repo]]. Prefix is C-a. The status bar copies Neovim's
lualine colours ([[editor-neovim-lazyvim]]).

- **Never test with `tmux kill-server`.** It kills the user's live sessions. Test on a private socket: `tmux -L test -f
  ~/.config/tmux/tmux.conf new-session -d`, then `tmux -L test kill-server`.
- **Re-set options after `run tpm`.** tmux-sensible resets `status-interval` to 5, so the config sets 15 again after
  TPM. `set -g status on` is explicit because deleting a line does not undo the option on a running server.
- **continuum restores only on a cold server start.** With a server running, bare `tmux` attaches through the `tmux()`
  function in `~/.zshrc`.
- **C-j passes through to Claude Code** (newline) through an `is_vim_or_claude` check placed after `run tpm`. C-h, C-k
  and C-l still move between panes.
- **Panes keep the tmux server's environment.** A PATH change in `.zshrc` reaches only new shells started with `exec zsh
  -l`. See [[asdf-node-pnpm]].
