# dotfiles

Terminal development setup for macOS: Ghostty, Neovim (LazyVim), tmux, and a zsh
prompt. Clone this repo and run `install.sh` to symlink everything into place.

## Install

```sh
git clone https://github.com/tmspzz/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh                      # symlinks configs, backs up anything already there
brew bundle --file=Brewfile       # installs Ghostty, Neovim, tmux, ripgrep, fd, lazygit, the font
```

Then:

- Start `tmux` and press `Ctrl-a` `I` to install tmux plugins.
- Open `nvim` once; LazyVim installs its plugins on first launch.
- For Rust in Neovim: `rustup component add rust-analyzer`.
- oh-my-zsh is required for the prompt: install it from https://ohmyz.sh if it is
  not already present, then re-run `install.sh` so the theme links into
  `~/.oh-my-zsh/custom/themes`.

`install.sh` moves any existing file to `<path>.bak-<timestamp>` before linking,
so a second run does not lose your current setup.

## What you get

- **Ghostty** (`.config/ghostty/config`): GitHub Dark theme, 80% background
  opacity with blur, JetBrainsMono Nerd Font Mono at 14pt, and macOS keybinds
  (Cmd+S save, Cmd+W close tab, Cmd+/ comment, and more).
- **Neovim** (`.config/nvim`): LazyVim with the `github_dark` theme set to
  transparent so Ghostty's background shows through. Adds mouse support,
  Ctrl+Click to definition, a symbol outline, "reveal in Finder" in the file
  explorer, prose auto-wrap (100 columns, 72 for git commits), and
  `claudecode.nvim` to send selections to a Claude Code pane.
- **tmux** (`.config/tmux/`): prefix `Ctrl-a`, a status bar colored to match
  Neovim's statusline, seamless `Ctrl-h/j/k/l` navigation across nvim splits and
  tmux panes, session save and restore, and a `Ctrl-a ?` help popup.
- **zsh** (`.zshrc`, `tmpz.zsh-theme`): the `tmpz` prompt, plus a `tmux` function
  that attaches to the last session instead of creating a new one.

## Layout

```
.zshrc              shell config
.bashrc             bash fallback
tmpz.zsh-theme      prompt line (oh-my-zsh theme)
Brewfile            dependencies
install.sh          symlinks everything into place
.config/
  ghostty/config
  nvim/             full LazyVim config, incl. lazy-lock.json
  tmux/tmux.conf
  tmux/help.sh      the Ctrl-a ? help popup
```
