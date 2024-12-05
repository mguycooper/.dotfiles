# .bash_profile

# see https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e
# for a great explainer of the various profiles

# consider including the stuff here: https://github.com/nicolashery/mac-dev-setup

# read aliases and functions from .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# suppress the prompt to switch to zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

# user specific environment and startup programs
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

# enable the use of color in the bash when using ls and modify the command prompt so that the current working directory and ">>" are shown
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# modify the command prompt:
#export PS1="\w>>"
# I like these more: (\w = ~, \h = , \u = username, \n = newline)
#export PS1="____   | \w @ \h (\u) \n| => "
#export PS2="| => "

export PS1='$PWD/\n mgc -> '

# dec 2022 - test to run freeze thaw 1d
export JAVA_HOME="/usr/local/Cellar/openjdk/19.0.1/libexec/openjdk.jdk/Contents/Home"

# see https://wiki.archlinux.org/index.php/Bash/Prompt_customization for details on PS1, PS2, PS3, and PS4

# to get gfortran to work, I had to add this, see http://wusun.name/blog/2018-04-27-conda-libgfortran-issue/ 
# also see https://stackoverflow.com/questions/3146274/is-it-ok-to-use-dyld-library-path-on-mac-os-x-and-whats-the-dynamic-library-s
export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/anaconda3/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export PATH=".:$PATH"
#export PYTHONPATH="/usr/local/anaconda3/"

# for bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# source /usr/local/etc/bash_completion
eval "$(gh completion -s bash)"

