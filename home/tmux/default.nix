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
  };
}
