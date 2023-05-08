# shellcheck shell=bash

#### .bashrc

# shell-specific configuration
# In general: put stuff in ~/.bashrc, and make ~/.bash_profile source it.
# do not use export for shell variables, for example PS1, IFS, HISTFILE

#-----------------------------------------------
# Source system-wide etc/profile and etc/bashrc
#-----------------------------------------------
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#-----------------------------------------------
# configure the history
#-----------------------------------------------
# HISTFILE=$HOME/.bash_history # default
# HISTCONTROL=ignoredups # remove duplicates
HISTCONTROL=ignoreboth # remove duplicates and lines beginning with space
HISTIGNORE="&:ls:[bf]g:pwd:exit:cd .."
HISTSIZE=30000 # set history length
HISTFILESIZE=30000 # set history length

shopt -s histappend # append to the history file, don't overwrite it
shopt -s cmdhist # Store multiline commands as one line.
shopt -s checkwinsize # resize the window when output
shopt -s cdspell # Autocorrect typos in path names when using `cd`
shopt -s dirspell # Spellcheck directories
# shopt -s nocaseglob; #  Case-insensitive globbing (used in pathname expansion)
# shopt -s autocd # cd into directories w/o typing 'cd' first (interactive shells only)
shopt -s cdable_vars # If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.

# delete duplicate PATH entries
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
PYTHONPATH=$(printf "%s" "$PYTHONPATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
