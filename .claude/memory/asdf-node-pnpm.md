---
name: asdf-node-pnpm
description: "Node and pnpm come from asdf; reshim after npm -g; tmux panes keep the old PATH"
metadata:
  node_type: memory
  type: reference
  originSessionId: d94d9f0b-c306-49c8-a18a-5fe9b7211f9a
  modified: 2026-10-02T11:18:12.516Z
---

Node and pnpm come from asdf (plugins `nodejs`, `pnpm`). The default versions live in `~/.tool-versions`, which stays
out of the dotfiles repo; `asdf current` shows them. `~/.zshrc` puts `~/.asdf/shims` on PATH.

After installing or removing a global npm package, run `asdf reshim nodejs`, or the new command has no shim.

**Why:** a PATH change in `.zshrc` does not reach a Claude Code started inside an existing tmux session, because panes
inherit the tmux server's environment.

**How to apply:** before relying on a new PATH, run `exec zsh -l` in a new tmux window and check that `which node`
prints `~/.asdf/shims/node`. Avoid `tmux kill-server`. See [[tmux-setup]].
