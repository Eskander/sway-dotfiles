#!/bin/sh

CUR_WORKSPACE_INDEX=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.current_workspace' | cut -d : -f 1)

if [ $1 == "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE_INDEX - 1)
elif [ $1 == "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE_INDEX + 1)
fi

if [ $TO_WORKSPACE -eq 11 ]; then
    TO_WORKSPACE=10
elif [ $TO_WORKSPACE -eq 0 ]; then
    TO_WORKSPACE=1
fi

swaymsg workspace number $TO_WORKSPACE
