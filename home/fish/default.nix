{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      abbr -a e $EDITOR
      abbr -a cc "g++ -std=c++23 solve.cpp && ./a.out<1"
    '';
    functions = {
      fish_prompt = ''
        set -l last_status $status

        set -l stat
        if test $last_status -ne 0
            set stat (set_color red)" ($last_status)"
        end

        printf "%s%s%s %sλ %s" (set_color blue) (prompt_pwd) "$stat" (set_color bryellow) (set_color --reset)
      '';
      fish_right_prompt = ''
        printf "%s%s%s" (set_color blue) (fish_vcs_prompt) (set_color --reset)
      '';
    };
  };
}
