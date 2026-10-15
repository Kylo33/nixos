{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ghostty
    nerd-fonts.intone-mono
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Vague";
      font-family = "IntOneMono Nerd Font";
      font-feature = [
        "-calt"
      ];
      font-size = 14;
    };
  };
}
