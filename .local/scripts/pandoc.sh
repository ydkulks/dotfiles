#!/bin/bash 

## Convert markdown file to html
## Requirement: pandoc and a html template
function mdViewer(){
  if command -v pandoc &> /dev/null; then
    # Input is the path to markdown file
    local input="$1"
    echo 'Viewing '$input' markdown file'
    pandoc --metadata title="MarkdownViewer" --standalone --template ${HOME}/Projects/dotfiles/pandoc_template.html $input -o ~/MarkdownViewer.html
    # cmd.exe /C start /mnt/c/MarkdownViewer.html #only for wsl setup
  else
    sudo apt-get install pandoc
  fi
}
