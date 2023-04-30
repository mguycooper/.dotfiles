# shellcheck shell=bash

#### .bash_profile

# use .profile to expose environment variables outside of the bash shell

# check: https://github.com/Bash-it/bash-it
# https://thoughtbot.com/blog/manage-team-and-personal-dotfiles-together-with-rcm

# to start with default path each time:
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# do this here b/c some startup processes (e.g. git-completion) benefit
export PATH="/Applications/MATLAB_R2022b.app/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/opt:$PATH"

# for gfortran, may not be necessary if gfortran is reinstalled
export LIBRARY_PATH="$LIBRARY_PATH:/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"

# Load the shell dotfiles, and then some (modified from nicolas hery)
# note: shellcheck directives apply to command following them. directives after shebang apply to entire script.
# shellcheck source-path=$HOME
# shellcheck disable=SC1090
for file in $HOME/.{exports,bash_prompt,bashrc,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# NOTE: messing with this might deactivate it, e.g. moving it to .exports
# in newer versions, I think this is all that is needed: (check path tho)
# # source $HOME/opt/anaconda3/etc/profile.d/conda.sh

#----------------------------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/coop558/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/coop558/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        source "/Users/coop558/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#----------------------------------------------------------------------

# these were after the conda init stuff
#export PATH=".:$PATH"
#export PYTHONPATH="/usr/local/anaconda3/"