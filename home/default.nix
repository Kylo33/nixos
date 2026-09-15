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
  home.packages = let 
    search-nvim-lspconfig = pkgs.callPackage ./scripts/search-nvim-lspconfig/package.nix {};
  in with pkgs; [
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
    syncthing
    typst
    libqalculate

    search-nvim-lspconfig
  ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
