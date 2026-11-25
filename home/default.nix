{
  pkgs,
  username,
  inputs,
  ...
}:
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

  home.packages =
    let
      search-nvim-lspconfig = pkgs.callPackage ./scripts/search-nvim-lspconfig/package.nix { };
      group-assign =
        with pkgs;
        buildGoModule {
          name = "group-assign";

          src = fetchFromForgejo {
            domain = "git.devmail.group";
            owner = "renn";
            repo = "group-assign";
            rev = "efe894eb27976e35d5c5038231cd4767eb4aa3ce";
            hash = "sha256-+tJy2JVWOOyVT7wTXkmlJqmPZZWMoxQxuqOBapn0sic=";
          };

          vendorHash = null;
        };
    in
    with pkgs;
    [
      anki
      cheese
      discord
      easyeffects
      gcc
      gh
      google-chrome
      himalaya
      httpie
      jq
      keepassxc
      libqalculate
      obs-studio
      obsidian
      syncthing
      typst
      zathura
      inkscape
      clojure
      zip
      unzip
      element-desktop
      direnv
      nix-index
      comma
      zig
      dune
      gnumake
      odin
      hexyl
      lagrange
      hyperfine

      search-nvim-lspconfig
      forgejo-cli
      group-assign
    ];

  services.syncthing = {
    enable = true;
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options.dark = true;
  };

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    silent = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "26.05";
}
