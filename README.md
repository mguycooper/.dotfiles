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

## files

Some common files to add
dotfiles add .condarc

dofiles will ignore files which are not in the top level. Here are some common ones to add
dotfiles add .config/pip/pip.conf
dotfiles add .config/.virtualenv
dotfiles add .config/black
dotfiles add .config/gh/config.yml
dotfiles add .config/radian/profile
dotfiles add .config/rstudio/keybindings/rstudio_bindings.json
dotfiles add .config/starship.toml


## Backups

Some recommended actions before sanitizing  a machine

```bash
mkdir ~/backup
mkdir ~/backup/dotfiles
mv ~/.extra ~/backup/dotfiles/
mv ~/.notes ~/backup/dotfiles/
brew bundle dump --file=~/backup/Brewfile
pipx list > ~/backup/pipx_list.txt
pyenv versions > ~/backup/pyenv_versions_list.txt
pyenv virtualenvs > ~/backup/pyenv_virtualenvs_list.txt
conda env export > ~/backup/conda_environment.yml
ls /Applications > ~/backup/installed_applications_list.txt
code --list-extensions > ~/backup/vscode_extensions_list.txt
```

mkdir ~/backup/vscode
cp ~/Library/Application\ Support/Code/User/settings.json ~/backup/vscode/
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/backup/vscode/

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
