{ pkgs, home-manager, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim
      lazygit
      wget
      git
      gh
      gcc
      ripgrep
      fd
  ];
  home-manager.users.apnda.home.file.".config/nvim" = {
    source = ./.;
    recursive = true;
  }; 
}
