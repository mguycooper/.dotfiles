# .files

## Setup

```bash
git init --bare $HOME/.files
git create .files
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
dotfiles remote add origin https://github.com/mgcooper/.files.git
```

## Configuration

```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles remote set-url origin https://github.com/mgcooper/.files.git
```

## Usage

```bash
dotfiles status
dotfiles add .bash_profile
dotfiles commit -m "Add .bash_profile"
dotfiles push
```

## Backups

Some recommended actions before sanitizing  a machine

```bash
mkdir ~/backup
brew bundle dump --file=~/backup/Brewfile
pyenv versions > ~/backup/pyenv_versions_list.txt
pyenv virtualenvs > ~/backup/pyenv_virtualenvs_list.txt
conda env export > ~/backup/conda_environment.yml
ls /Applications > ~/backup/installed_applications_list.txt
```

docker save -o ~/backup/image_backup.tar <image name>

## Exclude

Recommend adding these to info/exclude:

.cargo/
.dropbox/
.julia/
.cisco/
.cpan/
.jupyter/
.local/
.npm/
.pyenv/
.rustup/
.spack/
.tldrc/
.vscode/extensions/
Applications/
Library/
MATLAB/
Movies/
Music/
myprojects/
opt/
work/
My Drive*
Google Drive*
Pictures/
Zotero/