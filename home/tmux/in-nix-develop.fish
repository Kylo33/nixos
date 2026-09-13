#!/usr/bin/env fish

set -l parent_pid (tmux run-shell "echo #{pane_pid}")
set -l pane_pid (pgrep -P $parent_pid)

if test -z "$pane_pid"
    exit 0
end

strings /proc/$pane_pid/environ \
    | grep IN_NIX_SHELL \
    | string match -rq "IN_NIX_SHELL=(?<in_shell>.*)"

if test -n "$in_shell"
    if -n $argv[1]
        echo $argv[1]
    else
        echo "nix-develop"
    end
end
