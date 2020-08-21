# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
