{ ...}:
{

  programs.firefox= {
    enable = true;
    policies = {
      DNSOverHTTPS = {
        Enabled = false;
        Locked = true;
      };
    };
  };

  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "MassiveMigraine";
        email = "MassiveMigraine@gmail.com";
      };
    };
  };
}
