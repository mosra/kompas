#!/bin/bash
prev=v0.1.1
curr=v0.1.2

git_log() {
    cd ../$1
    echo -e "\n* $2:\n"

    git log --oneline $prev..$curr | tee
}

echo -e "Kompas - changes from $(echo $prev | tr -d v) to $(echo $curr | tr -d v)"

git_log core "Core"
git_log plugins "Plugins"
git_log plugins-nonfree "Non-free plugins"
git_log qt "Qt GUI"
