{ pkgs, home-manager, ...}:
{
  environment = {
    systemPackages = with pkgs; [
      neovim
        lazygit
        wget
        git
        gh
        gcc
        ripgrep
        fd

        nodejs
        tree-sitter

        nvimpager
    ];

    variables = { 
      EDITOR = "nvim"; 
      VISUAL = "nvim"; 
      PAGER = "nvimpager";
    };
  };

  home-manager.users.apnda.home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  }; 
}
