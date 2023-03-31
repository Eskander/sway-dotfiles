#!/bin/sh

WORKSPACE_INDEX=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.current_workspace' | cut -d : -f 1)

if [ $1 == "previous" ] && (( WORKSPACE_INDEX > 1 )); then
    (( WORKSPACE_INDEX-- ))
elif [ $1 == "next" ] && (( WORKSPACE_INDEX < 10 )); then
    (( WORKSPACE_INDEX++ ))
fi

swaymsg workspace number $WORKSPACE_INDEX
