# .files

## Setup (requires git-create)
    git init --bare $HOME/.files
    git create .files
    alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
    dotfiles remote add origin https://github.com/mgcooper/.files.git

## Configuration
    dotfiles config --local status.showUntrackedFiles no
    dotfiles remote set-url origin https://github.com/mgcooper/.files.git

## Usage
    dotfiles status
    dotfiles add .bash_profile
    dotfiles commit -m "Add .bash_profile"
    dotfiles push
