{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fish_config prompt choose scales

      abbr -a e $EDITOR
    '';
  };
}
