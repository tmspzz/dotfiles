# Instructions

Claude Code, Codex and pi all read this file.

## Language

Work in pstack's **poteto-mode** by default. It brings in **unslop** for all writing,
**technical-writing** for docs, commit messages and MR text, and its own rules for comments.

When this file and pstack disagree, pstack wins. The rules below are the corrections I have made
that pstack does not cover. Do not make me repeat them.

### Words I have rejected

If a word is not in the codebase or in plain English, do not use it. Banned in code and in prose:

- **owe / owes / owed** for what an account lacks. Say what is missing.
- **routes on**, **the same facts**, **drifted apart**, **by construction**, **the shape of**,
  **gate / gating / gated** as a verb.
- **pure**, **reduction**, **total function**, **idempotent** and other functional-programming
  vocabulary. Say what the function reads and returns: "no crypto, no I/O, so its tests are fast".
- **sweep**, **cycle**, **pass** for a thing the code does not call that.
- **the real cost** to introduce a defect. Say "the problem is". Keep "cost" for a price you can
  measure: latency, memory, money.
- **mint** for making a row or a record. Say "creates".

### Names

Read the call site aloud before naming anything. The name is right when the line of code is the
English sentence you would have said.

    if needs_address_keys(&user, &addresses, product_requires_keys) {

A function returning a bool takes a claim about its subject: `needs_x`, `has_x`, `is_x`, `can_x`.
A function returning a value takes a noun phrase for what it hands back: `unlock_inputs`,
`user_whose_keys_changed`, `locked_keyring`.

Do not assemble compound noun phrases out of domain words to make a name accurate.
`address_keys_to_create`, `next_setup_is_address_keys` and `secret_user_and_key_present` are all
precise and none of them is English.

When rejecting a name for a reason, write the reason down. Recheck it when the code changes.

### Answering me

- Lead with the answer. No restating my question, no recap of what we just did.
- Bullet points whenever enumerating.
- Be concise but not terse or cryptic. No walls of text.
- Do not describe the code path when I asked about the problem.
- Correct me plainly when I am wrong, in one sentence.
- Do not apologise, do not moralise, do not narrate your own mistakes. Fix and continue.

### Reviewing others

No blame. Describe what the code does and what the problem is, not who got it wrong.

### Secrets

Never echo real credentials, tokens, keys, PII or internal URLs. Reference by file path and line.

## Memory

Claude Code, Codex and pi share one memory: the markdown files in
`~/.claude/projects/<slug>/memory/`. `<slug>` is the git repo root, or the working directory outside
a repo, with every character that is not a letter or digit replaced by `-`. For example,
`/Users/me/Code/app` becomes `-Users-me-Code-app`, also when you work in `/Users/me/Code/app/src`.

Codex: leave Codex's built-in memories off, so there is one store.

### Before answering

- Read `MEMORY.md` in that folder and the entries it links. Claude Code loads the index on its own;
  Codex and pi must read it before every task.
- Check `AGENTS.md` or `CLAUDE.md` in the working tree and any parent directories.

If sources disagree, tell the user about the conflict, verify against the real state (filesystem,
git), and only then act. Do not silently prefer one source.

### After finishing a task

- **Memory:** write one fact per file, with `name`, `description` and `type` (`user`, `feedback`,
  `project` or `reference`) in the frontmatter. Add a one-line pointer to `MEMORY.md`. Read the
  file again just before you write it, because another agent may have changed it.
- **Project instructions:** edit `AGENTS.md` or `CLAUDE.md` in the project tree when the change is
  project-scoped guidance. If neither exists, ask the user before creating one.

The memory for sessions started in `$HOME` (`-Users-<name>`) is published in a public dotfiles
repo. Never save work facts, hosts, paths or people there.

### What NOT to write

- Code patterns, file paths, or anything derivable by reading the current repo.
- Ephemeral task state. That belongs in plans or tasks, not memory.
- Duplicates. Search first, update an existing entry before creating a new one.
- Dates for when something happened. Git holds the history.
- Lines longer than 120 characters.
