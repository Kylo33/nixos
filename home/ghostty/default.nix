{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ghostty
    nerd-fonts.adwaita-mono
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dark:Gruvbox Dark,light:Gruvbox Light";
      font-family = "Adwaita Mono Nerd Font";
      font-feature = [
        "-calt"
      ];
      font-size = 14;
      custom-shader = [
        (toString ./cursor_warp.glsl)
      ];
    };
  };
}
