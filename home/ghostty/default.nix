{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ghostty
    nerd-fonts.adwaita-mono
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Kanso Ink";
      font-family = "AdwaitaMono Nerd Font";
      font-size = 14;
    };
  };
}
