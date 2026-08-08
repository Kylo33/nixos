{ config, pkgs, ... }:

{
  imports = [
    ./nvim
  ];

  home.username = "renng";
  home.homeDirectory = "/home/renng";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    gh
    ghostty
    keepassxc
    nerd-fonts.jetbrains-mono
    obsidian
    syncthing
    tmux
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_config prompt choose scales

      abbr -a e $EDITOR
    '';
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "Sonokai";
      font-family = "JetBrains Mono Nerd Font";
      font-feature = [
        "-calt"
      ];
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kylo33";
        email = "56988649+Kylo33@users.noreply.github.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };


  services.syncthing = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
  };

  home.stateVersion = "26.05";
}
