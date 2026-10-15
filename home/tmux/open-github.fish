#!/usr/bin/env fish

# Open the GitHub repository of the current pane

cd (tmux run-shell "echo #{pane_current_path}")

set -l remote origin
set -l origin_url (git remote get-url $remote)

if string match -rq "git@github.com:(?<profile>.*)/(?<repo>.*)\.git" $origin_url;
    open "https://github.com/$profile/$repo"
else if string match -rq "https://git.devmail.group/(?<profile>.*)/(?<repo>.*)\.git" $origin_url;
    open "https://git.devmail.group/$profile/$repo"
end
