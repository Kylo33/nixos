{ pkgs, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = pkgs.lib.genAttrs [
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/about"
      "x-scheme-handler/unknown"
    ] (_: "firefox.desktop");
  };
}
