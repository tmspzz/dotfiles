#!/usr/bin/env bash
# Set up Node and the coding agents (Claude Code, Codex, pi) with their skills and plugins.
# Run after install.sh and `brew bundle`, which installs asdf and the agent binaries.
# Re-running is safe.
set -euo pipefail

# bash does not read ~/.zshrc, so put asdf's shims on PATH here
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.local/bin:$PATH"

# Node and pnpm: the latest versions become this machine's defaults in ~/.tool-versions
for tool in nodejs pnpm; do
  asdf plugin add "$tool" 2>/dev/null || true
  asdf install "$tool" latest
  asdf set --home "$tool" latest
done
if ! command -v npx >/dev/null; then
  echo "npx not found after asdf install; check that asdf works, then re-run" >&2
  exit 1
fi

# Review UI for plans and diffs: the binary plus its slash-command skills
if ! command -v plannotator >/dev/null; then
  curl -fsSL https://plannotator.ai/install.sh | bash
fi

# Skills from the skills CLI, linked into each agent
agents=(claude-code codex pi)
npx -y skills add danyuchn/asd-ste100-skill -g -y -a "${agents[@]}"
npx -y skills add vercel-labs/skills -s find-skills -g -y -a "${agents[@]}"
npx -y skills add mattpocock/skills -s grill-me -g -y -a "${agents[@]}"

# Claude Code plugins
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add michael-denyer/pstack-claude
claude plugin marketplace add backnotprop/plannotator
claude plugin marketplace add softaworks/agent-toolkit

claude plugin install pstack@pstack-claude
claude plugin install plannotator@plannotator
claude plugin install mermaid-diagrams@agent-toolkit
claude plugin install rust-analyzer-lsp@claude-plugins-official
claude plugin install swift-lsp@claude-plugins-official

# pstack for Codex and pi
codex plugin marketplace add michael-denyer/pstack-claude
codex plugin add pstack@pstack-claude
pi install git:github.com/michael-denyer/pstack-claude

# Work setup lives in a separate private repo
if [ -x "$HOME/dotfiles-work/setup.sh" ]; then
  "$HOME/dotfiles-work/setup.sh"
fi

cat <<'EOF'

Agents are set up. Manual steps left:
  1. Sign in on first run of each agent: claude, codex, pi.
  2. Restart Claude Code so the new plugins load.
  3. Rust LSP: install Rust with rustup, then: rustup component add rust-analyzer
  4. Swift LSP: install Xcode, which ships sourcekit-lsp.
  5. Optional: run /pstack:setup-pstack in Claude Code to pick pstack's models.
EOF
