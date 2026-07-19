## Create a symbolic link between the files in repo and local file
## ln -s [original file/dir] [link of file/dir]

function ask() {
  read -p "$1? (Y/n): " response
  [ -z "$response" ] || [ "$response" = "y" ]
}

dotfiles_path="${HOME}/Projects/dotfiles/"

if ask "Source some scripts"; then
  echo "-----------------Sourcing Scripts-------------------"

  # NOTE: Determine the current shell's RC file
  current_shell=$(basename "$SHELL")
  rc_file=""

  case "$current_shell" in
    "bash")
      rc_file="${HOME}/.bashrc"
      ;;
    "zsh")
      rc_file="${HOME}/.zshrc"
      ;;
    *)
      echo "Warning: Unsupported shell '$current_shell'. Skipping script sourcing."
      exit 1
      ;;
  esac

  if [ -z "$rc_file" ]; then
    echo "Error: Could not determine RC file for shell '$current_shell'."
    exit 1
  fi

  # NOTE: Hidden files in .local/scripts/ will be ignored
  scripts="$dotfiles_path.local/scripts/*"
  for script in $scripts; do
    if ask "Source $script" && [ -f "$script" ]; then
      echo "source $script" >> "$rc_file"
      echo "Sourced $script into $rc_file"
    fi
  done
fi

if ask "Link config files"; then
  echo "---------------Creating Symbolic links---------------"

  symlink_file=".bashrc .zshrc .vim/vimrc .vim/colors .config/tmux .config/starship.toml .config/nvim .config/npm .config/yazi"
  for files in $symlink_file; do
    if ask "Sync $files" && [[ ! -L "${HOME}/$files" ]]; then
      echo "$dotfiles_path$files --> ~/$files"
      ln -s "$dotfiles_path$files" "${HOME}/$files"
    fi
  done
fi
