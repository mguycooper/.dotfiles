# shellcheck shell=bash

#### .bash_profile

# use .profile to expose environment variables outside of the bash shell

# to start with default path each time:
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Add local bins to path here if they benefit startup processes (e.g. git-completion)
# Note: appending paths here may be slowing down processes which search the path
# export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/opt:$PATH"

# Source the startup dotfiles
# note: shellcheck directives apply to command following them. directives after shebang apply to entire script.
# shellcheck source-path=$HOME
# shellcheck disable=SC1090
for file in $HOME/.{exports,bashrc,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Adjust paths after sourcing .exports.
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"  # brew installs
export PATH="$HOME/.local/bin:$PATH"                # pipx installs
export PATH="$HOME/opt:$HOME/opt/local/bin:$PATH"   # custom installs
export PATH="$HOME/bin:$PATH"                       # custom utilities
export PATH="$USER_SCRIPTS_PATH/gdal_scripts:$PATH" # custom utilities
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  # macports installs (last to avoid conflict w/brew)

# export PATH="$PATH:$USER_SCRIPTS_PATH/SHELL"      # need to move these into ~/bin

# HDF5 and NETCDF directories
# export PATH="$HDF5_DIR:$HDF5_DIR/bin:$PNETCDF_DIR/bin:$PATH"  
# export PATH="$NETCDF_DIR/bin:$PATH" # Note: brew NETCDF directory, not parallel

# This additionally appends matlab paths for using it at the command line
# export PATH="$MATLAB_EXEC_PATH:$MATLAB_STARTUP_PATH:$USER_MATFUNCLIB_PATH:$PATH"

# Remove USER_MATFUNCLIB_PATH to see if adding -sd to code-runner runs startup and gets all the paths
#  (I did not complete this test, to do so, open a matlab script in vscode and cmd-shift-P Run By Language then matlab)
# export PATH="$MATLAB_EXEC_PATH:$MATLAB_STARTUP_PATH:$PATH"

# Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/usr/local/etc/bash_completion.d/git-completion.bash" ]] && . "/usr/local/etc/bash_completion.d/git-completion.bash"
[[ -r "/usr/local/etc/bash_completion.d/git-prompt.sh" ]] && . "/usr/local/etc/bash_completion.d/git-prompt.sh"
[[ -r "/usr/local/etc/bash_completion.d/custom-completion.sh" ]] && . "$HOME/bin/custom-completion"

# This prevents git completions, not sure why
# [[ -r "/usr/local/etc/bash_completion.d/hub.bash_completion.sh" ]] && . "/usr/local/etc/bash_completion.d/hub.bash_completion.sh"

eval "$(gh completion -s bash)"
# in newer versions, this may be all that is needed: (check path tho)
# # source $HOME/opt/anaconda3/etc/profile.d/conda.sh

# source rust env
source "$HOME/.cargo/env"

# source modules
# source /usr/local/opt/modules/init/bash

#--------------------------------
#   CONFIGURE PYENV
#--------------------------------

# pyenv github page suggests this newer config setup should work:
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

#--------------------------------
#   CONFIGURE PYENV-VIRTUALENV
#--------------------------------
if which pyenv > /dev/null; then
	eval "$(pyenv init --path)";
	eval "$(pyenv init -)"	
	if which pyenv-virtualenv-init > /dev/null; then 
		eval "$(pyenv virtualenv-init -)"; 
	fi
fi

# pyenv global 3.12.3 2.7.18 jupyter3 tools3 tools385
# pyenv global 3.12.3 2.7.18 jupyter3 tools3123 tools390 tools385

#-------------------------------------
#   CONFIGURE PYENV-VIRTUALENVWRAPPER
#-------------------------------------
export WORKON_HOME=${HOME}/.virtualenvs	# folder where virtualenvwrapper puts virtualenvs
export PROJECT_HOME=${USER_PROJECT_PATH}/python # folder where I keep my virtualenvs
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenv virtualenvwrapper_lazy

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/coop558/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/coop558/opt/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/coop558/opt/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/coop558/opt/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/coop558/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/coop558/opt/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# # For conda-bash-completion
# CONDA_ROOT=~/opts/mambaforge
# if [[ -r $CONDA_ROOT/etc/profile.d/bash_completion.sh ]]; then
#     # Comment out the following line once you've got completion working
#     echo "Sourcing bash completion setup script"
#     source $CONDA_ROOT/etc/profile.d/bash_completion.sh
# fi

# CONFIGURE ITERM2
iterm2_print_user_vars()
{
    iterm2_set_user_var python_venv "$VIRTUAL_ENV"
}

eval "$(starship init bash)"
eval "$(register-python-argcomplete pipx)"
eval "$(hub alias -s)" # make hub alias git

# Delete duplicate PATH entries
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
PYTHONPATH=$(printf "%s" "$PYTHONPATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
