{
  description = "Home Manager configuration of Jane Doe";

  inputs = {
# Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, ...}: 
    let 
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    lib = pkgs.lib;

    appname = "nvim";

    extraPackages = with pkgs; [
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

    nvimPath = lib.makeBinPath extraPackages;
  in
  {
    packages.${system} = {

      config = pkgs.linkFarm "${appname}-config" [
        {
          name = appname;
          path = lib.cleanSourceWith {
            src = ./.;
            filter = fpath: type: !lib.hasSuffix "init.lua" fpath;
          };
        }
      ];


        default = 
        let 
          config = self.packages.${system}.config;
        in
          pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped 
        {

        luaRcContent = builtins.readFile ./init.lua;
        wrapRc = true;

        pname = "my-nvim";
        version = "unstable";
        wrapperArgs = [
        "--set" "NVIM_APPNAME" "${appname}"
        "--prefix" "PATH" ":" "${nvimPath}"
        "--prefix" "XDG_CONFIG_DIRS" ":" "${config}"
        ];
      };
    };

    # nixosModules = {
    #   nvim = import ./nvim.nix;
    # };
  };
}
