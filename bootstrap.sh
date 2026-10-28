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
