{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tmux
  ];

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    extraConfig = ''
      set -g renumber-windows
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
    '';
  };
}
