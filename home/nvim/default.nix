{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    nixd
    nixfmt
  ];

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
}
