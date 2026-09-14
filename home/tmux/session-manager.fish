#!/usr/bin/env fish

set -l DIRS $HOME $HOME/Code $HOME/Code/cp

set -l selected $argv[1]
if test -z "$selected"
    set selected (fd . $DIRS --type d --max-depth 1\
        | string replace -r "^$HOME" "" \
        | sk --color=bw)

    if test -z "$selected"
        exit 0
    end

    set selected "$HOME$selected"
end

set -l selected_name (basename $selected)
set -l session_name (string replace -a '.' '_' $selected_name)

if not tmux has-session -t $session_name
    tmux new-session -ds $session_name -c $selected
    tmux select-window -t "$session_name:1"
end

tmux switch-client -t $session_name
