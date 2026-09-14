{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    let
      open-github = writers.writeFishBin "open-github" (builtins.readFile ./open-github.fish);
      session-manager = writers.writeFishBin "session-manager" {
        makeWrapperArgs = [
          "--prefix"
          "PATH"
          ":"
          "${lib.makeBinPath (
            with pkgs;
            [
              fd
              skim
            ]
          )}"
        ];
      } (builtins.readFile ./session-manager.fish);
    in
    [
      tmux
      open-github
      session-manager
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

      unbind o
      unbind f
      unbind p
      unbind i

      bind o switch-client -l
      bind r source-file "~/.config/tmux/tmux.conf"
      bind g run-shell open-github

      bind f run-shell "tmux new-window session-manager"
      bind p run-shell "tmux new-window session-manager ~/Code/cp/practice"
      bind i run-shell "tmux new-window session-manager ~/nixos"
    '';
  };
}
