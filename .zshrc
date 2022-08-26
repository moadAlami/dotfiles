# Enable colors and change prompt:
autoload -U colors && colors


source  /home/mouad/github/zsh-git-prompt/zshrc.sh
# PROMPT='%B%{$fg[red]%}[%{$fg[yellow]%}Hollow%{$fg[green]%}@%{$fg[blue]%}Soul %{$fg[magenta]%}%~%{$fg[red]%}]%b$(git_super_status)%{$reset_color%}$%b '
PROMPT='%B%{$fg[red]%}[% %{$fg[magenta]%}%~%{$fg[red]%}]%b$(git_super_status)%{$reset_color%}$%b '

export _JAVA_AWT_WM_NONREPARENTING=1

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

setopt correct

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use ranger to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# rancd () {
#     tmp="$(mktemp)"
#     ranger --choosedir="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         if [ -d "$dir" ]; then
#             if [ "$dir" != "$(pwd)" ]; then
#                 cd "$dir"
#             fi
#         fi
#     fi
# }

bindkey -s '^o' 'lfcd\n'  # zsh

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -Uz compinit
compinit

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# export PATH="/home/mouad/miniconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mouad/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mouad/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mouad/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mouad/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

