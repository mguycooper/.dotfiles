# .bashrc

# see https://medium.com/@rajsek/zsh-bash-startup-files-loading-order-bashrc-zshrc-etc-e30045652f2e
# for a great explainer of the various profiles

#Source global definitions (i.e. .bash_profile and .bashrc are shell specific, /etc/profile and etc/bashrc are system-wide)
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# for z package
# . /usr/local/etc/profile.d/z.sh

# user specific alisases and functions
# most borrowed from https://natelandau.com/my-mac-osx-bash_profile/
alias cdicemelt="cd /Users/mattcooper/Google\ UCLA/snowmodel/greenland/icemelt/"
alias cdenvs="cd /usr/local/anaconda3/envs/"
alias cdgit="cd ~/Documents/git/"
alias open='open -a TextMate'
alias ..='cd ..'
alias ls="ls -Ahl" 							# ls: 			Print all file names with human readable output
alias which='type -all' 					# which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias dotfiles='/usr/bin/git --git-dir=/Users/mattcooper/.dotfiles/ --work-tree=/Users/mattcooper'
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
