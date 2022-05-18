#!/bin/bash

# Hardcode the bare repo to $HOME/.cfg on every machine (easy to manage)
# --recurse-clone: .oh-my-zsh
git clone --bare --recurse-clone https://github.com/konfido/dotfiles.git $HOME/.cfg

function dot {
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME "$@"
}

if dot checkout; then
    echo "Checked out dotfiles.";
else
    echo "Backing up pre-existing dot files to .cfg-backup"
    mkdir -p .cfg-backup
    dot checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | \
        xargs -I{} mv {} .cfg-backup/{}
fi
dot checkout
# Only show tracked files
dot config --local status.showUntrackedFiles no

# Install brew
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle install --file=~.Brewfile

# Change default shell to zsh
chsh -s "$(which zsh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/autoupdate
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Set iterm2 badge
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh