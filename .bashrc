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

# note: it is common to see HISTCONTROL=ignoreboth. use ignore spaces to intentionally enter commands with a space so they won't be logged (since the space has no effect on the command). i think my custom prompt inserts a space and that's why my history files weren't logging, but I am not certain. also try the 'history' command to display the history

shopt -s histappend # append to the history file, don't overwrite it
shopt -s cmdhist # Store multiline commands as one line.
shopt -s checkwinsize # resize the window when output
shopt -s cdspell # Autocorrect typos in path names when using `cd`
shopt -s dirspell # Spellcheck directories
# shopt -s nocaseglob; #  Case-insensitive globbing (used in pathname expansion)
# shopt -s autocd # cd into directories w/o typing 'cd' first (interactive shells only)
shopt -s cdable_vars # If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.

#-----------------------------------------------
# delete duplicate PATH entries
#-----------------------------------------------
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
PYTHONPATH=$(printf "%s" "$PYTHONPATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')


#-----------------------------------------------
# macos settings
#-----------------------------------------------

# to see the default app open settings:
# mate ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist
# I could do this to set files iwthout an extension whihc i think are id'd as unix executables to open in textmate:
# defaults write ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist LSHandlers -array-add '{LSHandlerContentType=public.unix-executable;LSHandlerRoleAll=com.macromates.textmate;}'
# But this came up when trying to open .git/info/exclude files that kept opening in TextEdit
# the issue is probably with default GIT_EDITOR or maybe git doesn't use that to open these files
# either way a better solution than messing with the plist is to just remmember to use 'mate .git/info/exlude'
# also recall i removed the alias open='mate' because i want to use open on pdf etc which it does automatically
# so basically its just for non-extension files that open won't work


# Focus follows mouse means wherever the mouse is, the app is 'on top'
# this would solve the thing where i have to carefully arrange windows to type in one while reading another
# but it may cause problems elsewhere, so leave commented out until experiemnted

# Enable
# defaults write com.apple.Terminal FocusFollowsMouse -string true

# Disable (Default)
# defaults write com.apple.Terminal FocusFollowsMouse -string false

# -----------------------------------------------------------------------
# REGARDING export: notice some variables are set below with 'export'. export is used for environment variables i.e., variables that need to be visible to other programs launched from the shell, whereas ones used by shell just need to be set. Examples:
# HOME
# PATH
# LD_LIBRARY_PATH
# EDITOR
# VISUAL
# DISPLAY
# LESS
# http_proxy