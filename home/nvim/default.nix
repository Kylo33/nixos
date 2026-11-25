{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    gopls
    nixd
    nixfmt
    ruff
    ty
    lua-language-server
    tinymist
    fish-lsp
    ols
  ];

  programs.neovim =
    let
      gemini-vim-syntax = pkgs.vimUtils.buildVimPlugin {
        name = "gemini-vim-syntax";
        src = pkgs.fetchFromForgejo {
          domain = "tildegit.org";
          owner = "sloum";
          repo = "gemini-vim-syntax";
          rev = "596d1f36b386e5b2cc1af4f2f8285134626878d1";
          hash = "sha256-4Ma74KdAWtr00NNV0DbDL0SwY6s4d2Ok1HaUvVzCrMA=";
        };
      };
    in
    {
      enable = true;
      initLua = builtins.readFile ./init.lua;
      defaultEditor = true;
      plugins =
        with pkgs.vimPlugins;
        map (x: { plugin = x; }) [
          nvim-treesitter.withAllGrammars
          nvim-lspconfig
          mini-ai
          mini-extra
          mini-pairs
          mini-pick
          mini-surround
          oil-nvim
          kanso-nvim
          indent-o-matic
          typst-preview-nvim
          gemini-vim-syntax
        ];
    };
}
