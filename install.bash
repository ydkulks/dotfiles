## Create a symbolic link between the files in repo and local file
## ln -s [original file/dir] [link of file/dir]

function ask() {
  read -p "$1? (Y/n): " response
  [ -z "$response" ] || [ "$response" = "y" ]
}

dotfiles_path="${HOME}/Projects/dotfiles/"



if ask "Source some scripts"; then
  echo "-----------------Sourcing Scripts-------------------"

  # Hidden files in .local/scripts/ will be ignored
  scripts="$dotfiles_path.local/scripts/*"
  for script in $scripts; do
    if ask "Source $script" && [ -f "$script" ]; then
      echo "source $script" >> ${HOME}/.bashrc
    fi
  done
fi

if ask "Link config files"; then
  echo "---------------Creating Symbolic links---------------"

  symlink_file=".bashrc .vim/vimrc .vim/colors .config/tmux .config/starship.toml .config/nvim .config/npm .config/yazi"
  for files in $symlink_file; do
    if ask "Sync $files" && [[ ! -L "${HOME}/$files" ]]; then
      echo "$dotfiles_path$files --> ~/$files"
      ln -s "$dotfiles_path$files" "${HOME}/$files"
    fi
  done
fi
