# .bash_profile

# Source the startup dotfiles
for file in $HOME/.{exports,bashrc,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# user specific environment and startup programs
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.gem/ruby/2.6.0/bin:$PATH"

# see https://wiki.archlinux.org/index.php/Bash/Prompt_customization for details on PS1, PS2, PS3, and PS4

# to get gfortran to work, I had to add this, see http://wusun.name/blog/2018-04-27-conda-libgfortran-issue/ 
# also see https://stackoverflow.com/questions/3146274/is-it-ok-to-use-dyld-library-path-on-mac-os-x-and-whats-the-dynamic-library-s
export DYLD_FALLBACK_LIBRARY_PATH="/usr/local/anaconda3/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rust
source "$HOME/.cargo/env"

# for bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# source /usr/local/etc/bash_completion
eval "$(gh completion -s bash)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(starship init bash)"


# Delete duplicate PATH entries
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
PYTHONPATH=$(printf "%s" "$PYTHONPATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')