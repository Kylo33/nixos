{ pkgs, ... }:
{

  home.packages = with pkgs; [
    ghostty
    nerd-fonts.jetbrains-mono
  ];

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dark:Catppuccin Mocha,light:Catppuccin Latte";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
    };
  };
}
