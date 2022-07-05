#!/bin/bash

# Install brew
if ! type brew &>/dev/null; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Install neccesary commands
brew bundle install --file=~.Brewfile

# Hardcode the bare repo to $HOME/.cfg on every machine (easy to manage)
# --recurse-submodules: .tmux
git clone --recurse-submodules https://github.com/konfido/dotfiles.git $HOME/.cfg

# Restore configs
cd $HOME/.cfg
stow --adopt conifgs-core

# Change default shell to zsh
chsh -s "$(which zsh)"

echo "Configs restored."
echo "Now check out these local changes:"
git status --short