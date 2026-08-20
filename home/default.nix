{ config, pkgs, username, ... }:

{
  imports = [
    ./nvim
    ./fish
    ./ghostty
    ./tmux
    ./git
    ./xdg
    ./claude
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    anki
    cheese
    discord
    easyeffects
    gcc
    gh
    google-chrome
    keepassxc
    obsidian
    syncthing
  ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
