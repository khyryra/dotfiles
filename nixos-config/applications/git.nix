{
  username,
  ...
}:

{
  home-manager.users.${username} = {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "Khyra";
          email = "122237202+khyryra@users.noreply.github.com";
        };

        init.defaultBranch = "main";
      };
    };

    programs.gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
  };
}
