################### Following code are custome ################################
export TERM=xterm-256color
##alias ls='ls -F --color=none'
alias rm='rm -v'
##source ~/.mycommand.sh;
##source ~/.mypkg.sh;
##export DISPLAY=localhost:0.0;
bold=$(tput bold);
grey=$(tput setaf 240);
blue=$(tput setaf 105);
green=$(tput setaf 84);
orange=$(tput setaf 166);
lightgrey=$(tput setaf 249);
red=$(tput setaf 160);
rpink=$(tput setaf 167);
reset=$(tput sgr0);

PS1="\[${green}\]"
PS1+="\u@\[${blue}\]\W: \[${grey}\]\w\n\[${reset}\]";
PS1+="\[${lightgrey}\]↪ ";
PS1+="\[${reset}\]";
export PS1;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
