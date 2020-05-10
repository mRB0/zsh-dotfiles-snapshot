# If not running interactively, don't do anything
[ -z "$PS1" ] && return

BLOCKSIZE=K;	export BLOCKSIZE

if [[ -x ~/bin/edit ]]; then
    EDITOR=~/bin/edit
else
    EDITOR=emacs
fi
export EDITOR

LESS='-i';		export LESS

if command -v less > /dev/null; then
    PAGER='less -R';  	export PAGER
fi

[ -x ~/.zshrc.local ] && . ~/.zshrc.local

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch autopushd inc_append_history
setopt noflowcontrol # because I like ^S
#setopt share_history
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mrb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


#
# Source contents of executable files in .zshrc.d
#
for rcfile in $HOME/.zshrc.d/*; do
        [ -x "$rcfile" ] && [ "${rcfile[-1]}" != "~" ] && . "$rcfile"
done

function f () find . -iname "*$1*"

return 0
