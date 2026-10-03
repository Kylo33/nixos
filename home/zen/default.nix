{
  inputs,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    profiles.default = {
      spacesForce = true;
      spaces = {
        "School" = {
          id = "8e2d3e7a-dcb0-4126-9dc9-d5cb5fc4e91c";
          position = 1;
          icon = "✏️";
        };
        "Competitive Programming" = {
          id = "42302859-00f4-4047-9b9b-5bb27c3213d0";
          position = 2;
          icon = "💻️";
        };
      };
    };
  };
}
