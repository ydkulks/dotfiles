## VI / Vim mode in bash
set -o vi # bind -P : Command to list all key bindings in which ever more you are currently in

## Auto "cd" when entering just a path
shopt -s autocd

## Starship (custom prompt)
eval "$(starship init bash)" #curl -sS https://starship.rs/install.sh | sh

## Case-insensitive tab completion
bind 'set completion-ignore-case on'
