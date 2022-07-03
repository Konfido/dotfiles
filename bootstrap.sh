#!/bin/bash

# Hardcode the bare repo to $HOME/.cfg on every machine (easy to manage)
# --recurse-clone: .oh-my-zsh
git clone --recurse-clone https://github.com/konfido/dotfiles.git $HOME/.cfg
cd $HOME/.cfg

# Install brew
if ! brew --prefix 1&>2; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle install --file=~.Brewfile

# Restore configs
stow --adopt conifgs-core

# Change default shell to zsh
chsh -s "$(which zsh)"

echo "Configs restored."
echo "Now check out these local changes:"
git status --short