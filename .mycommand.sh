#!/bin/bash 

#For creating python project
function pyproject(){
    #printing message on terminal
    #echo 'Creating python project for python' $1
    #going into py directory
    #cd /mnt/e/
    #creating a new file named 'New'
    #mkdir New
    #going into that directory
    #cd New
    #creating 'New.py' file
    #touch New.py
    #initializing git 
    #git init
    #printing message on terminal
    #echo 'Created python project in /mnt/e/'
    #opening 'New.py' file through vim
    #vim New.py
}

#For creating web projects
function webproject(){
    #printing message on terminal
    #echo 'Creating web project for web' $1
    #going into web directory
    #cd /mnt/e/code/web/
    #creating new directory named 'New'
    #mkdir New
    #going into that directory
    #cd New
    #creating 'index.html''style.css''script.js' files
    echo '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="style.css">
            <title>Document</title>
    </head>
    <body>
          <h1>Hello World</h1>
          <script src="script.js"></script>          
    </body>
    </html>'>/mnt/e/web/New/index.html
    echo 'alert("Hello world");'>/mnt/e/web/New/script.js
    echo 'html{
        scroll-behavior:smooth;
    }
    body{
        background-color:rgb(28, 31, 47);
        margin: 0 -1px;
    }
    '>/mnt/e/web/New/style.css
    #initializing git
    #git init
    #printing message on terminal
    #echo 'Created web project in /mnt/e/web/'
    #opening 'index.html' file through vim
    #vim index.html
}


#For printing the process of shell automation in terminal
function auto_process(){
    echo '1)Create a dot(.) file in ~/ directory.Ex:- .mycommand.sh' $1
    echo '2)Write required function with #!/bin/bash line at the top'
    echo '3)Type ~/.<filename>.sh in .bashrc file'
    echo '4)Access the required function through terminal to automate the function'
}

function codeTime(){
	#echo 'Teleporting to CODE_BASE...'
	#cd /mnt/e/
}

