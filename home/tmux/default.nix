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
          "${lib.makeBinPath (with pkgs; [
            fd
            skim
          ])}"
        ];
      } (builtins.readFile ./session-manager.fish);
      in-nix-develop = writers.writeFishBin "in-nix-develop" (builtins.readFile ./in-nix-develop.fish);
    in
    [
      tmux
      open-github
      session-manager
      in-nix-develop
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
      set -g status-right "#(in-nix-develop nix-develop)"
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
