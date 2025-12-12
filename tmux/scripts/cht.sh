#!/usr/bin/env bash

lang=`echo "python cpp java typescript nodejs" | tr ' ' '\n'`
utils=`echo "fzf find mv sed awk fd" | tr ' ' '\n'`

slectted=`printf "$lagn\n$utils" | fzf`
read -p "Query: " query

if printf $lang | grep -qs $slectted; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
