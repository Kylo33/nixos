{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Renn Gilbert";
        email = "me@renntg.com";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
      credential.helper = "store";
    };
  };
}
