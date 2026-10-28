#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ "${1:-}" != "--force" && "${1:-}" != "-f" ]]; then
  read -r -p 'Copy these dotfiles into your home directory? (y/n) ' answer
  [[ "$answer" =~ ^[Yy]$ ]] || exit 0
fi

for file in .gitconfig .tmux.conf .vimrc .zprofile .zshenv .zshrc .p10k.zsh .profile .tcshrc .vuerc; do
  cp "$file" "$HOME/$file"
done

mkdir -p "$HOME/.config/nvim/lua" "$HOME/.config/shell" "$HOME/.config/git" "$HOME/.local/bin"
cp .config/nvim/init.lua .config/nvim/.stylua.toml .config/nvim/lazy-lock.json "$HOME/.config/nvim/"
cp .config/nvim/lua/*.lua "$HOME/.config/nvim/lua/"
cp .config/shell/*.zsh "$HOME/.config/shell/"
cp .config/git/ignore "$HOME/.config/git/ignore"
cp .local/bin/tmux-pick .local/bin/tmux-codex-pane-name "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/tmux-pick" "$HOME/.local/bin/tmux-codex-pane-name"
