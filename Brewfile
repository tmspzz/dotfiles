# Install with: brew bundle --file=Brewfile

# editor and terminal
brew "neovim"      # editor
brew "tmux"        # terminal multiplexer
brew "ripgrep"     # grep engine Neovim pickers shell out to
brew "fd"          # file finder Neovim pickers use
brew "lazygit"     # git TUI, opened from Neovim
brew "tree"        # print a directory as a tree

cask "ghostty"                        # terminal
cask "font-jetbrains-mono-nerd-font"  # font used by Ghostty, tmux status, Neovim icons
cask "rectangle"                      # window snapping

# coding agents (agents-setup.sh adds their skills and plugins)
cask "claude-code"
cask "codex"
brew "pi-coding-agent"
brew "rtk"         # compresses command output for Claude Code (hook in .claude/hooks)

# version manager: agents-setup.sh installs the latest Node and pnpm with it
brew "asdf"

# git
brew "git"
brew "git-lfs"      # large file storage
brew "gnupg"        # signs commits (git config commit.gpgsign true)
brew "pinentry-mac" # macOS dialog for the GPG passphrase

# inspect
brew "cloc"        # count lines of code

# containers
brew "docker"
cask "docker-desktop"
