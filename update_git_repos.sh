#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.

# Check for modification
if [ -n "$1" ]; then
    echo -e "\n\033[1mChecking status of the repositories...\033[0m\n";
else
    echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n";
fi

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo -e "\033[33m"+$i+"\033[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    if [ -n "$1" ]; then
        git fetch;
        git status;
    else
        # finally pull
        git pull origin master;
    fi

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done


echo -e "\n\033[32mComplete!\033[0m\n"
