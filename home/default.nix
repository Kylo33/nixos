{
  pkgs,
  username,
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
    ./claude
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Packages that should be installed to the user profile.
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

      search-nvim-lspconfig
      forgejo-cli
      group-assign
    ];

  services.syncthing = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
