# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

## Display pokemon pixel art
# pokemon-colorscripts --no-title -r 1-8

## Auto "cd" when entering just a path
setopt  autocd

## Aliases
alias ls='ls --color'

## Starship (custom prompt)
eval "$(starship init zsh)" #curl -sS https://starship.rs/install.sh | sh

## Download Zinit, if it's not there yet
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

## Source Zinit
source "${ZINIT_HOME}/zinit.zsh"

## Powerlevel10k (prompt customization)
# zinit ice depth=1; zinit light romkatv/powerlevel10k

## Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## Load completions
autoload -U compinit && compinit

## Fzf Shell integration
eval "$(fzf --zsh)"

## History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # Does not add command to history if prefixed with SPACE
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## Keybindings
bindkey -v # Vim mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept

bindkey '^L' clear-screen

## Cursor shape
# 0  ⇒  blinking block.
# 1  ⇒  blinking block (default).
# 2  ⇒  steady block.
# 3  ⇒  blinking underline.
# 4  ⇒  steady underline.
# 5  ⇒  blinking bar, xterm.
# 6  ⇒  steady bar, xterm.
_fix_cursor() {
  echo -ne '\e[1 q'
}
precmd_functions+=(_fix_cursor)

## Tab-completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

## Source custom shell scripts
source /home/yd/Projects/dotfiles/.local/scripts/pandoc.sh
source /home/yd/Projects/dotfiles/.local/scripts/alias.sh
source /home/yd/Projects/dotfiles/.local/scripts/exports.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/yd/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/yd/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
