{ config, pkgs, username, ... }:

{
  imports = [
    ./nvim
    ./fish
    ./ghostty
    ./tmux
    ./git
    ./xdg
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
    himalaya
    keepassxc
    obs-studio
    obsidian
    ocaml
    syncthing
    typst
  ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
