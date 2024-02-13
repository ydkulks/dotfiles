#!/bin/bash 

## Convert markdown file to html
## Requirement: pandoc and a html template
function mdViewer(){
  if command -v pandoc &> /dev/null; then
    # Input is the path to markdown file
    local input="$1"
    # echo 'Viewing '$input' markdown file'
    pandoc --metadata title="MarkdownViewer" --standalone --template ${HOME}/Projects/dotfiles/pandoc_template.html $input -o ~/MarkdownViewer.html
    # cmd.exe /C start /mnt/c/MarkdownViewer.html #only for wsl setup
  else
    sudo apt-get install pandoc
  fi
}

function mdWatch(){
  local file="$1"
  local last_checksum

  last_checksum=$(md5sum "$file" | awk '{print $1}')

  # Loop indefinitely
  while true; do
    local current_checksum
    current_checksum=$(md5sum "$file" | awk '{print $1}')

    # Compare checksums to detect changes
    if [ "$current_checksum" != "$last_checksum" ]; then
      echo -e "File \e[32m$file\e[0m changed \e[38;5;242m[ $(date) ]\e[0m"
      mdViewer "$file"
      last_checksum="$current_checksum"
    fi
    # Sleep for a while before checking again
    sleep 5
  done
}
