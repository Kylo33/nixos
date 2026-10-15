{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      abbr -a e $EDITOR
      abbr -a cc "g++ -std=c++23 solve.cpp && ./a.out<1"
      abbr -a nd "nix develop -c fish"
      abbr -a gpf "git push --force-with-lease"
      abbr -a gcb "git checkout -b"
      abbr -a grh "git reset --hard origin/main"
      abbr -a gsu "git stash push"
      abbr -a gso "git stash pop"

      set __fish_git_prompt_showdirtystate 1
      fish_hybrid_key_bindings
    '';
    functions = {
      fish_prompt = ''
        set -l sep λ
        if test -n "$IN_NIX_SHELL"
            set sep 
        end

        echo -n "$(set_color blue)$(prompt_pwd) $(set_color bryellow)$sep$(set_color --reset) "
      '';
      fish_right_prompt = ''
        printf "%s%s%s" (set_color blue) (fish_vcs_prompt) (set_color --reset)
      '';
      kill_tmux = ''
        while tmux kill-session;;end
      '';
    };
  };
}
