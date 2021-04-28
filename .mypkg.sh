#!/bin/bash

function my_pkg()
{
    echo 'Installing packages' $1
    echo '==================='
    sudo apt update
    #sudo apt-get install python-pip
    #sudo apt-get install python3
    #pip3 install numpy
    #sudo apt-get install node.js
    #sudo apt-get install mono-runtime
    #sudo apt-get install mono-mcs
    #sudo apt-get install ffmpeg
}
