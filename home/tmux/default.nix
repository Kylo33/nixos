{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    let
      open-github = writers.writeFishBin "open-github" (builtins.readFile ./open_github.fish);
    in
    [
      tmux
      open-github
    ];

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    extraConfig = ''
      set -a terminal-features "tmux-color256:RGB"
      set -g renumber-windows

      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
      set -g status-right ""
      set -g status-left "#S"

      set -g window-status-current-style "fg=blue,bold"

      bind r source-file "~/.config/tmux/tmux.conf"
      bind g run-shell open-github
    '';
  };
}
