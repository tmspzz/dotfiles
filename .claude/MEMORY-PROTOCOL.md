# Memory Protocol

## Before answering

Check local memory: `~/.claude/projects/<project-slug>/memory/MEMORY.md` and the entries it links.
Then check `CLAUDE.md` in the working tree and any parent directories.

If sources disagree, tell the user about the conflict, verify against the real state (filesystem,
git), and only then act. Do not silently prefer one source.

## After finishing a task

Update local memory and `CLAUDE.md` if they exist:

- Local auto-memory under `~/.claude/projects/<project-slug>/memory/`: write the entry file and add
  a one-line pointer to `MEMORY.md`.
- `CLAUDE.md` in the project tree: edit in place when the change is project-scoped guidance.

If they don't exist, do not silently create them. Tell the user that a `CLAUDE.md` or a local
memory entry would help here and ask whether to create it.

## What NOT to write

- Code patterns, file paths, or anything derivable by reading the current repo.
- Ephemeral task state. That belongs in plans or tasks, not memory.
- Duplicates. Search first, update an existing entry before creating a new one.
- Dates for when something happened. Git holds the history.
- Lines longer than 120 characters.
