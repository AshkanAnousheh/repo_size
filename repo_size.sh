#!/bin/bash

# turn this: 
# https://github.com/osrf/gazebo.git
# into this:
# curl https://api.github.com/repos/osrf/gazebo | grep "size"

server=$(echo $1 | cut -d'/' -f3 )
owner=$(echo $1 | cut -d'/' -f4 )
repo=$(echo $1 | cut -d'/' -f5 )
repo=$(echo $repo | cut -d'.' -f1 )

if [ $server == 'github.com' ]
then
    echo "SERVER: ${server}"
    echo "OWNER: ${owner}"
    echo "REPO: ${repo}"
    API_URL="https://api.github.com/repos/${owner}/${repo}"
    echo "URL: ${API_URL}"
    echo "curl ${API_URL} | grep "size""
    echo "============"
    curl ${API_URL} | grep "size"
    echo "============"
else
    echo "Wrong server!"
fi

read -p "Do you want to clone?" answer

if [ $answer == 'yes' ] || [ $answer == 'y' ]
then
    git clone $1
else
    echo "Bye"
fi