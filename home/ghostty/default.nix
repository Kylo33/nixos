{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ghostty
    nerd-fonts.jetbrains-mono
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Sonokai";
      font-family = "JetBrains Mono Nerd Font";
      # font-family = "Uiua386";
      font-feature = [
        "-calt"
      ];
    };
  };
}
