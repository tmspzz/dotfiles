---
name: dotfiles-repo
description: All terminal configs are versioned in the github.com/tmspzz/dotfiles repo
metadata: 
  node_type: memory
  type: project
  originSessionId: 0dd6a025-12af-45cc-8a35-1ef14e902729
  modified: 2026-10-09T00:00:00.000Z
---

The user's general setup is versioned in **github.com/tmspzz/dotfiles** (branch `master`, public). Flat layout mirroring
`$HOME`: `.zshrc`, `.bashrc`, `tmpz.zsh-theme` (the oh-my-zsh prompt), `Brewfile`, `install.sh`, `agents-setup.sh`,
`.claude/` and `.config/{ghostty,nvim,tmux}`.

- `install.sh` links each file into place and backs up existing files to `<path>.bak-<timestamp>`. It copies
  `.claude/settings.json` once instead of linking it, because Claude Code writes to it.
- `Brewfile` holds general tools and the coding agents (Claude Code, Codex, pi). Project tools such as bazelisk, dprint,
  shfmt and keep-sorted stay out.
- `agents-setup.sh` installs the latest Node and pnpm through asdf, then the skills for all three agents and the Claude
  Code plugins. Skills that have an installer are installed, not copied into the repo.

Work setup lives in a separate private repo at `~/dotfiles-work`: work shell settings, work Claude Code rules in
`~/.claude/rules/`, work plugins and work tools. `.zshrc` sources `~/.zshrc.local` and `agents-setup.sh`
runs `~/dotfiles-work/setup.sh` when they exist. Never commit work hosts, paths or tools to the public repo.

The live configs on this machine may still be real files, not links to the repo. Before you commit, diff the live files
against the repo. See [[editor-neovim-lazyvim]] and [[tmux-setup]].
