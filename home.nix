{ config, pkgs, ... }:

{
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

    clang-tools
    nixd
    nixfmt
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

  programs.neovim = {
    enable = true;
    initLua = builtins.readFile ./init.lua;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      { plugin = nvim-treesitter.withAllGrammars; }
      { plugin = nvim-lspconfig; }
      { plugin = mini-ai; }
      { plugin = mini-extra; }
      { plugin = mini-pairs; }
      { plugin = mini-pick; }
      { plugin = mini-surround; }
      { plugin = blink-cmp; }
      { plugin = oil-nvim; }
      { plugin = sonokai; }
      { plugin = indent-o-matic; }
    ];
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

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
