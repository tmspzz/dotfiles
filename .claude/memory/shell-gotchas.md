---
name: shell-gotchas
description: "zsh aliases that break scripted commands: ls is ls -Glah; check binaries with type, not which"
metadata:
  node_type: memory
  type: reference
  originSessionId: 0dd6a025-12af-45cc-8a35-1ef14e902729
  modified: 2026-10-09T00:00:00.000Z
---

- **`ls` is an alias for `ls -Glah`.** `for f in $(ls dir)` then loops over the long-listing columns, not file names.
  Use `/bin/ls` in scripts.
- **Check binaries with `type`, not `which`.** `which` also succeeds for a shell function with the same name.
- **A hook rewrites every command to `rtk <cmd>`** (`~/.claude/hooks/rtk-rewrite.sh`). Run these as `rtk proxy <cmd>`
  instead:
  - `npx <package>`: rtk treats the package as an npm subcommand, so `npx skills find` fails with `Unknown command:
    "skills"`.
  - output a parser reads: rtk compresses JSON, so `curl ... | python3 -c 'json.load(...)'` fails.
  - output that looks cut short or summarised.
