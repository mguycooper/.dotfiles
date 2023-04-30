# .dotfiles

## Setup (requires git-create)
    git init --bare $HOME/.dotfiles
    git create .dotfiles
    alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dotfiles remote add origin https://github.com/mgcooper/.dotfiles.git

## Configuration
    dotfiles config --local status.showUntrackedFiles no
    dotfiles remote set-url origin https://github.com/mgcooper/.dotfiles.git

## Usage
    dotfiles status
    dotfiles add .bash_profile
    dotfiles commit -m "Add .bash_profile"
    dotfiles push
