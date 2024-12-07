#!/bin/bash 

##alias ls='ls -F --color=none'
alias rm='rm -v'

## fzf config: include dotfiles, ignore .git and node_modules
# COMMAND $(fzf)
# Ex: rm $(fzf)
alias myfzf="find . -type f -o -type d | grep -vE '/(\.git|node_modules|\.cargo|\.rustup|\.nvm|\.npm|\.local|\.emacs.d|\.doom.d|\.cache|go|\.vim|\.tmux|\.gnupg)/' | fzf-tmux"
alias nvimfzf="nvim \$(myfzf)"
alias cdfzf="cd \$(find . -type d -name '*' | grep -vE '/(\.git|node_modules|\.cargo|\.rustup|\.nvm|\.npm|\.local|\.emacs.d|\.doom.d|\.cache|go|\.vim|\.tmux|\.gnupg)' | fzf-tmux)"

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias tmuxsesh="~/Projects/dotfiles/.local/scripts/.tmux-sessionizer"
# bind '"\C-f": "~/Projects/dotfiles/tmux-sessionizer\C-m"'

# NOTE: Make 256colors work
# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-a-256-colour-terminal
alias tmux="tmux -2"
