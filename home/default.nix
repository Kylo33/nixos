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
    gh
    keepassxc
    obsidian
    syncthing
  ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
