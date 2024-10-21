#!/bin/bash 

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export TERM=xterm-256color

export NVM_DIR="$XDG_DATA_HOME"/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$XDG_DATA_HOME/cargo/env"

## npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

## Golang env
#sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.11.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

## XDG Base Directory (Clean $HOME directory)
export NVM_DIR="$XDG_DATA_HOME"/nvm
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TMUX_CONFIG="~/.config/tmux/tmux.conf"
export GOPATH="$XDG_DATA_HOME"/go
export PYTHON_HISTORY="${XDG_STATE_HOME}"/python/history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

export OLLAMA_MODELS=$XDG_DATA_HOME/ollama/models
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
