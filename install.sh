#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE}")"

CWD=$(pwd)

echo "Sync Start\n"

function syncFile() {
    echo "$CWD/$1 => $HOME/$1"
    ln -sf "$CWD/$1" "$HOME/$1"
}

function sync() {
  mkdir -p $HOME/.config/nvim
  mkdir -p $HOME/bin

  syncFile ".asdfrc"
  syncFile ".gemrc"
  syncFile ".gitconfig"
  syncFile ".tigrc"
  syncFile ".tmux.conf"
  syncFile ".tmux.zsh"
  syncFile ".zprofile"
  syncFile ".zshenv"
  syncFile ".zshrc"

  syncFile ".config/karabiner"
  syncFile ".config/starship.toml"

  syncFile ".config/nvim/init.vim"
  syncFile ".config/nvim/dein.toml"
  syncFile ".config/nvim/deinlazy.toml"
  syncFile ".config/nvim/ftplugin"
  syncFile ".config/nvim/plugins"
  syncFile ".config/nvim/rc"
  syncFile ".config/nvim/snippets"

  syncFile "bin/tmux-pbcopy"
}

sync

echo ""
echo "Done!"
