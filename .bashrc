# .bashrc

# see https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e
# for a great explainer of the various profiles

#Source global definitions (i.e. .bash_profile and .bashrc are shell specific, /etc/profile and etc/bashrc are system-wide)
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# for z package
# . /usr/local/etc/profile.d/z.sh

#----------------------------------------------------------------------------------
# CONFIGURE PROMPT
#----------------------------------------------------------------------------------
# SET BASE PROMPT
PS1='$PWD/\n '
BASE_PROMPT=$PS1
# ADD ACTIVE GIT BRANCH AND PYENV-VIRTUALENV TO PROMPT
# (see https://github.com/pyenv/pyenv-virtualenv/issues/135#issuecomment-582180662)
function updatePrompt { 
    # Styles
    GREEN='\[\e[0;32m\]'
    BLUE='\[\e[0;34m\]'
    RED='\[\e[0;95m\]'  # light magenta
    RESET='\[\e[0m\]'
    # Current Git repo
    if type "__git_ps1" > /dev/null 2>&1; then
        PROMPT="$BASE_PROMPT$(__git_ps1 "${RED}branch:${GREEN}(%s)${RESET}")"
    fi
    # Current virtualenv
    if [[ $VIRTUAL_ENV != "" ]]; then
        # Strip out the path and just leave the env name
        PROMPT="$PROMPT${RED} env:${BLUE}{${VIRTUAL_ENV##*/}}${RESET}"
    fi
    PS1="$PROMPT${RESET} mgc~> "
}
export -f updatePrompt
# Bash shell executes this function just before displaying the PS1 variable
export PROMPT_COMMAND='updatePrompt'

# ----------------------------------------------------------------------------
# user specific alisases and functions
# ----------------------------------------------------------------------------
# most borrowed from https://natelandau.com/my-mac-osx-bash_profile/
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -Ahl' 							# ls: 			Print all file names with human readable output
alias lsdots='ls -d .*'
alias which='type -all' 					# which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias home='cd $HOME'
alias back='cd $OLDPWD'
alias reload='source ~/.bash_profile'
alias open='open -a TextMate'
alias less='less -R'
alias wget='wget -c'
alias bashrc='open ~/.bashrc'
alias cdp='cd $HOME/myprojects'
alias cdpm='cd $HOME/myprojects/matlab'
alias cddata='cd $HOME/mydata'
alias cdenvs='cd /usr/local/anaconda3/envs'
alias cdgit='cd ~/Documents/git'
alias cdmatfunclib='cd $HOME/MATLAB/matfunclib'
alias gsu='git status -u'
alias gsur='git status -u && git remote show origin'
alias ga='git add -v' # verbose
alias gd='git diff -w' # ignore whitespace
alias gcm='git commit -m'
alias grm='git rm --cached'
alias gall='git add --all'
alias branches='git branch -a'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# next is for git managed dotfiles
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'
# git-summary utility
alias git-summary='/usr/local/sbin/git-summary/git-summary'

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
	
	
# from https://natelandau.com/my-mac-osx-bash_profile/, see for many more options:

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

# To use TextMate as editor for subversion, git, and similar (See TextMate preferences)
# export EDITOR="/usr/local/bin/mate -w"

# if file does not exist, create it
# if [ ! -e "$file" ] ; then
#    touch "$file"
#	open -a TextMate "$file"
#fi
