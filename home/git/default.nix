{ ... }:
{
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
}
