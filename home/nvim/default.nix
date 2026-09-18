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
    uiua
    fish-lsp
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
      { plugin = zenbones-nvim; }
      { plugin = indent-o-matic; }
      { plugin = typst-preview-nvim; }
    ];
  };
}
