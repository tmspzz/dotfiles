---
name: agents-skills-symlinks
description: "The skills CLI installs into ~/.agents/skills and links into the agents passed with -a"
metadata:
  node_type: memory
  type: reference
  originSessionId: f56a46ac-1b1e-434a-9eaa-057f7069bcff
  modified: 2026-10-06T07:07:52.194Z
---

The `skills` CLI (vercel-labs/skills) installs into `~/.agents/skills/` and links each skill into the agents passed with
`-a`. Without `-a`, it uses `lastSelectedAgents` in `~/.agents/.skill-lock.json`, which does not list Claude Code.

**How to apply:** install with `-g -y -a claude-code codex pi` (agents separated by spaces), then check that
`~/.claude/skills/` has a link for each new skill.

A run prints "PromptScript does not support global skill installation" for every skill when PromptScript is a selected
agent. The error is harmless. Under the rtk hook, run the CLI as `rtk proxy npx skills`; see [[shell-gotchas]].
