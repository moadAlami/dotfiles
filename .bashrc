#
# ~/.bashrc
#

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# VI Mode
set -o vi

alias vim='/usr/bin/nvim'
alias ran='/usr/bin/ranger'
alias py3='/usr/bin/python3'
alias py2='/usr/bin/python2'
alias mixer='/usr/bin/pavucontrol'
alias lyrics='/usr/local/bin/cmus-lyrics'


export XDG_CURRENT_DESKTOP=KDE

shopt -s checkwinsize

source <(kitty + complete setup bash)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/moadalami/.local/bin"

export KDE_SESSION_VERSION=5

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

#eval $(thefuck --alias --enable-experimental-instant-mode)
