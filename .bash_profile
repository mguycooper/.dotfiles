# shellcheck shell=bash

#### .bash_profile

# use .profile to expose environment variables outside of the bash shell

# to start with default path each time:
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# do this here b/c some startup processes (e.g. git-completion) benefit
export PATH="/Applications/MATLAB_R2022b.app/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/opt:$PATH"

# Load the shell dotfiles etc
# note: shellcheck directives apply to command following them. directives after shebang apply to entire script.
# shellcheck source-path=$HOME
# shellcheck disable=SC1090
for file in $HOME/.{exports,bash_prompt,bashrc,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#----------------------------------------------------------------------
__conda_setup="$('$"HOME"/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        source "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
#----------------------------------------------------------------------
# in newer versions, this may be all that is needed: (check path tho)
# # source $HOME/opt/anaconda3/etc/profile.d/conda.sh