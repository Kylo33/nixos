{
  lib,
  writers,
  gh,
  skim,
  wl-clipboard,
}:
(writers.writeFishBin "search-nvim-lspconfig" {
  makeWrapperArgs = [
    "--prefix"
    "PATH"
    ":"
    "${lib.makeBinPath [
      gh
      skim
      wl-clipboard
    ]}"
  ];
} (builtins.readFile ./search-nvim-lspconfig.fish))
