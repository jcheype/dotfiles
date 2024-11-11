#! /bin/sh
sudo pacman -Syu --noconfirm git neovim base-devel jujutsu awk zsh zoxide stow starship eza bat fzf fd ripgrep yarn rustup nerd-fonts tmux lua-language-server sqlx-cli typescript-language-server

rustup default stable
rustup component add rust-analyzer


LANG=C yay --answerdiff None --answerclean None --mflags "--noconfirm" -S mise
