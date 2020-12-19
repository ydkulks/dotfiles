#Following code are custome
source ~/.mycommand.sh;
export DISPLAY=localhost:0.0;
bold=$(tput bold);
grey=$(tput setaf 240);
blue=$(tput setaf 27);
green=$(tput setaf 34);
orange=$(tput setaf 166);
lightgrey=$(tput setaf 249);
red=$(tput setaf 160);
rpink=$(tput setaf 167);
reset=$(tput sgr0);

PS1="\[${orange}\]\u@\[${rpink}\]\W:\[${grey}\]\w\n\[${reset}\]";
PS1+="$ \[${lightgrey}\]";
PS1+="\[${reset}\]";
export PS1;

