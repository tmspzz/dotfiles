#!/usr/bin/env bash
# Claude Code status line
# Format: ~/path ᛅ(git branch) | model [████████░░] 87%

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')

# Shorten home directory to ~
home="$HOME"
cwd_display="${cwd/#$home/\~}"

model=$(echo "$input" | jq -r '.model.display_name // ""')

# Git branch from workspace repo or worktree
branch=$(echo "$input" | jq -r '.worktree.branch // empty')
if [ -z "$branch" ]; then
  branch=$(command git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)
fi

# Context remaining percentage
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build progress bar (~10 cells) from remaining percentage
build_bar() {
  local pct="$1"
  local filled=$(( (pct * 10 + 50) / 100 ))
  [ "$filled" -gt 10 ] && filled=10
  local empty=$(( 10 - filled ))
  local bar=""
  local i
  for (( i=0; i<filled; i++ )); do bar="${bar}█"; done
  for (( i=0; i<empty; i++ )); do bar="${bar}░"; done
  printf '%s' "$bar"
}

# Path (yellow)
printf '\033[33m%s\033[0m' "$cwd_display"

# Git branch (blue brackets, red branch name)
if [ -n "$branch" ]; then
  printf ' \033[34mᛅ(\033[31m%s\033[34m)\033[0m' "$branch"
fi

# Model name (dim)
if [ -n "$model" ]; then
  printf ' \033[2m%s\033[0m' "$model"
fi

# Context progress bar (dim)
if [ -n "$remaining" ]; then
  pct_int=$(printf '%.0f' "$remaining")
  bar=$(build_bar "$pct_int")
  printf ' \033[2m[%s] %d%%\033[0m' "$bar" "$pct_int"
fi
