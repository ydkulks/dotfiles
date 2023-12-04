#!/bin/bash

function my_pkg()
{
    echo 'Installing packages' $1
    echo '==================='
    sudo apt update
		sudo apt upgrade
		#sudo apt-get install build-essentials
    #sudo apt-get install python-pip
    #sudo apt-get install python3
    #pip3 install numpy
    #sudo apt-get install node.js
		#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    #sudo apt-get install mono-runtime
    #sudo apt-get install mono-mcs
    #sudo apt-get install ffmpeg
    #sudo apt-get install tree
		#sudo apt-get install ripgrep #Requirement for telescope.nvim
		# # Install Github for CLI - gh
		# type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
		# curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
		# && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
		# && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
		# && sudo apt update \
		# && sudo apt install gh -y
		
		# # type "gh auth login" to add updated credentials

		# curl -sS https://starship.rs/install.sh | sh

		# # Copy text to windows clipboard
		# # Download https://github.com/equalsraf/win32yank/releases and extract zip file
		# # chmod +x win32yank.exe && sudo cp win32yank.exe /usr/local/bin
}
