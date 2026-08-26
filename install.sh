#!/usr/bin/env bash
# Symlink these dotfiles into place. Re-running is safe: an existing real file or
# directory is moved to <path>.bak-<timestamp> before a symlink replaces it.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.bak-$STAMP"
    echo "backed up $dst -> $dst.bak-$STAMP"
  fi
  ln -s "$src" "$dst"
  echo "linked $dst"
}

# shell + prompt line
link "$DOTFILES/.zshrc"  "$HOME/.zshrc"
link "$DOTFILES/.bashrc" "$HOME/.bashrc"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
link "$DOTFILES/tmpz.zsh-theme" "$ZSH_CUSTOM/themes/tmpz.zsh-theme"

# app configs (Ghostty, Neovim, tmux)
link "$DOTFILES/.config/ghostty"        "$HOME/.config/ghostty"
link "$DOTFILES/.config/nvim"           "$HOME/.config/nvim"
link "$DOTFILES/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
link "$DOTFILES/.config/tmux/help.sh"   "$HOME/.config/tmux/help.sh"

# tmux plugin manager (plugins install with: tmux, then Ctrl-a I)
TPM="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$TPM" ]; then
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"
fi

cat <<EOF

Linked. Remaining steps:
  1. Install tools:   brew bundle --file="$DOTFILES/Brewfile"
  2. Set the font in Ghostty to "JetBrainsMono Nerd Font Mono" (already in the config).
  3. Start tmux, then press Ctrl-a I to install tmux plugins.
  4. Open nvim once; LazyVim installs its plugins on first launch.
  5. For Rust in nvim: rustup component add rust-analyzer
EOF
