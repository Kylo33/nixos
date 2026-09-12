#!/usr/bin/env fish

# Open the GitHub repository of the current pane

cd (tmux run-shell "echo #{pane_current_path}")

set -l remote origin
set -l origin_url (git remote get-url $remote)

string match -rq "git@github.com:(?<profile>.*)/(?<repo>.*)\.git" $origin_url

open "https://github.com/$profile/$repo"
